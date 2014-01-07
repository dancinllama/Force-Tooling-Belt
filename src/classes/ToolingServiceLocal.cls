/**
 * ToolingService
 * @description Singleton class for providing a service interacting with the Tooling API
 * based on wsdl2apex generated code.
 * @author James Loghry (@dancinllama on twitter)
 * @date 1/6/2013
 */
 public class ToolingServiceLocal{

 	public ToolingAPI.ToolingService service {get; private set;}

 	//Would love to extend the WSDL generated code instead of using an instance variable here
 	//However, the webservice.invoke method does not like it. #sadface
 	private static ToolingServiceLocal instance {get;set;}

    //Private constructor for Singleton
    private ToolingServiceLocal(){
    	service = new ToolingAPI.ToolingService();
    	service.endpoint_x = (URL.getSalesforceBaseUrl()).toExternalForm() + 
    		'/services/Soap/T/29.0';
    	service.SessionHeader = new ToolingAPI.SessionHeader_element();
    	service.SessionHeader.sessionId = UserInfo.getSessionId();
    }

    //Getter for grabbing a singleton based instance of this method
    public static ToolingServiceLocal getInstance(){
    	if(instance == null){
    		instance = new ToolingServiceLocal();
    	}
    	return instance;
    }
}