#!/usr/bin/env bash



set -euo pipefail

if (( $# == 0 )); then
	echo "Usage: $0 <log-directory>"
	exit 1
elif [[ ! -d $1 ]]; then
	echo "Enter a valid directory"
	exit 1
fi


archive_dir="/var/log/archives"
mkdir -p "$archive_dir"

timestamp=$(date +%Y%m%d_%H%M%S)
archive_name="logs_archive_$timestamp.tar.gz"
archive_file="$archive_dir/$archive_name"
archive_history="$archive_dir/archive_history.log"
archive_log_msg="$(date) - Created archive: $archive_file from directory $1"


tar -czf "$archive_file" "$1" && echo "$archive_log_msg" >> "$archive_history"



