import 'package:login/modal/loginmodal.dart';

import '../database/repo.dart';

class LoginService{
  late Repo _repo;
  LoginService(){
    _repo=Repo();
  }

  saveData(LoginModal login) async{
  //  print(todo);
   return await _repo.insertData('users', login.loginmap());

 }
 checkLogin(email,password) async{
  return await _repo.checkLogin(email, password);
 }
}