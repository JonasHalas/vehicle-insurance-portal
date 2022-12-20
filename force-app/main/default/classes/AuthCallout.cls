public with sharing class AuthCallout {

/** 
 * TODO: Look at the Wrapper class to display the JSON in LWC: 
 * https://www.salesforceben.com/what-is-wrapper-class-in-salesforce/
 */

    @AuraEnabled(cacheable=true)
    public static String getVehDetails(String vehReg) {

        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('callout:DataOrgAPI/services/apexrest/Vehicle/' + vehReg);
        HttpResponse res = http.send(req); 

        System.debug('vehReg = '+vehReg);
        System.debug('GET StatusCode = '+res.getStatusCode());
        System.debug('Body = '+res.getBody());

        return res.getBody();
    }
    
/* 
? Execute Anonymous:
AuthCallout.getVehDetails('49WW516176');

? Result from Execute Anonymous:
{"attributes":{
    "type":"Vehicle__c",
    "url":"/services/data/v56.0/sobjects/Vehicle__c/a007S0000031L9VQAU"
    },
    "Amount_of_owners__c":1,
    "Brand__c":"Ford",
    "Contact__c":"0037S00000CJkmsQAD",
    "Fuel__c":"Electric",
    "Model__c":"F-150",
    "Name":"49WW516176",
    "OwnerId":"0057S00000113q9QAA",
    "PUCC__c":"2023-07-25",
    "Production_Year__c":2022,
    "Id":"a007S0000031L9VQAU",
    "Contact__r":
    
    {"attributes":{
        "type":"Contact",
        "url":"/services/data/v56.0/sobjects/Contact/0037S00000CJkmsQAD"},
        "Id":"0037S00000CJkmsQAD",
        "Name":"Nico Hülkenberg"
    }
}
*/

}