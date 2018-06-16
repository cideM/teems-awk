#!/usr/bin/awk -f
BEGIN {
    color_regex="^background$|^foreground$|^color";
    theme[""]=0
}
{
    # NR == FNR is only true for the first file
    if (NR == FNR) {
        color=$1
        value=$2

        # Take the colors from foreground to color15 and assign them to the
        # array.
        theme[color] = value;
    } else {
        if ($1 ~ color_regex) {
            color=$1
            value=$2

            # Take the colors from the array above, and use them to replace the
            # color values in the theme. Order is obviously important.
            gsub(value, theme[color], $0);

            # Print the entire line (including the ones ran through gsub).
            print $0
        } else {
            print $0
        }
    }
}
