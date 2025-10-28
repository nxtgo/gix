package git

import "errors"

var (
	ErrRepoExists   = errors.New("repository already exists")
	ErrRepoNotFound = errors.New("repository not found")
)
