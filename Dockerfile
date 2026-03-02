FROM eclipse-temurin:17-jdk

WORKDIR /server

RUN apt-get update && apt-get install -y curl jq

# =========================
# Paper 1.12.2 最新ビルド取得
# =========================
RUN BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/1.12.2 \
| jq -r '.builds[-1]') \
&& curl -L -o paper.jar \
"https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/${BUILD}/downloads/paper-1.12.2-${BUILD}.jar"

# =========================
# Pluginフォルダ
# =========================
RUN mkdir plugins

# EaglerXServer
RUN curl -L -o plugins/EaglerXServer.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXServer.jar

# Web配信用
RUN curl -L -o plugins/EaglerWeb.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerWeb.jar

# MOTD強化
RUN curl -L -o plugins/EaglerMOTD.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerMOTD.jar

# Rewind互換
RUN curl -L -o plugins/EaglerXRewind.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXRewind.jar

# RPC / 管理
RUN curl -L -o plugins/EaglerXBackendRPC.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXBackendRPC.jar

# 分析
RUN curl -L -o plugins/EaglerXPlan.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXPlan.jar

# 管理デーモン
RUN curl -L -o plugins/EaglerXSupervisor.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXSupervisor.jar

# =========================
# 起動
# =========================
CMD sh -c "echo eula=true > eula.txt && java -Xms1G -Xmx1G -jar paper.jar"
