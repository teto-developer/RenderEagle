FROM eclipse-temurin:17-jdk

WORKDIR /server

# 必要ツール
RUN apt-get update && apt-get install -y curl

# Paper 1.12.2 ダウンロード
RUN curl -L -o paper.jar \
https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/162/downloads/paper-1.12.2-162.jar

# plugins フォルダ作成
RUN mkdir plugins

# EaglerXServer v1.0.8 全部入り
RUN curl -L -o plugins/EaglerXServer.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXServer.jar

RUN curl -L -o plugins/EaglerWeb.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerWeb.jar

RUN curl -L -o plugins/EaglerXRewind.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXRewind.jar

RUN curl -L -o plugins/EaglerXBackendRPC.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXBackendRPC.jar

RUN curl -L -o plugins/EaglerMOTD.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerMOTD.jar

RUN curl -L -o plugins/EaglerXPlan.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXPlan.jar

RUN curl -L -o plugins/EaglerXSupervisor.jar \
https://github.com/lax1dude/eaglerxserver/releases/download/v1.0.8/EaglerXSupervisor.jar

# 起動
CMD sh -c "echo eula=true > eula.txt && java -Xms1G -Xmx1G -jar paper.jar --port $PORT"
