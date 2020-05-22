import sys
from waitress import serve
from flask import Flask
from flask import request
app = Flask(__name__)

@app.route("/test")
def test():
    return "success"

if __name__ == '__main__':

    # Print every command line parameter received
    print("Parameters: " + str(len(sys.argv)) + " values: " + str(sys.argv))	
    
    # Default port to listen
    port = 8080
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
	
    print("Starting the service " + str(port))    

    # Waitress
    serve(app, host="0.0.0.0", port=port)
