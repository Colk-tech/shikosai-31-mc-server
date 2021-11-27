# 基本的なプラグインがすでに入ったマイクラサーバーのイメージ
FROM itzg/minecraft-server:java17
USER root

ENV LC_ALL=en_US.UTF-8 \
    TZ=JST-9 \
    TERM=xtermdocker-attachingdocker-attaching

ENV EULA=TRUE \
    VERSION=1.17.1 \
    TYPE=PAPER \
    ENABLE_QUERY=true \
    ENABLE_STATUS=true

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    locales curl \
    && localedef -f UTF-8 -i en_US en_US.UTF-8
    # 本来ならイメージサイズ短縮のためにおこなうが、今回はビルド時間優先のため省略
    # && apt-get upgrade -y \
    # && apt-get autoremove -y \
    # && apt-get clean -y \
    # && rm -rf /var/lib/apt/lists/*

COPY ./init_data/progress/ /data

# MOD や Plugin などを追加する場合は、wget を用いて /plugins において下さい
