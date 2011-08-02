#!/usr/bin/env bash
method_override() {
  local override="$(param _method)"
  if [[ -n "$override" ]]; then
    export REQUEST_METHOD="$override"
  fi

  back::next
}

back::use method_override

back::run ./app.sh
