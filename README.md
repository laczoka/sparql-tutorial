sparql-tutorial
===============

Interactive sparql tutorial

See it in action [here](http://tools.ebusiness-unibw.org/tools/sparql-tutorial/).

Prerequisites
-------------
1.  Make sure you have [Stardog](http://www.stardog.com/) up & running. (Tested with 1.1.3 and 1.1.4)
2.  Setup up an HTTP Proxy so that /stardog/endpoint/d1 requests are forwared to your Stardog instance
	
		# Example Apache config
		# ... somewhere in your httpd.conf
		ProxyPass /stardog/endpoint/d1 http://localhost:5822/d1
		ProxyPassReverse /stardog/endpoint/d1 http://localhost:5822/d1`

3.  Make sure `stardog` & `stardog-admin` is on your `PATH`

Setup
-----
1.  `git clone https://github.com/laczoka/sparql-tutorial "some directory accessible by your web server"` 
2.  Navigate into the cloned directory
3.  Run `./setup_stardog.sh YOUR_STARDOG_ADMIN_PASSWORD` (depending on your setup you may need to run it as root) 
4.  Run `./sparql-demo-load-stardog.sh YOUR_STARDOG_ADMIN_PASSWORD` (depending on your setup you may need to run it as root)
5.  Navigation your browser to *index.html* (depends on your web server setup)
