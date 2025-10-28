package git

import (
	"fmt"
	"path/filepath"
)

// Storage defines where repositories are stored.
type Storage interface {
	BasePath() string
	RepoPath(owner, name string) string
}

type FileSystemStorage struct {
	root string
}

func NewFileSystemStorage(root string) *FileSystemStorage {
	return &FileSystemStorage{root: root}
}

func (s *FileSystemStorage) BasePath() string {
	return s.root
}

func (s *FileSystemStorage) RepoPath(owner, name string) string {
	return filepath.Join(s.root, owner, fmt.Sprintf("%s.git", name))
}
