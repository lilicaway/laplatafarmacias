/**
 * 
 */
package com.google.code.laplatafarmacias.server.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	request.setAttribute(XmlGatewayServlet.URL_REQUEST_ATTRIBUTE, PHARMACIES_ON_DUTY_LOCATION);
	RequestDispatcher requestDispatcher = request.getRequestDispatcher("/xmlGateway");
	requestDispatcher.forward(request, response);
    }
}
