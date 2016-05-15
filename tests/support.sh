function clear_cron {
  crontab -l | grep -v soji/soji | crontab
}

function reset_test_env {
  clear_cron
  rm -rf $SOJI_DIR/tests/event_logs/*
  rm -rf $SOJI_DIR/tests/notes/*
}

setup() {
  reset_test_env
}

teardown() {
  reset_test_env
}
