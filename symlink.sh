# Syminks all dotfiles to correct files/directories
for d in ./config/*/ ; do
    stow "$d"
    echo "$d"
done
