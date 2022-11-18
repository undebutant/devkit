#!/usr/bin/env bash

export PATH="${PATH}:/usr/local/go/bin"

export GOROOT="/usr/local/go"
export GOBIN="/usr/local/go/bin"

export GOPATH="{{ go_projects_path }}"
export GOCACHE="{{ go_projects_path }}/.cache/go-build"
