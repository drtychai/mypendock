FROM drtychai/pendock:latest

# Oh-my-ZSH
RUN apt update --fix-missing \
    && apt install -y zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN chsh -s /bin/zsh

# GEF
RUN cd ~/tools \
    && git clone --depth 1 https://github.com/hugsy/gef.git \
    && echo "source ~/tools/gef/gef.py" > ~/.gdbinit

# Install dotfiles
RUN cd ~/tools \
    && git clone --depth 1 https://github.com/drtychai/dotfiles.git \
    && bash ~/tools/dotfiles/init.sh

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\n\\$ "' >> /root/.bashrc

# Work env
WORKDIR /root/

