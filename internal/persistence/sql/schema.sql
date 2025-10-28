CREATE TABLE IF NOT EXISTS users {
    id BIGINT NOT NULL PRIMARY KEY,
    username TEXT NOT NULL,
    full_name TEXT NOT NULL,

    email TEXT NOT NULL,
    passwd TEXT NOT NULL,

    avatar TEXT NOT NULL,
    desc_user    TEXT,

    num_followers  INTEGER DEFAULT 0, 
    num_following  INTEGER NOT NULL DEFAULT 0,
    num_stars      INTEGER DEFAULT 0,

    num_repos      INTEGER DEFAULT 0,
    num_teams      INTEGER DEFAULT 0,
    num_members    INTEGER DEFAULT 0,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
}

CREATE UNIQUE INDEX IF NOT EXISTS idx_users_username
ON users(username);

CREATE TABLE IF NOT EXISTS repositories {
    id BIGINT NOT NULL PRIMARY KEY,
    owner_id BIGINT NOT NULL,
    lower_name TEXT NOT NULL,
    name TEXT,
    description TEXT,
    website TEXT
    default_branch TEXT
    size BIGINT NOT NULL,

    -- COUNTERS 
    num_watches            INTEGER,
    num_stars              INTEGER,
    num_forks               INTEGER,
    num_issues              INTEGER,
    num_closed_issues       INTEGER,
    num_pulls               INTEGER,
    num_closed_pulls        INTEGER,
    num_milestones          INTEGER,
    num_closed_milestones   INTEGER,

    is_private             BOOLEAN,
    is_unlisted            BOOLEAN,
    is_bare                BOOLEAN,
    is_mirror              BOOLEAN,
    
    enable_wiki            BOOLEAN,
    allow_public_wiki      BOOLEAN,
    enable_external_wiki   BOOLEAN,
    external_wiki_url      TEXT,
    enable_issues          BOOLEAN,
    allow_public_issues    BOOLEAN,
    enable_external_tracker BOOLEAN,

    external_tracker_url    TEXT,
    external_tracker_format TEXT,
    external_tracker_style TEXT,
    enable_pulls           BOOLEAN,
    pulls_ignore_whitespace BOOLEAN,
    pulls_allow_rebase     BOOLEAN,
    is_fork                BOOLEAN,
    fork_id                INTEGER,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_owner
        FOREIGN KEY (owner_id) 
        REFERENCES users (id)
        ON DELETE CASCADE
}

CREATE INDEX IF NOT EXISTS idx_repositories_owner_id
ON repositories(owner_id);