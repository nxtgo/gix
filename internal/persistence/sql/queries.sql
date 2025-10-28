-- USERS

-- name: CreateUser :exec
INSERT INTO users (
    id, username, full_name, email, passwd, avatar, desc_user, 
    num_followers, num_following, num_stars, num_teams, num_members
)
VALUES (
    :id, :username, :full_name, :email, :passwd, :avatar, :desc_user, 
    :num_followers, :num_following, :num_stars, :num_teams, :num_members
);

-- name: UpdateUser :exec
UPDATE users SET
    username = :username,
    full_name = :full_name,
    email = :email,
    passwd = :passwd,
    avatar = :avatar,
    desc_user = :desc_user,
    num_followers = :num_followers,
    num_following = :num_following,
    num_stars = :num_stars,
    num_teams = :num_teams,
    num_members = :num_members,
    updated_at = CURRENT_TIMESTAMP
WHERE id = :id;

-- name: GetUserByID :one
SELECT 
    id, username, full_name, email, avatar, desc_user, 
    num_followers, num_following, num_stars, num_repos, num_teams, 
    num_members, updated_at, created_at
FROM users
WHERE id = :id;

-- name: GetUserByUsername :one
SELECT 
    id, username, full_name, email, avatar, desc_user, 
    num_followers, num_following, num_stars, num_repos, num_teams, 
    num_members, updated_at, created_at
FROM users
WHERE username = :username;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = :id;

-- name: GetAllUsers :many
SELECT 
    id, username, full_name, email, avatar, desc_user, 
    num_followers, num_following, num_stars, num_repos, num_teams, 
    num_members, updated_at, created_at
FROM users;

-- REPOSITORIES

-- name: CreateRepository :exec
INSERT INTO repositories (
    id, owner_id, lower_name, name, description, website, default_branch, size,
    num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, 
    num_closed_pulls, num_milestones, num_closed_milestones, is_private, 
    is_unlisted, is_bare, is_mirror, enable_wiki, allow_public_wiki, 
    enable_external_wiki, external_wiki_url, enable_issues, allow_public_issues, 
    enable_external_tracker, external_tracker_url, external_tracker_format, 
    external_tracker_style, enable_pulls, pulls_ignore_whitespace, 
    pulls_allow_rebase, is_fork, fork_id
)
VALUES (
    :id, :owner_id, :lower_name, :name, :description, :website, :default_branch, :size,
    :num_watches, :num_stars, :num_forks, :num_issues, :num_closed_issues, :num_pulls, 
    :num_closed_pulls, :num_milestones, :num_closed_milestones, :is_private, 
    :is_unlisted, :is_bare, :is_mirror, :enable_wiki, :allow_public_wiki, 
    :enable_external_wiki, :external_wiki_url, :enable_issues, :allow_public_issues, 
    :enable_external_tracker, :external_tracker_url, :external_tracker_format, 
    :external_tracker_style, :enable_pulls, :pulls_ignore_whitespace, 
    :pulls_allow_rebase, :is_fork, :fork_id
);

-- name: UpdateRepository :exec
UPDATE repositories SET
    lower_name = :lower_name,
    name = :name,
    description = :description,
    website = :website,
    default_branch = :default_branch,
    size = :size,
    num_watches = :num_watches,
    num_stars = :num_stars,
    num_forks = :num_forks,
    num_issues = :num_issues,
    num_closed_issues = :num_closed_issues,
    num_pulls = :num_pulls,
    num_closed_pulls = :num_closed_pulls,
    num_milestones = :num_milestones,
    num_closed_milestones = :num_closed_milestones,
    is_private = :is_private,
    is_unlisted = :is_unlisted,
    is_bare = :is_bare,
    is_mirror = :is_mirror,
    enable_wiki = :enable_wiki,
    allow_public_wiki = :allow_public_wiki,
    enable_external_wiki = :enable_external_wiki,
    external_wiki_url = :external_wiki_url,
    enable_issues = :enable_issues,
    allow_public_issues = :allow_public_issues,
    enable_external_tracker = :enable_external_tracker,
    external_tracker_url = :external_tracker_url,
    external_tracker_format = :external_tracker_format,
    external_tracker_style = :external_tracker_style,
    enable_pulls = :enable_pulls,
    pulls_ignore_whitespace = :pulls_ignore_whitespace,
    pulls_allow_rebase = :pulls_allow_rebase,
    is_fork = :is_fork,
    fork_id = :fork_id,
    updated_at = CURRENT_TIMESTAMP
WHERE id = :id;

-- name: GetRepositoryByID :one
SELECT * FROM repositories
WHERE id = :id;

-- name: GetRepositoriesByOwnerID :many
SELECT * FROM repositories
WHERE owner_id = :owner_id;

-- name: DeleteRepository :exec
DELETE FROM repositories
WHERE id = :id;

-- name: GetAllRepositories :many
SELECT * FROM repositories;