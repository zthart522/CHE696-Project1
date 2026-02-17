# plot_rdfs_8files.gnuplot
# Plot RDFs and number integrals for 8 files side by side

set terminal pngcairo size 1200,600 enhanced font 'Verdana,12'
set output 'rdf_8files.png'

set multiplot layout 1,2 title "RDFs and Number Integrals" font ",16"

# -----------------------------
# Panel 1: RDF (g(r))
# -----------------------------
set title "Radial Distribution Function, g(r)"
set xlabel "Distance (Å)"
set ylabel "g(r)"
set key horizontal
set grid

plot \
"rdf_0.1.dat" using 1:3 with lines lw 2 title "0.1", \
"rdf_0.2.dat" using 1:3 with lines lw 2 title "0.2", \
"rdf_0.3.dat" using 1:3 with lines lw 2 title "0.3", \
"rdf_0.4.dat" using 1:3 with lines lw 2 title "0.4", \
"rdf_0.5.dat" using 1:3 with lines lw 2 title "0.5", \
"rdf_0.6.dat" using 1:3 with lines lw 2 title "0.6", \
"rdf_0.7.dat" using 1:3 with lines lw 2 title "0.7", \
"rdf_0.9.dat" using 1:3 with lines lw 2 title "0.9"

# -----------------------------
# Panel 2: Number Integral
# -----------------------------
set title "Number Integral"
set xlabel "Distance (Å)"
set ylabel "Number of atoms"
set key horizontal
set grid

plot \
"rdf_0.1.dat" using 1:2 with lines lw 2 title "0.1", \
"rdf_0.2.dat" using 1:2 with lines lw 2 title "0.2", \
"rdf_0.3.dat" using 1:2 with lines lw 2 title "0.3", \
"rdf_0.4.dat" using 1:2 with lines lw 2 title "0.4", \
"rdf_0.5.dat" using 1:2 with lines lw 2 title "0.5", \
"rdf_0.6.dat" using 1:2 with lines lw 2 title "0.6", \
"rdf_0.7.dat" using 1:2 with lines lw 2 title "0.7", \
"rdf_0.9.dat" using 1:2 with lines lw 2 title "0.9"

unset multiplot

