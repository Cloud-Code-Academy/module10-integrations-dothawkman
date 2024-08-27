public with sharing class ContactTriggerHandler extends TriggerHandler{

    public List<Contact> updatedContactList;
    
    public ContactTriggerHandler() {
        this.updatedContactList = (List<Contact>) Trigger.new;
    }

    public override void beforeInsert(){
        for (Contact c : updatedContactList) {
            if (c.DummyJSON_Id__c == null) {
                c.DummyJSON_Id__c = String.valueOf(Math.roundToLong(Math.random()*100));
            }

            if (integer.valueOf(c.DummyJSON_Id__c) <= 100) {
                callGetDummyJSONUserFromId(c.DummyJSON_Id__c); 
            }
        }

    }

    @future (callout = true)
        private static void callGetDummyJSONUserFromId(String contactId){
            DummyJSONCallout.getDummyJSONUserFromId(contactId);
        }

        public override void beforeUpdate(){
             //When a contact is updated
            for (contact c : updatedContactList) {
                // if DummyJSON_Id__c is greater than 100, call the postCreateDummyJSONUser API
                if (Integer.valueOf(c.DummyJSON_Id__c) > 100) {
                    DummyJSONCallout.postCreateDummyJSONUser(c.Id);
                }
            }
        }
    }




















