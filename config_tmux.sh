echo "================= Start config the tmux... ================="

TMUX_VERSION=`tmux -V`
if [ $? -ne 0 ]; then
    echo "tmux is not installed, please install it first."
    exit 1
fi

echo "tmux version: $TMUX_VERSION"
echo ""
echo "We will copy the tmux config file to $HOME/.tmux.conf!!!"
echo "If you have your own tmux config file, please backup it first!!!"
echo ""
echo "Press any key to continue..."
read -n 1

cp src/.tmux.conf $HOME/.tmux.conf