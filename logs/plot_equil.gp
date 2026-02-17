# plot_equilibration.gp
reset
set terminal pngcairo size 1200,900 enhanced font 'Arial,12'

# -----------------------------
# Densities and general settings
# -----------------------------
densities = "0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9"

# ============================================================
# Plot E*/N for first 1e6 steps
# ============================================================
set output "E_first1e6.png"
set multiplot layout 3,3 spacing 0.03 title "Reduced Energy E* vs Step (First 1e6 Steps)" font ",16"

do for [d in densities] {
    set title sprintf("{/Symbol r}^{*} = %s", d) font ",16"
    set xlabel "Steps / 10^{5}" font ",16"
    set ylabel "E*/N" font ",16"
    set xrange [0:10]
    if (d == 0.1) {set key horizontal top center} else {unset key}
    
    if (d <= 0.6) {set ytics 0.25} else if (d == 0.7) {set ytics 1} else {set ytics 2}

    plot \
        sprintf("log_%s_1.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 1", \
        sprintf("log_%s_2.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 2", \
        sprintf("log_%s_3.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 3", \
        sprintf("log_%s_4.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 4"
}
unset xrange
unset multiplot

# ============================================================
# Plot E*/N for last 1e5 steps
# ============================================================
set output "E_last1e5.png"
set multiplot layout 3,3 spacing 0.03 title "Reduced Energy E* vs Step (Last 1e5 Steps)" font ",16"

do for [d in densities] {
    set title sprintf("{/Symbol r}^{*} = %s", d) font ",16"
    set xlabel "Step / 10^{5}" font ",16"
    set ylabel "E*/N" font ",16"
    if (d == 0.1) {set key horizontal top center} else {unset key}
    set ytics 0.25
    
    plot \
        sprintf("log_%s_1.dat", d) using ($2/1e5):10 every ::2000::2500 with lines lw 2 title "Seed 1", \
        sprintf("log_%s_2.dat", d) using ($2/1e5):10 every ::2000::2500 with lines lw 2 title "Seed 2", \
        sprintf("log_%s_3.dat", d) using ($2/1e5):10 every ::2000::2500 with lines lw 2 title "Seed 3", \
        sprintf("log_%s_4.dat", d) using ($2/1e5):10 every ::2000::2500 with lines lw 2 title "Seed 4"
}

unset multiplot

# ============================================================
# Plot P* for first 1e6 steps
# ============================================================
set output "P_first1e6.png"
set multiplot layout 3,3 spacing 0.03 title "Reduced Pressure P* vs Step (First 1e6 Steps)" font ",16"

do for [d in densities] {
    set title sprintf("{/Symbol r}^{*} = %s", d) font ",16"
    set xlabel "Steps / 10^{5}" font ",16"
    set xtics 2
    set xrange [0:10]
    set ylabel "P*" font ",16"
    if (d == 0.1) {set key horizontal top center} else {unset key}

    if (d <= 0.3) {set ytics 0.10} else if (d <= 0.5) {set ytics 0.5} else if (d <= 0.7) {set ytics 2} else if (d <= 0.8) {set ytics 5} else {set ytics 15}
    
    plot \
        sprintf("log_%s_1.dat", d) using ($2/1e5):12 every ::0::500 with lines lw 2 title "Seed 1", \
        sprintf("log_%s_2.dat", d) using ($2/1e5):12 every ::0::500 with lines lw 2 title "Seed 2", \
        sprintf("log_%s_3.dat", d) using ($2/1e5):12 every ::0::500 with lines lw 2 title "Seed 3", \
        sprintf("log_%s_4.dat", d) using ($2/1e5):12 every ::0::500 with lines lw 2 title "Seed 4"
}
unset xrange
unset multiplot

# ============================================================
# Plot P* for last 1e5 steps
# ============================================================
set output "P_last1e5.png"
set multiplot layout 3,3 spacing 0.03 title "Reduced Pressure P* vs Step (Last 1e5 Steps)" font ",16"

do for [d in densities] {
    set title sprintf("{/Symbol r}^{*} = %s", d) font ",16"
    set xlabel "Step / 10^{5}" font ",16"
    set xtics 10
    set ylabel "P*" font ",16"
    if (d == 0.1) {set key horizontal top center} else {unset key}

    if (d <= 0.3) {set ytics 0.10} else if (d <= 0.6) {set ytics 0.25} else {set ytics 0.5}

    plot \
        sprintf("log_%s_1.dat", d) using ($2/1e5):12 every ::2000::2500 with lines lw 2 title "Seed 1", \
        sprintf("log_%s_2.dat", d) using ($2/1e5):12 every ::2000::2500 with lines lw 2 title "Seed 2", \
        sprintf("log_%s_3.dat", d) using ($2/1e5):12 every ::2000::2500 with lines lw 2 title "Seed 3", \
        sprintf("log_%s_4.dat", d) using ($2/1e5):12 every ::2000::2500 with lines lw 2 title "Seed 4"
}

unset multiplot

