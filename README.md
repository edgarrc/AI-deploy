# AI-deploy

## Using

Parameters:

| Parameter     | Value        |
| ------------- |-------------:|
| PORT          | tcp port used by pyramid service |
| APPNAME       | entrypoint/cmd run that will be started |
| -v            | it is a docker parameter, but just to remind you that you have to map you app folder that contains your APPNAME |

Example, running the sampleapp:

```
git clone https://github.com/edgarrc/AI-deploy.git
cd AI-deploy
docker run -e PORT=8080 -e APPNAME=run.py -p 8080:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy
```

If you don't have docker installed, you can try on [Play With Docker lab](https://labs.play-with-docker.com/)

## Bulding

You don't have to build this image as it is avaialbe on docker hub, but if you whish to build, then run:

```
git clone https://github.com/edgarrc/AI-deploy.git
cd AI-deploy
docker image build -t edgarrc/ai-deploy .
```

Then you can run with your local generated image instead

```
docker run -e PORT=8080 -e APPNAME=run.py -p 8080:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy
```
