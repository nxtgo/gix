package logging

import (
	"log/slog"
	"os"
)

func New(env string) *slog.Logger {
	var handler slog.Handler

	if env == "dev" {
		handler = slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelDebug})
	} else {
		handler = slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelInfo})
	}

	return slog.New(handler)
}
