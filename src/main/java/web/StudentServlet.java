package web;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import dao.IDaoLocal;
import entities.Filiere;
import entities.Role;
import entities.Student;

/**
 * Servlet implementation class StudentServlet
 */
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@EJB(beanName = "studentService")
	private IDaoLocal<Student> daoLocal;

	@EJB(beanName = "filiereService")
	private IDaoLocal<Filiere> filiereDao;
	
	@EJB(beanName = "roleService")
	private IDaoLocal<Role> roleDao;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Student> students = daoLocal.findAll();
		List<Filiere> filieres = filiereDao.findAll();
		List<Role> roles=roleDao.findAll();
		request.setAttribute("students", students);
		request.setAttribute("filieres", filieres);
		request.setAttribute("roles", roles);
		request.getRequestDispatcher("Student.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idFiliere = 0;
		int idRole=0;
		String login = request.getParameter("login");
		String pass = request.getParameter("pass");
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String tell = request.getParameter("tell");
		if (request.getParameter("filiere") != null && !request.getParameter("filiere").isEmpty()) {
			idFiliere = Integer.parseInt(request.getParameter("filiere"));
		}
		if (request.getParameter("role") != null && !request.getParameter("role").isEmpty()) {
			idRole = Integer.parseInt(request.getParameter("role"));
		}
		System.out.println();
		System.out.println();
		System.err.println("filiere = " + idFiliere);
		System.out.println();
		System.out.println();
		int id = 0;

		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
			id = Integer.parseInt(request.getParameter("id"));
		}
		if (request.getParameter("action") != null && !request.getParameter("action").isEmpty()) {
			String action = request.getParameter("action");
			System.out.println();
			System.out.println();
			System.err.println("action = " + action);
			System.out.println();
			System.out.println();
			switch (action) {
			case "add":
				System.out.println(pass + " " + login + " " + firstname + " " + " " + lastname + " " + " " + tell + " "
						+ idFiliere);
				daoLocal.create(new Student(pass, login, firstname, lastname, tell, filiereDao.findById(idFiliere)));
				break;
			
		       case "update":
		            Student r = daoLocal.findById(id);
		            System.err.println(r.toString());
		            System.out.println(id + " " + pass + " " + login + " " + firstname + " " + " " + lastname + " " + " " + tell + " "
		                    + idFiliere);

		            r.setLogin(request.getParameter("login"));
		            r.setPassword(request.getParameter("pass"));
		            r.setFirstname(request.getParameter("firstName"));
		            r.setLastname(request.getParameter("lastName"));
		            r.setTell(request.getParameter("tell"));
		            r.setFiliere(filiereDao.findById(idFiliere));

		            daoLocal.update(r);
		            break;
			case "del":
				System.out.println();
				System.out.println();
				System.err.println("id = " + id);
				System.out.println();
				System.out.println();
				daoLocal.delete(daoLocal.findById(id));
				break;
			case "affect":
			//	  Student rl = daoLocal.findById(id);
			//	  List<Role> roleList=(List<Role>) roleDao.findById(idRole);
			//	rl.setRoles(roleList);
				daoLocal.affect(roleDao.findById(idRole), daoLocal.findById(id));
			default:
				System.out.println("default");
				break;
			}
		}
		doGet(request, response);
	}

}
