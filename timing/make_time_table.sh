#!/usr/bin/env bash

echo "Density  Run  User(s)  System(s)  Elapsed(s)"

for file in time_0.*.dat; do
    # Extract density and run from filename
    base=$(basename "$file" .dat)

    density=$(echo "$base" | cut -d'_' -f2)
    run=$(echo "$base" | cut -d'_' -f3)

    # Extract timing line (first line)
    line=$(head -n 1 "$file")

    # Extract user time
    user=$(echo "$line" | awk '{print $1}' | sed 's/user//')

    # Extract system time
    system=$(echo "$line" | awk '{print $2}' | sed 's/system//')

    # Extract elapsed time (convert mm:ss to seconds)
    elapsed_raw=$(echo "$line" | awk '{print $3}' | sed 's/elapsed//')

    mins=$(echo "$elapsed_raw" | cut -d':' -f1)
    secs=$(echo "$elapsed_raw" | cut -d':' -f2)

    elapsed=$(awk "BEGIN {print $mins*60 + $secs}")

    printf "%-8s %-4s %-8s %-10s %-10s\n" "$density" "$run" "$user" "$system" "$elapsed"

done | sort -n -k1 -k2

