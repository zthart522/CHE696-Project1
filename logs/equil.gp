# -----------------------------
# Plotting parameters
# -----------------------------
left_margin = 0.075                 
right_margin = 0.025                    
bottom_margin = 0.065
top_margin = 0.125
inner_margin = 0.06            # Space between plots
n_rows = 3
n_cols = 3

# -----------------------------
# Input settings
# -----------------------------
set xtics font ",16"
set xrange [0:10]
set ytics font ",16"
unset key

# -----------------------------
# Calculate plot width/height
# -----------------------------
plot_width  = (1 - right_margin - left_margin - (n_cols-1)*inner_margin) / n_cols
plot_height = (1 - top_margin - bottom_margin - (n_rows-1)*inner_margin) / n_rows

# -----------------------------
# Output settings
# -----------------------------
set terminal pngcairo size 1200, 400*n_rows
set output 'equilibration.png'
set multiplot

# -----------------------------
# Write header
# -----------------------------
set label 101 "E^{*}/N Equilibration (First 1e5 Steps)" at screen 0.5, 0.99 center font ",20"

# -----------------------------
# Loop over rows
# -----------------------------
y_bot = 1 - top_margin - plot_height  # start at top row
x_left = left_margin
d = 0.1

do for [i=1:n_rows] {
    x_left = left_margin

    do for [j=1:n_cols] {
            
        if (i == n_rows) {
            set xlabel "Steps / 10^{5}"
            set format x "%.0f"
        } else {
            unset xlabel
            set format x ""    
        }

        if (j == 1) {
            set ylabel "E^{*}/N"
        } else {
            unset ylabel
        }

        # ---- Set Bounds of Plot ----
        set lmargin at screen x_left
        set rmargin at screen x_left + plot_width
        set tmargin at screen y_bot + plot_height
        set bmargin at screen y_bot
        
        # ---- Plot Stuff ----
        set title sprintf("Density = %.1f", d) font ",18"
        if (d == 0.1) {set key horizontal at screen 0.5, 1 - (3/4)*top_margin font ",14"} else {unset key}
        plot \
            sprintf("log_%.1f_1.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 1", \
            sprintf("log_%.1f_2.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 2", \
            sprintf("log_%.1f_3.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 3", \
            sprintf("log_%.1f_4.dat", d) using ($2/1e5):10 every ::0::500 with lines lw 2 title "Seed 4"        

        # Move to next column
        x_left = x_left + plot_width + inner_margin

        # Update d
        d = d + 0.1
    }
    
    # Move to next row
    y_bot = y_bot - plot_height - inner_margin
}

# -----------------------------
# Finish multiplot
# -----------------------------
unset multiplot
unset output

