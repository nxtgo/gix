package git

import (
	"bytes"
	"fmt"
	"io"
	"os"
	"path/filepath"

	gitlib "github.com/go-git/go-git/v6"
	"github.com/go-git/go-git/v6/plumbing"
)

// Repository represents a Git repository.
type Repository struct {
	Path  string
	Name  string
	Owner string
}

// CreateRepo initializes a new bare repository for a user.
func CreateRepo(basePath, owner, name string) (*Repository, error) {
	repoPath := filepath.Join(basePath, owner, fmt.Sprintf("%s.git", name))

	if err := os.MkdirAll(filepath.Dir(repoPath), 0o755); err != nil {
		return nil, fmt.Errorf("failed to create parent dir: %w", err)
	}

	// if already exists
	if _, err := os.Stat(repoPath); err == nil {
		return nil, fmt.Errorf("repository already exists: %s", repoPath)
	}

	_, err := gitlib.PlainInit(repoPath, true)
	if err != nil {
		return nil, fmt.Errorf("failed to init repo: %w", err)
	}

	return &Repository{
		Path:  repoPath,
		Name:  name,
		Owner: owner,
	}, nil
}

// OpenRepo opens an existing repository.
func OpenRepo(basePath, owner, name string) (*Repository, error) {
	repoPath := filepath.Join(basePath, owner, fmt.Sprintf("%s.git", name))
	if _, err := os.Stat(repoPath); os.IsNotExist(err) {
		return nil, fmt.Errorf("repository not found: %s", repoPath)
	}
	return &Repository{
		Path:  repoPath,
		Name:  name,
		Owner: owner,
	}, nil
}

// AdvertiseRefs emulates `git-upload-pack --advertise-refs`
func (r *Repository) AdvertiseRefs(service string) ([]byte, error) {
	if service != "git-upload-pack" && service != "git-receive-pack" {
		return nil, fmt.Errorf("unsupported service: %s", service)
	}

	repo, err := gitlib.PlainOpen(r.Path)
	if err != nil {
		return nil, fmt.Errorf("failed to open repo: %w", err)
	}

	var buf bytes.Buffer

	fmt.Fprintf(&buf, "# service=%s\n", service)
	buf.WriteString("0000")

	iter, err := repo.References()
	if err != nil {
		return nil, fmt.Errorf("failed to list references: %w", err)
	}
	defer iter.Close()

	err = iter.ForEach(func(ref *plumbing.Reference) error {
		if ref.Type() == plumbing.HashReference {
			fmt.Fprintf(&buf, "%s %s\n", ref.Hash().String(), ref.Name().String())
		}
		return nil
	})
	if err != nil && err != io.EOF {
		return nil, fmt.Errorf("failed to iterate references: %w", err)
	}

	return buf.Bytes(), nil
}
