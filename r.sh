docker stop langchain
docker rm langchain

docker run -d -t -v /shared/data:/shared/data --name langchain langchain

