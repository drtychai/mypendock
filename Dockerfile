FROM drtychai/pendock:latest

# Oh-my-ZSH
RUN apt update --fix-missing \
    && apt install -y zsh

RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
RUN chsh -s /bin/zsh

# GEF
RUN cd ${HOME}/tools \
    && git clone --depth 1 https://github.com/hugsy/gef.git \
    && echo "source ~/tools/gef/gef.py" > ${HOME}/.gdbinit

# Install dotfiles
RUN cd ${HOME}/tools \
    && git clone --depth 1 https://github.com/drtychai/dotfiles.git \
    && cd ${HOME}/tools/dotfiles \
    && echo 'n' | ./install.sh

RUN echo 'export PS1="[\[\e[34m\]\u\[\e[0m\]@\[\e[33m\]\H\[\e[0m\]:\w]\n\\$ "' >> /root/.bashrc

# Work env
WORKDIR /root/

