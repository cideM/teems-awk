#!/usr/bin/awk -f

BEGIN {
    # theme_name must be set through -v theme_name=foo
    found = 0;
    color_regex = "foreground|background|color";
}
{
    # Indicate we've found our theme and move to next line
    if ($1 !~ color_regex && $1 == theme_name) {
        found = 1;
        next;
    }

    # Print color names and values for selected theme
    if (found == 1 && $1 ~ color_regex) {
        print $1, $2;
    }

    # If we have found our theme but we've read past the last
    # color line, exit.
    if (found == 1 && $1 !~ color_regex) {
        exit 0;
    }
}
