#!/bin/sh
work=$(xprop -root _NET_CURRENT_DESKTOP | sed 's/_NET_CURRENT_DESKTOP(CARDINAL) = //')

if [ ${work} -eq 0 ]
then
    echo 'x  ∙ ∙ ∙ ∙'
elif [ ${work} -eq 1 ]
then
    echo '∙ x  ∙ ∙ ∙'
elif [ ${work} -eq 2 ]
then
    echo '∙ ∙ x  ∙ ∙'
elif [ ${work} -eq 3 ]
then
    echo '∙ ∙ ∙ x  ∙'
elif [ ${work} -eq 4 ]
then
    echo '∙ ∙ ∙ ∙ x'
fi

