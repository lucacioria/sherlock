rename 's([0-9]\.\s)()' *.png
rename 's(\s)(_)' *.png
rename 's(\s)(_)' *.png
rename 's(\s)(_)' *.png
rename 's(\s)(_)' *.png
rename 's(\s)(_)' *.png
rename 's(\s)(_)' *.png
for x in *.png; do convert -density 300 "$x" "$(echo $x | sed s/.png$//).pdf"; done
