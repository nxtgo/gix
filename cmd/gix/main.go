package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"
	"time"

	"gix.st/internal/config"
	"gix.st/internal/logging"
	"gix.st/internal/server"
)

var Version = "dev"

func main() {
	cfg := config.Load()
	logger := logging.New(cfg.Env)
	logger.Info("starting gix", "version", Version)

	srv := server.New(cfg, logger)

	go func() {
		logger.Info("starting server", "addr", cfg.Addr)
		if err := srv.ListenAndServe(); err != nil {
			logger.Error("server error", "error", err)
		}
	}()

	stop := make(chan os.Signal, 1)
	signal.Notify(stop, os.Interrupt, syscall.SIGTERM)
	<-stop

	logger.Info("shutting down server...")

	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	if err := srv.Shutdown(ctx); err != nil {
		logger.Error("graceful shutdown failed", "error", err)
	} else {
		logger.Info("server stopped cleanly")
	}
}
