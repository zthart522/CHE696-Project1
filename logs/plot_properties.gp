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
set xlabel "Reduced Density, {/Symbol r}^{*}"
set ylabel "Reduced Energy per Atom, E^{*}/N"
set title "Average E^{*}/N vs {/Symbol r}^{*}"
set key top right
plot "log_table_stats.dat" using 1:2:3 with yerrorbars lc rgb "red" pt 13 ps 1.5 title "Computed", \
     "literature.dat" using 1:4:5 with yerrorbars pt 3 ps 1.5 title "Literature"

# ---------- PRESSURE ----------
set xlabel "Reduced Density, {/Symbol r}^{*}"
set ylabel "Reduced Pressure, P^{*}"
set title "Average P^{*} vs {/Symbol r}^{*}"
set key top left
plot "log_table_stats.dat" using 1:4:5 with yerrorbars lc rgb "red" pt 13 ps 1.5 title "Computed", \
     "literature.dat" using 1:6:7 with yerrorbars pt 3 ps 1.5 title "Literature"

# ---------- CV ----------
set xlabel "Reduced Density, {/Symbol r}^{*}"
set ylabel "Reduced Specific Heat per Atom, C_{v}^{*}/N_{XS}"
set title "Average C_{v}^{*}/N vs {/Symbol r}^{*}"
set key top right
plot "log_table_stats.dat" using 1:6:7 with yerrorbars lc rgb "red" pt 13 ps 1.5 title "Computed", \
     "literature.dat" using 1:2:3 with yerrorbars pt 3 ps 1.5 title "Literature"

# ---------- MU ----------
set xlabel "Reduced Density, {/Symbol r}^{*}"
set ylabel "Reduced Excess Chemical Potential, {/Symbol m}^{*}_{XS}"
set title "Average {/Symbol m}^{*}_{XS} vs {/Symbol r}^{*}"
set key top left
plot "log_table_stats.dat" using 1:8:9 with yerrorbars lc rgb "red" pt 13 ps 1.5 title "Computed (N=500)", \
     "literature_mu_64.dat" using 1:2:3 with yerrorbars pt 3 ps 1.5 title "Literature (N=64)", \
     "literature_mu_256.dat" using 1:2:3 with yerrorbars pt 9 ps 1.5 title "Literature (N=256)"

# -----------------------------
# End multiplot
# -----------------------------
unset multiplot
unset output

