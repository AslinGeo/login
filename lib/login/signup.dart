import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login/login/loginpage.dart';
import 'package:login/modal/loginmodal.dart';

import '../service/loginservice.dart';



class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final cfpasscontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                 IconButton(onPressed: (){
                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Login()));
              }, icon: const Icon(Icons.arrow_back,size: 30,)),
              ],
            ),
            const SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const  [
                Text('Create Account',
                style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w900),),
                SizedBox(height: 5,),
                Text('create a new account')
              ],
            ),
             Container(
                  margin: const EdgeInsets.all(40),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                         TextFormField(
                            controller: namecontroller,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return 'Name is required';
                              }
                              return null;
      
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Name',
                              labelText: 'Name',
                              icon: Icon(Icons.person),
                            )
                            ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                            controller: emailcontroller,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return 'Email is required';
                              }
                              return null;
      
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter Email',
                              labelText: 'Email',
                              icon: Icon(Icons.mail_outline_rounded)
                            )
                            ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller:passcontroller,
                          validator: (value){
                              if(value==null || value.isEmpty){
                                return 'Password is required';
                              }
                              return null;
      
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter Password',
                                labelText: 'Password',
                                icon:  Icon(Icons.paste_outlined))),
                                 const SizedBox(
                          height: 40,
                        ),
                            TextFormField(
                          controller:cfpasscontroller,
                          validator: (value){
                              if(value==null || value.isEmpty){
                                return 'Confirm Password is required';
                              }
                              return null;
      
                            },
                            decoration: const InputDecoration(
                                hintText: 'Enter Confirm Password',
                                labelText: 'Confirm Password',
                                icon:  Icon(Icons.paste_outlined))),
                                 const SizedBox(
                          height: 30,
                        ),
                        
                       
                        Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)),
                          child: FlatButton(
                            onPressed: () async{
                              if(_formkey.currentState!.validate())
                              {
                                if(passcontroller.text==cfpasscontroller.text){
                                   var loginmodal=LoginModal();
                                loginmodal.name=namecontroller.text;
                                loginmodal.email=emailcontroller.text;
                                loginmodal.password=passcontroller.text;
                                var _service=LoginService();
                                var result=await _service.saveData(loginmodal);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()));
                           
                                }
                               
                              }
                              
                            },
                            child: const Text(
                              'Create Account',
                              style: TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                      
                      ],
                    ),
                  ),
                  
                ),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Text('Already have a account?'),
                           TextButton(onPressed: (){
                             Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const Login()));
                           },
                            child: const Text('Login',
                            style: TextStyle(color: Colors.blue),))
                         ],
                             
                        )
            
          ],
        ),
      ),
    ),      
    );
  }
}