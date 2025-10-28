package server

import (
	"context"
	"log/slog"
	"net/http"
	"time"

	"gix.st/internal/config"
)

type Server struct {
	httpServer *http.Server
	logger     *slog.Logger
}

func New(cfg *config.Config, logger *slog.Logger) *Server {
	router := newRouter()

	httpSrv := &http.Server{
		Addr:              cfg.Addr,
		Handler:           router,
		ReadHeaderTimeout: 5 * time.Second,
	}

	return &Server{
		httpServer: httpSrv,
		logger:     logger,
	}
}

func (s *Server) ListenAndServe() error {
	return s.httpServer.ListenAndServe()
}

func (s *Server) Shutdown(ctx context.Context) error {
	s.logger.Info("shutting down")
	return s.httpServer.Shutdown(ctx)
}
