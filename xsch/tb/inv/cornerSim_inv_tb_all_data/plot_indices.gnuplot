# plot_indices.gnuplot
# Automatically plot all indexes in a whitespace-separated file
# Stops automatically when no more indexes exist

# Usage:
# gnuplot -persist -e "filename='yourfile.txt'" plot_indices.gnuplot

if (!exists("filename")) {
    print "ERROR: Please provide the filename: gnuplot -persist -e \"filename='yourfile.txt'\" plot_indices.gnuplot"
    exit
}

set style data lines
set xlabel "X-axis"
set ylabel "Y-axis"
set grid

# Define cycling colors
colors = "#FF0000 #00FF00 #0000FF #FFA500 #800080"  # Red, Green, Blue, Orange, Purple
ncolors = words(colors)
get_color(i) = word(colors, (i % ncolors) + 1)

# Loop through indexes until empty
i = 0
do for [i=0:1000] {  # 1000 is a safety upper limit
    # Check if index has data
    stats filename index i using 1 nooutput
    if (STATS_records == 0) {
        break
    }

    if (i == 0) {
        plot filename index i using 1:2 with lines lc rgb get_color(i) title sprintf("Index %d", i)
    } else {
        replot filename index i using 1:2 with lines lc rgb get_color(i) title sprintf("Index %d", i)
    }
}

