/**
 * 
 */
package com.google.code.laplatafarmacias.server.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.URL;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author eduardo.pereda
 * 
 */
@SuppressWarnings("serial")
public class GetPharmaciesOnDuty extends HttpServlet {

    /**
     * This corresponds to
     * http://pipes.yahoo.com/epere4/farmaciasdeturnolaplatamapeadas
     */
    public static final String PHARMACIES_ON_DUTY_LOCATION = "http://pipes.yahoo.com/pipes/pipe.run?_id=89053b69288b8aef14c44a916f33a206&_render=rss";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
	// http://code.google.com/appengine/docs/java/urlfetch/overview.html

	URL url = new URL(PHARMACIES_ON_DUTY_LOCATION);
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
