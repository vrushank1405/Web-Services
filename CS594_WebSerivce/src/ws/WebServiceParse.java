package ws;

public class WebServiceParse {

	int methodId;
	String methodName;
	int parameterId;
	String parameterName;
	int methodParameter;
	int id;
	String webServiceUrl;
	int user;
	long startTime;
	long endTime;
	long responseTime;
	
	public WebServiceParse(int id, String webServiceUrl){
		this.id = id;
		this.webServiceUrl = webServiceUrl;
	}
	
	public WebServiceParse(String wsurl, long responseTime){
		this.webServiceUrl = wsurl;
		this.responseTime = responseTime;
		
	}
	public WebServiceParse(int id, String wsurl, int user, long start_time, long end_time){
		this.id = id;
		this.webServiceUrl= wsurl;
		this.user = user;
		this.startTime = start_time;
		this.endTime = end_time;
	}

	public WebServiceParse(int methodId, String methodName, int parameterCount, int value) {
		this.methodId = methodId;
		this.methodName = methodName;
		this.methodParameter = parameterCount;
	}
	
	public WebServiceParse(int parameterId, String parameterName, int methodId){
		this.parameterId = parameterId;
		this.parameterName = parameterName;
		this.methodId = methodId;
	}
	
	

	
	public long getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(long responseTime) {
		this.responseTime = responseTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWebServiceUrl() {
		return webServiceUrl;
	}

	public void setWebServiceUrl(String webServiceUrl) {
		this.webServiceUrl = webServiceUrl;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}

	public long getStartTime() {
		return startTime;
	}

	public void setStartTime(long startTime) {
		this.startTime = startTime;
	}

	public long getEndTime() {
		return endTime;
	}

	public void setEndTime(long endTime) {
		this.endTime = endTime;
	}

	public int getMethodParameter() {
		return methodParameter;
	}

	public void setMethodParameter(int methodParameter) {
		this.methodParameter = methodParameter;
	}

	public int getMethodId() {
		return methodId;
	}

	public void setMethodId(int methodId) {
		this.methodId = methodId;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public int getParameterId() {
		return parameterId;
	}

	public void setParameterId(int parameterId) {
		this.parameterId = parameterId;
	}

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}
}
