package com.google.code.laplatafarmacias.server.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class XmlGateway extends HttpServlet {
    public static final String URL_REQUEST_ATTRIBUTE = "URL_REQUEST_ATTRIBUTE";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	// http://code.google.com/appengine/docs/java/urlfetch/overview.html
	URL url = new URL((String) req.getAttribute(URL_REQUEST_ATTRIBUTE));
	String charsetName = "utf-8";
	BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(), charsetName));
	String line;

	resp.setContentType("text/xml; charset=" + charsetName);

	PrintStream out = new PrintStream(resp.getOutputStream(), false, charsetName);

	while ((line = reader.readLine()) != null) {
	    out.println(line);
	    // System.out.println("line:" + line);
	}
	reader.close();
	out.flush();

    }
}
