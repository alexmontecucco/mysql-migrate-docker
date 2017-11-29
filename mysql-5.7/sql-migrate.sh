#!/usr/bin/env bash

# Simple bash file to use github.com/rubenv/sql-migrate files with the official mysql docker image

# Remove all the lines between the migrate down section and either migrate up section or EOF
# then pipes the result to mysql
sql_migrate_clean() {
  sed '/^-- +migrate Down/,/^-- +migrate Up/d' "$1" | ${mysql[@]}
}

# Scan the dir looking for sql file and goes recursively through sub folders
scan() {
  DIR="$1"
  SUB_DIR=()

  echo "$0: running in dir: $DIR"
  for f in "$DIR"/*; do
    if [ -d "$f" ]; then
      SUB_DIR+=("$f")
    else
      case "$f" in
      *.sh)
        echo "$0: running $f"
        . "$f" ;;
      *.sql)
        echo "$0: running $f"
        sql_migrate_clean "$f" ;;
      *)
        echo "$0: ignoring $f" ;;
      esac
    fi
  done

  for d in "${SUB_DIR[@]}"; do
    scan "$d"
  done
}

scan /sql-data

