package ws;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * Servlet implementation class DeleteWebService
 */
@WebServlet("/ws/DeleteWebService")
public class DeleteWebService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteWebService() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int wid = Integer.parseInt(request.getParameter("Wid").toString());
		List<WebServiceParse> entries = new ArrayList<WebServiceParse>();
		Connection con1 = null;
		Statement stmt1 = null;
		//ResultSet rs = null;
		try {
			con1 = DBConnectWS.getConnection();
			stmt1 = con1.createStatement();
			
			String deleteSQL = "DELETE from webservice WHERE id = ?";
			PreparedStatement preparedStatement = con1.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, wid);
			// execute delete SQL stetement
			preparedStatement.executeUpdate();
			/*rs = stmt1.executeQuery("Delete from webservice where id = '" + wid
					+ "'");

						rs.close();
*/			// c.close();
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
		// getServletContext().setAttribute("ShowWebServiceDD", entries);
		response.sendRedirect("ShowWebService");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
