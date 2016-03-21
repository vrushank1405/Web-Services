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
 * Servlet implementation class ShowWSGraph
 */
@WebServlet("/ws/ShowWSGraph")
public class ShowWSGraph extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowWSGraph() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*List<WebServiceParse> entries = new ArrayList<WebServiceParse>();
		Connection con1 = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		try {
			con1 = DBConnectWS.getConnection();
			stmt1 = con1.createStatement();

			rs = stmt1.executeQuery("select * from webservice");

			while (rs.next()) {

				WebServiceParse wsdetail = new WebServiceParse(rs.getInt("id"),rs.getString("WebServiceURl"),rs.getInt("user"),
						Long.parseLong(rs.getString("start_time")),
						Long.parseLong(rs.getString("end_time")));
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
		request.setAttribute("WSGraph", entries);*/
		request.getRequestDispatcher("/ws/ShowWSGraph.jsp").forward(request,
				response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int count = Integer.parseInt(request.getParameter("NoOfProjects").toString());
		List<WebServiceParse> entries = new ArrayList<WebServiceParse>();
		
		Connection con1 = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		try {
			con1 = DBConnectWS.getConnection();
			stmt1 = con1.createStatement();

			rs = stmt1.executeQuery("select * from webservice LIMIT "+count);

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
		
		List<WebServiceParse> wsgraph = new ArrayList<WebServiceParse>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs1 = null;
		for(int i=0;i<= entries.size()-1;i++){
			//System.out.println(entries.get(i).id);
			
			try {
				conn = DBConnectWS.getConnection();
				stmt = conn.createStatement();

				rs1 = stmt.executeQuery("select avg(response_time) as rt, webservice_url from fnalpractice.webserviceresponse wsr inner join fnalpractice.webservice ws on ws.id = wsr.webserviceid  where webserviceid = "+entries.get(i).id);

				while (rs1.next()) {

					WebServiceParse wsdetail = new WebServiceParse(rs1.getString("webservice_url"),
							rs1.getLong("rt"));
					wsgraph.add(wsdetail);
				}
				
			} catch (SQLException e) {
				throw new ServletException(e);
			} finally {
			}

		}
		try {
			rs1.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		getServletContext().setAttribute("WSGraph", wsgraph);
		response.sendRedirect("ShowWSGraph.jsp");

	}

}
