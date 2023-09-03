
# env
source ~/.config/zsh/env.zsh
# alias
source ~/.config/zsh/aliases.zsh



# install zim
source ~/.config/zsh/plugins.zsh
# fzf config
source ~/.config/zsh/fzf.zsh

# source ~/.config/zsh/prompt.zsh

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# function on_proxy() {
#     export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
#     export http_proxy="http://127.0.0.1:port"
#     export https_proxy=$http_proxy
#     export all_proxy=socks5://127.0.0.1:port
#     echo -e "\n"
#     echo -e "\033[32m代理已开启\033[0m"
# }
#
# function off_proxy(){
#     unset http_proxy
#     unset https_proxy
#     unset all_proxy
#     echo -e "\033[31m代理已关闭\033[0m"
# }
