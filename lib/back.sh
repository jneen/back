#!/usr/bin/env bash

# TODO: consider using an actual array for $BACK_MIDDLEWARE
back::use() {
  export BACK_MIDDLEWARE="${BACK_MIDDLEWARE}$@\n"
}

back::next() {
  if [[ -z "$BACK_MIDDLEWARE" ]]; then
    ( $BACK_APP )
  else
    {
      local top_middleware="$(read)"
      BACK_MIDDLWARE="$(cat -)" $top_middleware
    } <<<"$BACK_MIDDLEWARE"
  fi
}

back::run() {
  export BACK_APP="$@"
  back::callback
}

back::header() {
  echo -n "$*\r\n"
}

back::start_response() {
  echo -n "\r\n"
}
