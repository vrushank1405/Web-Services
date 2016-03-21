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
		int webid = 0;
		if(request.getParameter("Id") != null){
			webid = Integer.parseInt(request.getParameter("Id"));
		}
		
		List<WebServiceParse> row = new ArrayList<WebServiceParse>();
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
			stmt1.close();
			
			Statement stmt = con1.createStatement();;
			ResultSet rs1 = null;
			rs1 = stmt.executeQuery("select avg(response_time) as rt, webserviceid from fnalpractice.webserviceresponse wsr inner join fnalpractice.webservice ws on ws.id = wsr.webserviceid where webserviceid = '"+webid+"'");
			
			while (rs1.next()) {

				WebServiceParse wsdetail = new WebServiceParse(rs1.getString("webserviceid"),
						rs1.getLong("rt"));
				row.add(wsdetail);
			}
			rs1.close();
			stmt.close();
			// c.close();
			// getServletContext().setAttribute("ApartmentDetailsLMS", entries);
		} catch (SQLException e) {
			throw new ServletException(e);
		} finally {
			try {

				//stmt1.close();
				con1.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}
		getServletContext().setAttribute("ShowWebServiceDD", entries);
		getServletContext().setAttribute("ShowWebServiceIndividualGraph", row);
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
