# Installing zsh
sudo apt install -y zsh

# Changing default shell to zsh for EC2 computers as well
chsh -s $(which zsh)
sudo chsh ubuntu -s $(which zsh)

# Installing antigen
curl -L git.io/antigen > antigen.zsh

# Installing fuzzy file finder
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
