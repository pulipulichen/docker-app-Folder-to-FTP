FROM debian:bookworm

# 安裝必要工具
RUN apt update && apt install -y \
    sudo \
    passwd \
    adduser \
    openssh-server \
 && rm -rf /var/lib/apt/lists/*

# RUN adduser --home /home/user --disabled-password --gecos "" user \
#  && echo 'user:password' | chpasswd

# 可選：讓該使用者具有 sudo 權限
# RUN usermod -aG sudo user

RUN mkdir -p /run/sshd && chmod 755 /run/sshd

# 設定 root 密碼
RUN echo 'root:password' | chpasswd

RUN ssh-keygen -A

# 修改 sshd_config：允許 root 密碼登入
# RUN sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config \
#  && sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config


# 開放需要的 port（範例：22）
EXPOSE 22

# RUN chown -R user:user /home/user
# RUN chmod -R 777 /home/user

# RUN echo '%sudo ALL=(ALL:ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo
# 啟動命令（可以根據你用途改為其他啟動服務）
CMD ["/usr/sbin/sshd", "-D"]

# USER user

# FROM node:18.12.1-buster

# RUN apt-get update

# RUN apt-get install -y \
#     imagemagick

# # COPY package.json /
# # RUN npm install

# CMD ["bash"]

# RUN echo "20231112-0002"