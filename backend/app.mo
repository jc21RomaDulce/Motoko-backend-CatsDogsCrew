import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";
import Hash "mo:base/Hash";


actor {
 
 type Organization = {
    name: Text;
    address: Text;
    phone: Text;
    country: Text;

  };

  stable var organId: Nat = 0;
  
let organization = HashMap.HashMap<Text, Organization>(0, Text.equal, Text.hash);

 
  private func generateorgaId(): Text {
    organId += 1;
    return Nat.toText(organId);
  };

  public func createorga(orga:Organization) {
   
//let orga: Organization = { name; address; phone; country };
    let key = generateorgaId ();

    organization.put(key, orga);
    Debug.print("Organization successfully created with ID: " # key);
  };
type Companies_friendly = {
    name: Text;
    address: Text;
    phone: Text;
    country: Text;
  };
stable var companiesId: Nat = 0;

let companies = HashMap.HashMap<Text, Companies_friendly>(0, Text.equal, Text.hash);

private func generatecompaniesId(): Text {
    companiesId += 1;
    return Nat.toText(companiesId);
  };

public func createcompaniesfriendly(comp: Companies_friendly) {
   
//let comp: Companies_friendly={ name; address; phone; country };
    let key1 = generatecompaniesId();

    companies.put(key1, comp);
    Debug.print("Company Friendly  successfully created with ID: " # key1);
 };

// Representing a pet lover
  type Customer = {
    customer_id : Nat;
    name : Text;
    email : Text;
    contribution: Text
  };
stable var customerId: Nat = 0;
  let customers = HashMap.HashMap<Text, Customer>(0, Text.equal, Text.hash);

private func generatecustomerId(): Text {
    customerId += 1;
    return Nat.toText(customerId);
  };
  // Function to create a customer map
  public func createCustomer(customer : Customer) : async () {
      let keyc = generatecustomerId();
	    customers.put(keyc, customer);
      Debug.print("Pet lover  successfully created with ID: " # keyc);


  };
  public query func getCustomer(key: Text): async ?Customer {
    customers.get(key);
  };

  public query func getCustomer1(): async [(Text, Customer)]{
    let cusIter: Iter.Iter<(Text, Customer)> = customers.entries();
    Iter.toArray(cusIter)
  };

}