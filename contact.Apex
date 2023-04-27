//•Create a number of contacts field on the account and develop a trigger that updates this field on the account every time a new contact is created
Public static void numberOfContact(List<Contact> contList){
  List<Account> accList = [SELECT Id, Number_Of_Contact__c,(SELECT id FROM Contacts) FROM Account WHERE id IN(SELECT AccountId FROM  Contact) ];                    
           for(Account ac:accList){ 
               ac.Number_Of_Contact__c= ac.contacts.size(); 
           }  
           update accList;
}
 //2.Way:
     /*Set<Id> accountsId = new set<Id>();
     for(Contact cn:contList){
      if(cn.AccountId !=null){
       accountsId.add(cn.AccountId);      
        } }    
   List<Account> acctList = [SELECT Id, Number_Of_Contact__c,(SELECT id FROM Contacts) FROM Account WHERE id IN:accountsId ];    
     if(accountsId.size()>0){
      for(Account acn:acctList){
        acn.Number_Of_Contact__c = acn.contacts.size();    
         } 
       update acctList;      
     } */ 