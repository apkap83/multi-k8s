docker build -t apkap83/udemy_8910_client:latest -t apkap83/udemy_8910_client:$SHA -f ./client/Dockerfile ./client
docker build -t apkap83/udemy_8910_server:latest -t apkap83/udemy_8910_server:$SHA -f ./server/Dockerfile ./server
docker build -t apkap83/udemy_8910_worker:latest -t apkap83/udemy_8910_worker:$SHA -f ./server/Dockerfile ./worker
docker push apkap83/udemy_8910_client:latest
docker push apkap83/udemy_8910_server:latest
docker push apkap83/udemy_8910_worker:latest

docker push apkap83/udemy_8910_client:$SHA
docker push apkap83/udemy_8910_server:$SHA
docker push apkap83/udemy_8910_worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=apkap83/udemy_8910_client:$SHA
kubectl set image deployments/server-deployment server=apkap83/udemy_8910_server:$SHA
kubectl set image deployments/worker-deployment worker=apkap83/udemy_8910_worker:$SHA