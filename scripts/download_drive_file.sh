#!/usr/bin/env bash
set -e

# Script to download a file from Google Drive into data/
# Usage: ./scripts/download_drive_file.sh

FILEID="1k3DqcnqyorkvX7prsCahx2s58WlZupr3"
DEST="data/dados_drive.zip"

mkdir -p "$(dirname "${DEST}")"

if command -v gdown >/dev/null 2>&1; then
  echo "Using gdown to download the file..."
  gdown "https://drive.google.com/uc?id=${FILEID}" -O "${DEST}"
  exit $?
fi

# If gdown is not available, try wget/curl method

# Try wget approach that handles confirmation tokens for large files
if command -v wget >/dev/null 2>&1; then
  echo "gdown not found; using wget fallback..."
  COOKIES="/tmp/cookies_$$.txt"
  CONFIRM=$(wget --quiet --save-cookies ${COOKIES} --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=${FILEID}" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p')
  if [ -n "$CONFIRM" ]; then
    wget --load-cookies ${COOKIES} "https://docs.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILEID}" -O "${DEST}"
    rm -f ${COOKIES}
    exit $?
  else
    echo "Could not get confirmation token with wget. Trying curl..."
    rm -f ${COOKIES}
  fi
fi

# Try curl as a last resort
if command -v curl >/dev/null 2>&1; then
  echo "Using curl fallback..."
  # This curl approach streams the file and may not handle confirmation for very large files.
  curl -L -o "${DEST}" "https://drive.google.com/uc?export=download&id=${FILEID}"
  exit $?
fi

echo "No suitable downloader found. Install gdown (pip install gdown) or ensure wget/curl is available."
exit 2
