FROM gcc:14

ARG uid
ARG username

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      cmake make gdb sudo \
      fortune-mod \
      tree \
      emacs vim \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd -g ${uid} ${username} \
 && useradd -m -u ${uid} -g ${uid} -s /bin/bash ${username} \
 && echo "${username} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${username}

WORKDIR /home/${username}/programming
USER ${username}

CMD ["bash"]
