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

import ws.DBConnectWS;

/**
 * Servlet implementation class WebService
 */
@WebServlet("/ws/WebService")
public class WebService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String Url = "";
	static String URLValue = "";
	static int methodIdActive = 0;
	static String methodName = "";
	int methodParamCount = 0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WebService() {
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
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int id = Integer.parseInt(request.getParameter("id"));

		if (id == 0) {
			List<WebServiceParse> wsm = new ArrayList<WebServiceParse>();
			List<WebServiceParse> wsp = new ArrayList<WebServiceParse>();
			int methodCount = 1;
			int parameterCount = 1;
			String url = request.getParameter("webServiceUrl");
			URLValue = url;
			javaxt.webservices.WSDL wsdl = new javaxt.webservices.WSDL(url);
			for (javaxt.webservices.Service service : wsdl.getServices()) {
				// System.out.println(service.getName());
				Url = service.getURL();
				if (service.getMethods() != null) {
					for (javaxt.webservices.Method method : service
							.getMethods()) {
						int count = 0;
						// System.out.println(" - " + method.getName());
						javaxt.webservices.Parameters parameters = method
								.getParameters();
						if (parameters != null) {
							for (javaxt.webservices.Parameter parameter : parameters
									.getArray()) {
								wsp.add(new WebServiceParse(parameterCount,
										parameter.getName(), methodCount));
								count++;
								// System.out.println("   * " +
								// parameter.getName());
								parameterCount++;
							}
						}
						wsm.add(new WebServiceParse(methodCount, method
								.getName(), count, 0));
						methodCount++;
					}
				}
			}
			getServletContext().setAttribute("WebServiceURL", URLValue);
			getServletContext().setAttribute("WSMethod", wsm);
			getServletContext().setAttribute("WSParameter", wsp);
			getServletContext().setAttribute("parameterShow", 0);
			response.sendRedirect("WebService.jsp");
		} else if (id == 1) {
			int methodId = Integer.parseInt(request.getParameter("MethodName"));
			methodIdActive = methodId;
			getServletContext().setAttribute("MethodId", methodId);
			getServletContext().setAttribute("WebServiceURL", URLValue);
			getServletContext().setAttribute("parameterShow", 1);
			response.sendRedirect("WebService.jsp");
		} else if (id == 2) {
			String user = request.getParameter("User");
			List<WebServiceParse> wsm = (ArrayList<WebServiceParse>) getServletContext()
					.getAttribute("WSMethod");
			for (WebServiceParse row : wsm) {
				if (row.getMethodId() == methodIdActive) {
					methodName = row.getMethodName();
					methodParamCount = row.getMethodParameter();
				}
			}

			List<WebServiceParse> wsp = (ArrayList<WebServiceParse>) getServletContext()
					.getAttribute("WSParameter");
			String[] mylist = new String[methodParamCount];
			int arrcnt = 0;
			for (WebServiceParse entry : wsp) {
				if (entry.getMethodId() == methodIdActive) {
					mylist[arrcnt] = entry.getParameterName();
					arrcnt++;
				}
			}
			String WebServiceURL = Url + "/" + methodName + "?";
			for (int i = 0; i <= mylist.length - 1; i++) {
				if ((mylist.length - 1) == i) {
					WebServiceURL += mylist[i] + "="
							+ request.getParameter(mylist[i]);
				} else {
					WebServiceURL += mylist[i] + "="
							+ request.getParameter(mylist[i]) + "&";
				}
			}
			WebServiceURL += "&User=" + user;
			long lStartTime;
			long lEndTime;
			int WebServiceId = 0;

			Connection con = null;
			Statement stmt = null;

			try {
				con = DBConnectWS.getConnection();
				Statement stmt1 = con.createStatement();

				String rs1 = "insert into webservice(webservice_url) values(?)";
				PreparedStatement psquery = con.prepareStatement(rs1);
				psquery.setString(1, URLValue);
				psquery.executeUpdate();

				stmt1.close();

				stmt = con.createStatement();

				ResultSet rs = stmt
						.executeQuery("select * from webservice where webservice_url = '"
								+ URLValue + "'");

				while (rs.next()) {

					WebServiceId = rs.getInt("id");
				}
				rs.close();

			} catch (SQLException e) {

				try {
					throw new ServletException(e);
				} catch (ServletException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} finally {
				try {
					stmt.close();
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

			for (int i = 0; i < Integer.parseInt(user); i++) {
				lStartTime = System.nanoTime() / 1000000;
				WebServiceCall.WSCall(WebServiceURL);
				// System.out.println(i);
				lEndTime = System.nanoTime() / 1000000;

				Connection conn = null;
				Statement stmt1 = null;

				try {

					conn = DBConnectWS.getConnection();
					stmt1 = conn.createStatement();

					String rs2 = "insert into webserviceresponse(webserviceid,user,start_time,end_time, response_time) values(?,?,?,?,?)";
					PreparedStatement psquery1 = conn.prepareStatement(rs2);
					psquery1.setInt(1, WebServiceId);
					psquery1.setInt(2, i);
					psquery1.setLong(3, lStartTime);
					psquery1.setLong(4, lEndTime);
					psquery1.setLong(5, lEndTime - lStartTime);
					psquery1.executeUpdate();

					// c.close();
					// getServletContext().setAttribute("ApartmentDetailsLMS",
					// entries);
				} catch (SQLException e) {
					try {
						throw new ServletException(e);
					} catch (ServletException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				} finally {
					try {
						stmt1.close();
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

				}
			}
			// System.out.println(WebServiceURL);
			getServletContext().setAttribute("ShowLoader", 1);
			response.sendRedirect("WebService.jsp");
		}
	}
}
