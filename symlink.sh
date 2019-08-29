# Symlinks all dotfiles to correct files/directories

for f in *; do
    if [[ -d ${f} ]] && ignore "$f" == true ; then
    		#stow "$f"
    		echo "$f"
	fi
done
