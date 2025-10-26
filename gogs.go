//go:build go1.18

// Copyright 2014 The Gogs Authors. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

// Gogs is a painless self-hosted Git Service.
package main

import (
	"os"

	"github.com/urfave/cli/v2"
	log "unknwon.dev/clog/v2"

	"gogs.io/gogs/internal/cmd"
	"gogs.io/gogs/internal/conf"
)

func init() {
	conf.App.Version = "0.1.0+dev"
}

func main() {
	if conf.IsWindowsRuntime() {
		panic("gtfo lol")
	}

	app := cli.NewApp()
	app.Name = "gix"
	app.Usage = "the git service"
	app.Version = conf.App.Version
	app.Commands = cli.Commands{
		&cmd.Web,
		&cmd.Serv,
		&cmd.Hook,
		&cmd.Cert,
		&cmd.Admin,
		&cmd.Import,
		&cmd.Backup,
		&cmd.Restore,
	}
	if err := app.Run(os.Args); err != nil {
		log.Fatal("Failed to start application: %v", err)
	}
}
