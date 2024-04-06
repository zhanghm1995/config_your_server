#!/bin/bash

# get current work directory
WORK_DIR=`pwd`
echo $WORK_DIR

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    echo "zsh is not installed. Installing..."

    # Check if zsh.tar.xz is already downloaded
    if [ -f zsh.tar.xz ]; then
        echo "Using the already downloaded zsh.tar.xz file."
    else
        echo "Downloading zsh.tar.xz..."
        wget -O zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
    fi

    echo "Extracting ncurses-6.1.tar.gz..."
    export CXXFLAGS="-fPIC"
    export CFLAGS="-fPIC"
    export NCURSES_HOME=$HOME/.ncurses  # 你自己的 ncurses 目录
    export PATH=$NCURSES_HOME/bin:$PATH
    export LD_LIBRARY_PATH=$NCURSES_HOME/lib:$LD_LIBRARY_PATH
    export CPPFLAGS="-I$NCURSES_HOME/include" LDFLAGS="-L$NCURSES_HOME/lib"

    tar -zxvf ncurses-6.1.tar.gz
    cd ncurses-6.1
    ./configure --prefix=$NCURSES_HOME --with-shared --without-debug --enable-widec &&
    make && make install

    echo "=============Existing PATH is==================="
    echo $PATH

    echo "Start install zsh..."
    echo "Press any key to continue..."
    read -n 1

    ## Switch to the root directory
    cd $WORK_DIR

    echo "Extracting zsh.tar.xz..."
    # Install zsh in non-root user
    # Extract zsh.tar.xz
    tar -xf zsh.tar.xz

    # Change to the extracted directory
    cd zsh-*

    # Build and install zsh
    ./configure --prefix=$HOME/.zsh &&
    make &&
    make install

    # Set zsh as the default shell
    echo 'export PATH="$HOME/.zsh/bin:$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo '[ -f $HOME/.zsh/bin/zsh ] && exec $HOME/.zsh/bin/zsh -l' >> ~/.bashrc

    echo "zsh has been installed and set as the default shell."

else
    echo "zsh is already installed."
    chsh -s $(which zsh)
fi


cd $WORK_DIR

# Copy antigen.zsh to $HOME/.antigen.zsh
echo "================= Start config the antigen... ================="
echo

cp src/antigen.zsh $HOME/.antigen.zsh
echo "src/antigen.zsh has been copied to $HOME/.antigen.zsh."

echo "================= Start config the zsh... ================="
echo

# Copy .zshrc to $HOME/.zshrc
cp src/.zshrc $HOME
echo "src/.zshrc has been copied to $HOME/.zshrc."

# execute zsh to start config
zsh
