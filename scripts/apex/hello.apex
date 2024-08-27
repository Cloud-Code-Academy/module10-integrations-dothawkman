// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

public static void getDummyJSONUserFromId(String dummyUserId) {
		// Create HTTP request to send.
			Http http = new http();
			HttpRequest http = new HttpRequest();
		
		// Set the endpoint URL. Use direct URL or for best practices use Named Credential.
			request.setEndpoint('https://dummyjson.com/user/' + dummyUserId);
		// Set the HTTP method to GET.
			request.setMethod('GET');
		// Send the HTTP request and get the response.
			HttpResponse response = http.send(request);
			system.debug(reponse.getBody());
			system.debug(response.getStatusCode());
			system.debug(response.getStatus());
}