#!/usr/bin/awk -f
BEGIN {
    color_regex="background:|foreground|black|red|green|yellow|blue|magenta|cyan|white";
    theme[""]=0
    i=0
    ii=0
}
{
    color=$1
    value=$2

    # NR == FNR is only true for the first file
    if (NR == FNR) {
        # Take the colors from foreground to color15 and assign them to the
        # array.
        theme[i] = value;
        i += 1;
    } else {
        if (color ~ color_regex) {
            # Take the colors from the array above, and use them to replace the
            # color values in the theme. Order is obviously important.
            gsub(value, theme[ii], $0);
            ii += 1;

            # Print the entire line (including the ones ran through gsub).
            print $0
        } else {
            print $0
        }
    }
}
