FROM lasote/conangcc49
COPY sources.list.trusty /etc/apt
RUN sudo gpg --keyserver keyserver.ubuntu.com --recv-key 5BB92C09DB82666C \
  && sudo gpg -a --export 5BB92C09DB82666C | sudo apt-key add - \
  && sudo mv /etc/apt/sources.list /etc/apt/sources.list.bk \
  && sudo mv /etc/apt/sources.list.trusty /etc/apt/sources.list \
  && sudo apt-get -y update \
  && git config --global user.email "chinadaihongjun@gmail.com" \
  && git config --global user.name "cppbitman" \
  && git clone -b 1.14 https://github.com/cppbitman/cerbero.git \
  && cd cerbero \
  && ./cerbero-uninstalled -c config/linux.config bootstrap \
  && rm -rf build/logs \
  && rm -rf build/sources \
  && rm -rf build/dist
  