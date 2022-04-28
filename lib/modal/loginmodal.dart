

class LoginModal{
  int? id;
  String? name;
  String? email;
  String? password;
  LoginModal({this.id,this.name,this.email,this.password});

  loginmap(){
    var mapping=Map<String, dynamic>();
    mapping['id']=id;
    mapping['name']=name;
    mapping['email']=email;
    mapping['password']=password;
    return mapping;

  }

   factory LoginModal.fromJson(json){
    return LoginModal(
id:json['id'],
name: json['name'],
email: json['email'],
password: json['password'],

    );
  }
}