#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#f2f3f4cc'  # default
T='#ee00eeee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

i3lock \
--insidevercolor=$C   \
--ringvercolor=$D     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$D        \
--wrongcolor=$D        \
--timecolor=$D        \
--datecolor=$D        \
--layoutcolor=$D      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 2            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
#--keylayout 2         \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
