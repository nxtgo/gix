package server

import (
	"github.com/julienschmidt/httprouter"
	"gix.st/internal/handlers"
)

func newRouter() *httprouter.Router {
	r := httprouter.New()

	r.GET("/health", handlers.Health)

	// repos
	r.POST("/api/repos", handlers.CreateRepo)
	r.GET("/api/:username/:repo/info/refs", handlers.RepoRefs)

	return r
}
