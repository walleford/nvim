# Setup on openSUSE

1. cd ~/.config
2. Run `git clone git@github.com:walleford/nvim.git nvim`
4. Run : `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
5. Run the following: `$ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'`
6. In the `~/.config` directory run `nvim .` and Packer will download and sync all the plugins
   If you feel like it, run :PackerSync afterwards, then close and open nvim again. Everything should be good.
