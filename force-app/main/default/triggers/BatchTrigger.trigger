trigger BatchTrigger on Account (before insert) {
List<Account> dataInAccount =  new List<Account>([select ID , Name,AccountNumber,ShippingAddress from Account]);
 system.debug(dataInAccount);
}