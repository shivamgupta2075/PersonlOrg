public class TestingApex {
    
    public static void Bubblesort()
    {
        Integer [] data=new Integer[]{1,8,15,2,5,14};
            system.debug('data'+data.size());
        integer i;
        for( i=0;i<data.size();i++){
            if(i< data.size()-1){
                if(data[i]>data[i+1]){
                    //Swap
                    integer temp;
                    temp = data[i];
                    data[i] = data[i+1];
                    data[i+1] = temp;
                    system.debug('Data'+data);
                }  
                else{
                    system.debug('Data'+data);
                    //increment i++;
                    i++;  
                }
            }
            
        }
        /*  if(j== 1){
for(integer i =1 ; i<=6; i++){
//   Integer [] temp = new Integer[]{};

}  
}*/
        system.debug('Data'+data);
    }
    
}