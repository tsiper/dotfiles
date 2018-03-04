# Installing zsh
sudo apt install -y zsh
chsh -s $(which zsh)

# Installing antigen
curl -L git.io/antigen > antigen.zsh

# Installing fuzzy file finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
