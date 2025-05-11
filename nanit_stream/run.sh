#!/usr/bin/with-contenv bashio

echo "[INFO] Nanit stream add-on starting..."
TOKEN_PATH="/config/nanit_data/token"
DATA_DIR="/config/nanit_data"
RETRY_INTERVAL=10

mkdir -p "$DATA_DIR"

while true; do
  if [ -f "$TOKEN_PATH" ]; then
    echo "[INFO] Found token. Starting stream..."
    /app/scripts/start-nanit.sh --data-dir "$DATA_DIR"
    echo "[WARN] Stream exited. Retrying in $RETRY_INTERVAL seconds..."
  else
    echo "[INFO] Waiting for integration login... Token not yet available."
  fi

  sleep $RETRY_INTERVAL
done
