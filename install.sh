#!/bin/bash
DOTFILES=$HOME/DotFiles
# Symlinks the configs
# Manager func
symlink () {
    TARGET=$PWD/$1
    FILE=$HOME/.$1
    if [ -e "$FILE" ]
    then
        echo ".zshrc existed"
    else
        ln -s "$TARGET" "$FILE"
    fi
}

if [ $# -eq 1 ]
then
    case $1 in
        nvim)
            sudo apt-get install software-properties-common
            sudo add-apt-repository ppa:neovim-ppa/unstable
            sudo apt-get update
            sudo apt-get install neovim
            sudo apt-get install python-dev python-pip python3-dev python3-pip
            sudo pip install --upgrade pip
            sudo pip2 install --upgrade neovim
            sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
            sudo update-alternatives --config vim
            curl -sLf https://raw.githubusercontent.com/SpaceVim/SpaceVim/dev/install.sh | bash

            exit 0
            ;;
        tmux)
            sudo apt-get install tmux
            cd tmux
            symlink 'tmux.conf'
            exit 0
            ;;
        zsh)
            sudo apt-get install zsh

            if [ -d "$HOME/.on-my-zsh" ]
            then
                echo ".oh-my-zsh installed"
            else
                git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
                cd zsh
                symlink 'zshrc'
                symlink 'zshenv'

                chsh -s /bin/zsh
            fi

            exit 0
            ;;
        emacs)
            if [ -d "$HOME/.emacs.d" ]
            then
                echo ".emacs.d installed"
                sudo apt-get install emacs-snapshot
            else
                sudo add-apt-repository -y ppa:ubuntu-elisp
                sudo apt-get update
                sudo apt-get install emacs-snapshot
                git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
                sudo apt-get install cscope
                sudo apt-get install silversearcher-ag
                git clone --depth 1 --branch release https://github.com/adobe-fonts/source-code-pro.git ~/.fonts/adobe-fonts/source-code-pro
                fc-cache -f -v ~/.fonts/adobe-fonts/source-code-pro

            fi

            if [ -d "$HOME/.spacemacs.d" ]
            then
                echo ".spacsmacs.d installed"
            else
                ln -s  "$DOTFILES/spacemacs.d" "$HOME/.spacemacs.d"
            fi


            exit 0
            ;;
        git)
            cd gitc
            symlink 'gitconfig'

            exit 0
            ;;
        ycmd)
            if [ -d "$DOTFILES/ycmd/ycmd" ]
            then
                echo "ycmd installed"
            else
                mkdir ycmd
                git clone https://github.com/Valloric/ycmd.git ycmd/
                sudo apt-get install clang
                sudo apt-get install build-essential cmake python-dev
                git submodule update --init --recursive
                cd ycmd
                sudo apt-get install mono-xbuild
                ./build.py --all
			      fi


			      exit 0
			      ;;

		    rime)
            sudo add-apt-repository ppa:lotem/rime
            sudo apt-get update
            sudo apt-get install ibus-rime
            sudo apt-get install librime-data-wubi
            # 去修改.config/ibus/rime/defaut-yaml
			      exit 0
			      ;;

		    chromium)
            if [ -d "$DOTFILES/chrome" ]
            then
                echo "ycmd installed"
            else
                sudo apt-get install chromium-browser
			      fi

			      exit 0
			      ;;
		esac
fi
