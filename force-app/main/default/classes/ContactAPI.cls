@RestResource(urlMapping='/Vehicle/*')
global with sharing class ContactAPI {
 
    @HttpGet
    global static Vehicle__c getCarDetails() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String vehReg = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);

        Vehicle__c vehList = [
            SELECT Amount_of_owners__c, 
                   Brand__c, 
                   Contact__c,
                   Fuel__c, 
                   Model__c, 
                   Production_Year__c, 
                   PUCC__c,
                   Name, 
                   Contact__r.Name
            FROM Vehicle__c
            WHERE Name = :vehReg];
        return vehList;
    }
}