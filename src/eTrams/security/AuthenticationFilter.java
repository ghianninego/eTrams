package eTrams.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eTrams.model.FinalUserBean;

public class AuthenticationFilter implements Filter {
	  private FilterConfig config;

	  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException 
	  {
		FinalUserBean fub = (FinalUserBean) ((HttpServletRequest) req).getSession().getAttribute("user"); 
		System.out.println(((HttpServletRequest)req).getRequestURL());
		String result[] = (((HttpServletRequest)req).getRequestURL()).toString().split("/");
		for (int i = 0; i < result.length; i++)
			System.out.println(i + " " + result[i]);
	    if (fub == null) 
	    {
	    	((HttpServletRequest) req).getSession().setAttribute("errorMessage", "You are not logged in!");
	      ((HttpServletResponse) resp).sendRedirect("../errorPage.jsp");
	    } 
	    else if (fub.getRoleName().equals("Admin"))
	    {
	    	if (!result[5].equals("admin"))
	    	{
		    	((HttpServletRequest) req).getSession().setAttribute("errorMessage", "You are not authorized to view this page. This page is off limits");
		    	((HttpServletResponse) resp).sendRedirect("../errorPage.jsp");
	    	}
	    	else
		    	chain.doFilter(req, resp);
	    }
	    else if (fub.getRoleName().equals("Coordinator"))
	    {
	    	if (!result[5].equals("coordinator"))
	    	{
		    	((HttpServletRequest) req).getSession().setAttribute("errorMessage", "You are not authorized to view this page. This page is off limits");
		    	((HttpServletResponse) resp).sendRedirect("../errorPage.jsp");
	    	}
	    	else
		    	chain.doFilter(req, resp);
	    }
	    else if (fub.getRoleName().equals("Participant"))
	    {
	    	if (!result[5].equals("participant"))
	    	{
		    	((HttpServletRequest) req).getSession().setAttribute("errorMessage", "You are not authorized to view this page. This page is off limits");
		    	((HttpServletResponse) resp).sendRedirect("../errorPage.jsp");
	    	}
	    	else
		    	chain.doFilter(req, resp);
	    }
	    else if (fub.getRoleName().equals("Staff"))
	    {
	    	if (!result[5].equals("staff"))
	    	{
		    	((HttpServletRequest) req).getSession().setAttribute("errorMessage", "You are not authorized to view this page. This page is off limits");
		    	((HttpServletResponse) resp).sendRedirect("../errorPage.jsp");
	    	}
	    	else
		    	chain.doFilter(req, resp);
	    }
	    else 
	    {
	    	chain.doFilter(req, resp);
	    }
	  }
	  
	  public void init(FilterConfig config) throws ServletException 
	  {
		  this.config = config;
	  }

	  public void destroy() {
		    config = null;
	  }
}