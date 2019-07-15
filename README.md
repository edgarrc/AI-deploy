# AI-deploy

## USE

Parameters:

```
PORT: tcp port used by pyramid service
APPNAME: entrypoint/cmd run that will be started
```

```
git clone
docker run -e PORT=8080 -e APPNAME=run2.py -p 8080:80 -v $(pwd):/app -it edgarrc/ai-deploy
```
