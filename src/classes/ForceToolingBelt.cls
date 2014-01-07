/**
 * ForceToolingBelt
 * @description Set of static utility methods for interacting with the Tooling API
 * @author James Loghry (@dancinllama on twitter)
 * @date 1/7/2013
 */
public class ForceToolingBelt{

	/**
	 * Query for and return all Apex classes via the Tooling API.
	 * @return List of apex classes matching the query.
	 */
	public static List<ToolingAPI.ApexClass> queryAllApexClasses(){
		return queryApexClasses('Select Id,Metadata,Name,SymbolTable From ApexClass');
	}

	/**
	 * Query for and return Apex classes via the Tooling API.
	 * @param queryString The query to perform against ApexClass records using the Tooling API.
	 * @return List of apex classes matching the queryString.
	 */
	public static List<ToolingAPI.ApexClass> queryApexClasses(String queryString){
		ToolingAPI.ToolingService service = ToolingServiceLocal.getInstance().service;
		System.debug('ForceToolingBelt: Querying Apex Classes: ' + queryString);
		ToolingAPI.QueryApexClassesResult queryResult = service.queryApexClasses(queryString);
		return queryResult.records;
	}

	/**
	 * Create sObjects using the ToolingAPI
	 * @param sobjects The list of sobjects to create.
	 * @return A list of SaveResult  pertaining to whether the creation of the sobjects
	 * were created or resulted in error.
	 */
	public static List<ToolingAPI.SaveResult> createObjects(List<ToolingAPI.sobject_X> sobjects){
		List<ToolingAPI.SaveResult> saveResults = null;
		if(sobjects != null){
			ToolingAPI.ToolingService service = ToolingServiceLocal.getInstance().service;
			System.debug('ForceToolingBelt: Creating ' + sobjects.size() + ' sobjects: ' + sobjects);
			saveResults = service.create(sobjects);
		}
		return saveResults;
	} 
}