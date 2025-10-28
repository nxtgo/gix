package server

import (
	"github.com/julienschmidt/httprouter"
	"gix.st/internal/handlers"
)

func newRouter() *httprouter.Router {
	r := httprouter.New()

	r.GET("/health", handlers.Health)

	return r
}
