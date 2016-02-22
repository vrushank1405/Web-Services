package ws;

public class WebServiceParse {

	int methodId;
	String methodName;
	int parameterId;
	String parameterName;
	int methodParameter;

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
