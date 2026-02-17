#!/bin/bash

printf "%-8s %-4s %-12s %-12s %-12s %-12s\n" \
"Density" "Run" "E*/N" "P*" "Cv*/N_xs" "Mu*_xs"

for file in log_0.*.dat; do

    # Extract density and run from filename
    name=${file%.dat}
    density=$(echo $name | cut -d'_' -f2)
    run=$(echo $name | cut -d'_' -f3)

    # Grab last computed values
    E=$(grep "E\*/N:" "$file" | tail -1 | awk '{print $3}')
    P=$(grep "P\*:" "$file" | tail -1 | awk '{print $3}')
    Cv=$(grep "Cv\*/N_xs:" "$file" | tail -1 | awk '{print $3}')
    Mu=$(grep "Mu\*_xs:" "$file" | tail -1 | awk '{print $3}')

    printf "%-8s %-4s %-12s %-12s %-12s %-12s\n" \
    "$density" "$run" "$E" "$P" "$Cv" "$Mu"

done | sort -k1,1n -k2,2n

