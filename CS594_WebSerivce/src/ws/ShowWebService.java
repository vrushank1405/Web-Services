package ws;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowWebService
 */
@WebServlet("/ws/ShowWebService")
public class ShowWebService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowWebService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<WebServiceParse> entries = new ArrayList<WebServiceParse>();
		Connection con1 = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		try {
			con1 = DBConnectWS.getConnection();
			stmt1 = con1.createStatement();

			rs = stmt1.executeQuery("select * from webservice");

			while (rs.next()) {

				WebServiceParse wsdetail = new WebServiceParse(rs.getInt("id"),rs.getString("webservice_url"));
				entries.add(wsdetail);
			}
			rs.close();
			// c.close();
			// getServletContext().setAttribute("ApartmentDetailsLMS", entries);
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			try {

				stmt1.close();
				con1.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}
		getServletContext().setAttribute("ShowWebServiceDD", entries);
		request.getRequestDispatcher("/ws/ShowWebService.jsp").forward(request,
				response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
