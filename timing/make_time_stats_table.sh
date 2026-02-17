#!/usr/bin/env bash

printf "%-8s %-15s %-15s\n" "Density" "Mean_Time(s)" "StdErr_Mean(s)"

for density in 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9; do

    # Extract elapsed times for the 4 runs and convert to seconds
    times=()

    for run in 1 2 3 4; do
        file="time_${density}_${run}.dat"

        # Extract elapsed field (e.g. 4:21.12elapsed)
        elapsed=$(grep elapsed "$file" | awk '{for(i=1;i<=NF;i++) if($i ~ /elapsed/) print $i}')

        # Remove "elapsed"
        elapsed=${elapsed%elapsed}

        # Convert M:SS.SS to seconds
        minutes=$(echo "$elapsed" | cut -d':' -f1)
        seconds=$(echo "$elapsed" | cut -d':' -f2)

        total=$(awk -v m="$minutes" -v s="$seconds" 'BEGIN{print m*60 + s}')
        times+=($total)
    done

    # Compute mean and standard deviation
    awk -v d="$density" \
        -v t1="${times[0]}" \
        -v t2="${times[1]}" \
        -v t3="${times[2]}" \
        -v t4="${times[3]}" '
    BEGIN{
        n=4
        mean=(t1+t2+t3+t4)/n

        var=((t1-mean)^2 + (t2-mean)^2 + (t3-mean)^2 + (t4-mean)^2)/(n-1)
        std=sqrt(var)

        stderr=std/sqrt(n)

        printf "%-8s %-15.4f %-15.4f\n", d, mean, stderr
    }'

done

