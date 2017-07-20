public class vf_paginationfw_controller extends SObjectPaginator{
    
    //List to store all the contacts according to requirement
    private List<Contact> AllContacts = new List<Contact>();

    // pagination list
    public List<Contact> listToshow {set; get;}
    
    public vf_paginationfw_controller() {
	// setting the limit size by calling super class constructor
        super(20);
        // get the data using SOQL
	// setRecords([select id , name, LeadSource from contact]);
        AllContacts = [select id , name, LeadSource from contact];
        
        // set the records which has to be paginated in super class
        setRecords(AllContacts);
        // call the run method to begin pagination
        run();
	if(listToshow == null) {
		listToshow = new List<Contact>();
	}

        // cast and copy the super class pagination list
        for(SObject c: getLimitRecords()) {
            listToshow.add((contact) c);
        }

    }
    
    public void nextList() {
        // call the super class next method
        next();
        // clear the pagination list
        listToshow.clear();
        // cast and copy the super class pagination list
        for(SObject c: getLimitRecords()) {
            listToshow.add((contact) c);
        }
    }
    public void prevList() {
        // call the super class previous method
        previous();
        // clear the pagination list
        listToshow.clear();
        // cast and copy the super class pagination list
        for(SObject c: getLimitRecords()) {
            listToshow.add((contact) c);
        }
    }
    public void begingList() {
        // call the super class beginning method
        beginning();
        // clear the pagination list
        listToshow.clear();
        // cast and copy the super class pagination list
        for(SObject c: getLimitRecords()) {
            listToshow.add((contact) c);
        }
    }
    public void lastList() {
        // call the super class last method
        last();
        // clear the pagination list
        listToshow.clear();
        // cast and copy the super class pagination list
        for(SObject c: getLimitRecords()) {
            listToshow.add((contact) c);
        }
    }
}