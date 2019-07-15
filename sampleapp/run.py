from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response
import sys

if __name__ == '__main__':

    # Print every command line parameter received
    print("Parameters: " + str(len(sys.argv)) + " values: " + str(sys.argv))	
    
    # Default port to listen
    port = 8080
    if len(sys.argv) > 1:
        port = int(sys.argv[1])
		
    
    config = Configurator()
	
    print("Starting the service " + str(port))    
    app = config.make_wsgi_app()
    server = make_server('0.0.0.0', port, app)
    server.serve_forever()	
