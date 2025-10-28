package config

import (
	"os"
)

type Config struct {
	Addr string
	Env  string
}

func Load() *Config {
	addr := os.Getenv("GIX_ADDR")
	if addr == "" {
		addr = ":3000"
	}

	env := os.Getenv("GIX_ENV")
	if env == "" {
		env = "dev"
	}

	return &Config{
		Addr: addr,
		Env:  env,
	}
}
