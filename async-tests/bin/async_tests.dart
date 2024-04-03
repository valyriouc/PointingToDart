import "dart:convert";
import "dart:io";
import "dart:js_interop";

abstract interface class EndpointBase {

  void Get(HttpRequest request);

  void Post(HttpRequest request);

  void Delete(HttpRequest request);
}

class SecondEndpoint extends EndpointBase {
  @override
  void Delete(HttpRequest request) {
    // TODO: implement Delete

    
  }

  // TODO: Setting application header
  @override
  void Get(HttpRequest request) {
    // TODO: implement Get
    request.response.headers.contentType = ContentType.json;
    request.response.write(<String, String>{"hund": "hello", "katze": "nice", "test": "test"});
  }

  @override
  void Post(HttpRequest request) {
    // TODO: implement Post
  }

}

class FirstEndpoint extends EndpointBase {
  @override
  void Delete(HttpRequest request) {
    // TODO: implement Delete
    
  }

  @override
  void Get(HttpRequest request) {
    // TODO: implement Get
    request.response.headers.contentType = ContentType.json;
    request.response.writeln("[1,2,3]");
  }

  @override
  void Post(HttpRequest request) {
    // TODO: implement Post
  }
}

void routing(HttpRequest request) {
  Map<String, EndpointBase> endpoints = <String, EndpointBase>{
    "/": FirstEndpoint(),
    "/second": SecondEndpoint(),
  };

  EndpointBase? current = endpoints[request.uri.path];
  if (current == null){
    request.response.statusCode = 404;
    request.response.close();
    return;
  }

  switch(request.method) {
    case "GET": 
      current.Get(request);
      break;
    case "POST": 
      current.Post(request);
      break;
    case "DELETE":
      current.Delete(request);
      break;
    default:
      request.response.statusCode = 405;
      break;
  }

  request.response.close();
}

Future<void> main(List<String> arguments) async {
  final HttpServer server = await HttpServer.bind(InternetAddress.tryParse("127.0.0.1"), 8080);
  server.listen((request) => routing(request)); 

}
