FROM stilliard/pure-ftpd:hardened

ARG HOST_UID=1000
ARG HOST_GID=1000

# RUN groupadd -g ${HOST_GID} hostgroup && \
#     useradd -u ${HOST_UID} -g hostgroup -m ftpuser
