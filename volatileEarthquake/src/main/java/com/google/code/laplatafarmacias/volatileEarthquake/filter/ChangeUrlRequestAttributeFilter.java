package com.google.code.laplatafarmacias.volatileEarthquake.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.google.code.unlp.tesis.volatiler.filter.AbstractAffinityActivableFilter;

public class ChangeUrlRequestAttributeFilter extends AbstractAffinityActivableFilter {

    @Override
    protected void doDoFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,
	    ServletException {

	if (!getAffinityResolver().matchAffinityBeforeFilterChain(request, response)
		|| !(request instanceof HttpServletRequest)) {
	    chain.doFilter(request, response);
	    return;
	}

	HttpServletRequestWrapper wrappedRequest = new HttpServletRequestWrapper((HttpServletRequest) request) {
	    @Override
	    public Object getAttribute(String name) {
		if ("URL_REQUEST_ATTRIBUTE".equals(name)) {
		    return "http://pipes.yahoo.com/pipes/pipe.run?_id=f12bbf9e1ecaa09dd0c1a37346528c07&_render=rss";
		} else {
		    return super.getAttribute(name);
		}
	    }
	};
	chain.doFilter(wrappedRequest, response);
    }

}
