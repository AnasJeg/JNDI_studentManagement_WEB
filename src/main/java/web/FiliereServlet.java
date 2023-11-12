package web;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.IDaoLocal;
import entities.Filiere;
import entities.Role;

/**
 * Servlet implementation class FiliereServlet
 */
public class FiliereServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB(beanName = "filiereService")
	private IDaoLocal<Filiere> iDaoLocal;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Filiere> filieres=iDaoLocal.findAll();
		
		request.setAttribute("filiere", filieres);
		
		 request.getRequestDispatcher("Filiere.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String name = request.getParameter("name");
		 String code = request.getParameter("code");
		    int id = 0;

		    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
		        id = Integer.parseInt(request.getParameter("id"));
		    }
		    if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			    String action = request.getParameter("action");
		    
		    switch (action) {
		        case "add":
		        	iDaoLocal.create(new Filiere(code,name));
		            break;
		        case "update":
		        	Filiere r = iDaoLocal.findById(id);
		        	r.setCode(code);
		            r.setName(name);
		            iDaoLocal.update(r);
		            break;
		        case "del":
		        	iDaoLocal.delete(iDaoLocal.findById(id));
		            break;
		        default:
		 
		            break;
		    }
		    }
		doGet(request, response);
	}

}
