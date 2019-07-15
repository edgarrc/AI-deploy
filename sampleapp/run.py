from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

if __name__ == '__main__':
    
    print("Iniciando servico em " +  str(sys.argv[0]))
    
    config = Configurator()
	
    app = config.make_wsgi_app()
    server = make_server('0.0.0.0', sys.argv[0], app)
    server.serve_forever()		
