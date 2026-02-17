reset
set terminal pngcairo size 1200,900 enhanced font 'Arial,12'
set datafile separator whitespace
set grid

# -----------------------------
# Output file
# -----------------------------
set output "properties_2x2.png"

# -----------------------------
# Start multiplot 2x2
# -----------------------------
set multiplot layout 2,2 spacing 0.05 title "Thermodynamic Properties vs Density" font ",16"

# ---------- ENERGY ----------
set xlabel "Density"
set ylabel "E*/N"
set title "Average E*/N vs Density"
set key top right
plot "log_table_stats.dat" using 1:2:3 with yerrorbars lc rgb "red" pt 13 ps 1 title "Computed", \
     "literature.dat" using 1:4:5 with yerrorbars pt 3 ps 1 title "Literature"

# ---------- PRESSURE ----------
set xlabel "Density"
set ylabel "P*"
set title "Average P* vs Density"
set key top right
plot "log_table_stats.dat" using 1:4:5 with yerrorbars lc rgb "red" pt 13 ps 1 title "Computed", \
     "literature.dat" using 1:6:7 with yerrorbars pt 3 ps 1 title "Literature"

# ---------- CV ----------
set xlabel "Density"
set ylabel "Cv*/N_xs"
set title "Average Cv*/N_xs vs Density"
set key top right
plot "log_table_stats.dat" using 1:6:7 with yerrorbars lc rgb "red" pt 13 ps 1 title "Computed", \
     "literature.dat" using 1:2:3 with yerrorbars pt 3 ps 1 title "Literature"

# ---------- MU ----------
set xlabel "Density"
set ylabel "Mu*_xs"
set title "Average Mu*_xs vs Density"
set key top right
plot "log_table_stats.dat" using 1:8:9 with yerrorbars lc rgb "red" pt 13 ps 1 title "Computed (N=500)", \
     "literature_mu_64.dat" using 1:2:3 with yerrorbars pt 3 ps 1 title "Literature (N=64)", \
     "literature_mu_256.dat" using 1:2:3 with yerrorbars pt 9 ps 1 title "Literature (N=256)"

# -----------------------------
# End multiplot
# -----------------------------
unset multiplot
unset output

