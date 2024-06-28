FROM debian:bookworm-slim

# 更新包列表并安装依赖
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    build-essential \
    zlib1g-dev \
    libexpat1-dev \
    openssl \
    libssl-dev \
    libsasl2-dev \
    libpcre3-dev \
    sasl2-bin \
    systemctl \
    # 克隆并构建lsmcd
    && wget https://github.com/litespeedtech/lsmcd/archive/refs/heads/master.tar.gz -O lsmcd.tar.gz \
    && tar -zxvf lsmcd.tar.gz \
    && cd lsmcd-master \
    && ./fixtimestamp.sh \
    && ./configure CFLAGS="-O3" CXXFLAGS="-O3" \
    && make \
    && make install
    # 清理工作目录和缓存
    # && cd / \
    # && rm -rf /lsmcd-master \
    # && apt-get purge -y --auto-remove \
    # wget \
    # ca-certificates \
    # build-essential \
    # zlib1g-dev \
    # libexpat1-dev \
    # openssl \
    # libssl-dev \
    # libsasl2-dev \
    # libpcre3-dev \
    # sasl2-bin \
    # && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 11211
ENTRYPOINT ["/sbin/entrypoint.sh"]