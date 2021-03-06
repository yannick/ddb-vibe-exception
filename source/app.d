import vibe.d;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	listenHTTP(settings, &hello);

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.writeBody("Hello, World!");
}

unittest
{
  import ddb.postgres;
  auto conn = new PGConnection([
   "host" : "localhost",
   "database" : "test",
   "user" : "test",
   "password" : ""]);
  auto query = "SELECT test FROM test;";
	auto cmd = new PGCommand(conn, query);
  
}