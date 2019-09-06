# AI-deploy

## Using

Interactive:

```
docker run --name <INSTANCENAME> -e PORT=<PORT> -e APPNAME=<APPNAME> -v <APPFOLDER>:/app edgarrc/ai-deploy
```

Or as a daemon:

```
docker run -d --name <INSTANCENAME> -e PORT=<PORT> -e APPNAME=<APPNAME> -v <APPFOLDER>:/app edgarrc/ai-deploy
```

Parameters:

| Parameter       | Value        |
| ----------------|:-------------|
| INSTANCENAME    | The docker instance name, usually the name of your project |
| PORT            | tcp port used by pyramid service |
| APPNAME         | entrypoint/cmd run that will be started |
| APPFOLDER       | You have to map you app folder that contains your APPNAME |

Example, running the sampleapp:

Clone

```
git clone https://github.com/edgarrc/AI-deploy.git
cd AI-deploy
```

Run interactive

```
docker run --name testing -e PORT=8080 -e APPNAME=run.py -p 8080:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy
```

Run as a daemon

```
sudo docker run -d --name testing -e PORT=80 -e APPNAME=run.py -p 80:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy 
```

If you don't have docker installed, you can try on [Play With Docker lab](https://labs.play-with-docker.com/)

## Testing

The test url of the sampleapp is:

http://{ip}:{port}/test

If you are on a linux terminal, you can use elinks

```
apt-get update && apt-get install elinks -y
elinks http://172.18.0.22/test
```

You should see the "success" word.

## Admin

You can restart it:

```
sudo docker restart <INSTANCENAME>
```

## Bulding

You don't have to build this image as it is avaialbe on docker hub, but if you whish to build, then run:

```
git clone https://github.com/edgarrc/AI-deploy.git
cd AI-deploy
docker image build -t edgarrc/ai-deploy .
```

Now you can run with your local generated image instead using:

```
docker run -e PORT=8080 -e APPNAME=run.py -p 8080:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy
```
