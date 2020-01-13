# Install Fisher
if not fisher -v
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end
fisher
