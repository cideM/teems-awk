# teems-awk

Switch terminal color themes using awk, sed and bash. Isn't that what you always wanted?

## Why?

I read a post on HN about `awk`. I bookmarked it. I then saw another such post, and another... eventually I said enough is enough and decided to learn the basics and throw in some bash. Because I didn't know anything about any of these tools. Now I know very little, which is more than nothing. Most importantly, I now know that `awk` is a thing and that it's great for small tasks where you're parsing data with reliable delimiters.

## What?

It's pretty self-explanatory, I hope? You define themes in one file. You then call the script `teems.sh` with that theme file and the name of the theme you'd like to activate. It will then generate new files for `alacritty` and `kitty` and then overwrite your existing config. If you don't have backups and something happens, well, don't blame me. This is also just a toy project, because I could.
