package handlers

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/julienschmidt/httprouter"
	"gix.st/internal/git"
)

type createRepoRequest struct {
	Owner string `json:"owner"`
	Name  string `json:"name"`
}

func CreateRepo(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	var req createRepoRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "invalid JSON", http.StatusBadRequest)
		return
	}

	storage := git.NewFileSystemStorage("data/repos")

	repo, err := git.CreateRepo(storage.BasePath(), req.Owner, req.Name)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(map[string]string{
		"message": "repository created",
		"path":    repo.Path,
	})
}

func RepoRefs(w http.ResponseWriter, r *http.Request, p httprouter.Params) {
	username := p.ByName("username")
	repoName := p.ByName("repo")
	service := r.URL.Query().Get("service")

	if username == "" || repoName == "" {
		http.Error(w, "missing username or repo name", http.StatusBadRequest)
		return
	}
	if service != "git-upload-pack" && service != "git-receive-pack" {
		http.Error(w, "invalid service", http.StatusBadRequest)
		return
	}

	repo, err := git.OpenRepo("data/repos", username, repoName)
	if err != nil {
		http.Error(w, fmt.Sprintf("failed to open repo: %v", err), http.StatusNotFound)
		return
	}

	data, err := repo.AdvertiseRefs(service)
	if err != nil {
		http.Error(w, fmt.Sprintf("failed to advertise refs: %v", err), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", fmt.Sprintf("application/x-%s-advertisement", service))
	w.WriteHeader(http.StatusOK)
	w.Write(data)
}
