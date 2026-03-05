/**
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 * Class Name      : HelloWorld
 * Author          : Mubarak Husain
 * Created Date    : Feb 26, 2026
 * Last Modified By: Mubarak Husain
 * Last Modified On: Feb 26, 2026
 * Description     : This class implements for......
 *  
 * Change History  :
 *  Date          │   Author     │   Change
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 *  Feb 26, 2026  │ <YourName>   │ Initial version
 * ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
 */

public class HelloWorld {

	@AuraEnabled(cacheable=true)
	public static string sayHello() {
		return 'Welcome to Panther School for LWC and Apex.';
	}

	@AuraEnabled(cacheable=true)
	public static List<Contact> conList(string accId){
		return [SELECT Id,Name FROM Contact WHERE AccountId=:accId];
	}
}