package web;




import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocal;
import entities.Role;

/**
 * Servlet implementation class RoleServlet
 */
public class RoleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB(beanName = "roleService")
	private IDaoLocal<Role> daoLocal;
    /**
     * @see HttpServlet#HttpServlet()
     */
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   List<Role> roles = daoLocal.findAll();
	      
		   request.setAttribute("rl", roles);

	        request.getRequestDispatcher("Role.jsp").forward(request, response);
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		    String name = request.getParameter("name");
		    int id = 0;

		    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
		        id = Integer.parseInt(request.getParameter("id"));
		    }
		    if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			    String action = request.getParameter("action");
		    
		    switch (action) {
		        case "add":
		            daoLocal.create(new Role(name));
		            break;
		        case "update":
		            Role r = daoLocal.findById(id);
		            r.setName(name);
		            daoLocal.update(r);
		            break;
		        case "del":
		            daoLocal.delete(daoLocal.findById(id));
		            break;
		        default:
		 
		            break;
		    }
		    }
		// response.sendRedirect(request.getContextPath() + "/RoleServlet");
		doGet(request, response);

	}

}
