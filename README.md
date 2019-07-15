# AI-deploy

## using

Parameters:

- **PORT**: tcp port used by pyramid service
- **APPNAME**: entrypoint/cmd run that will be started

Example:

```
git clone https://github.com/edgarrc/AI-deploy.git
cd AI-deploy
docker run -e PORT=8080 -e APPNAME=run.py -p 8080:80 -v $(pwd)/sampleapp:/app -it edgarrc/ai-deploy
```
