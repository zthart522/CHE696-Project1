set terminal pngcairo size 900,600 enhanced font "Arial,12"
set output "time_vs_density.png"

set title "Simulation Time vs Reduced Density"
set xlabel "Reduced Density (rho*)"
set ylabel "Mean Elapsed Time (s)"

set grid
unset key

# Skip header row
plot "time_table_stats.dat" using 1:2:3 every ::1 \
     with yerrorbars lw 2 pt 7 ps 1.5 lc "red" title "Mean ± StdErr"

