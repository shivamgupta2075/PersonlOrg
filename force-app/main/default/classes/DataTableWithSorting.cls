public with sharing class DataTableWithSorting {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts =
                [SELECT Id, Name, Account.Name, Phone, Email FROM Contact ];
        //Add isAccessible() check
        return contacts;
    }

}