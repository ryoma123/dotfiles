# Install Fisher
if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
end

# Install dein.vim
if not [ -f ~/.installer.sh ]
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > .installer.sh
    sh ./installer.sh ~/.cache/dein
end

echo "Successfully installed!! Run 'fisher' if necessary."
