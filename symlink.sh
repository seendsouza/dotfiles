# Symlinks all dotfiles to correct files/directories

for f in *; do
    if [[ -d ${f} ]]; then
    		stow "$f"
    		echo "$f"
	fi
done
