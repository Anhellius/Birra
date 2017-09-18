package birra.modelo.tipificaciones;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.MDC;
import org.apache.log4j.NDC;
import org.apache.logging.log4j.ThreadContext;




/**
 * An example authentication filter which is used to intercept all the requests
 * for fetching the user name from it and put the user name to the Log4j Mapped
 * Diagnostic Context (MDC), so that the user name could be used for
 * differentiating log messages.
 *
 * @author veerasundar.com/blog
 *
 */
public class AuthenticationFilter implements Filter {
	
	
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {

        try {
            /*
             * This code puts the value "userName" to the Mapped Diagnostic
             * context. Since MDc is a static class, we can directly access it
             * with out creating a new object from it. Here, instead of hard
             * coding the user name, the value can be retrieved from a HTTP
             * Request object.sssssss
             */
        	HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse res = (HttpServletResponse) response;    
            NDC.setMaxDepth(0);
         	HttpSession session = req.getSession(false);  
            if (session!=null ) {
            	
            	//Agente a = (Agente)session.getAttribute("empleado");
            	String user = "";
            /*	if (a!=null)
            		user = a.getNombre() + " " +a.getApellido();   */             	
            	 if (user!=null){
            		 NDC.remove();
            		 NDC.push(user+" - "+req.getRemoteHost());
            		
            	 }else{
            		
            	 }
            }      
        	

            chain.doFilter(request, response);

        } finally {
        	
        }

    }

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}