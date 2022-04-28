

import 'package:flutter/material.dart';
import 'package:login/login/signup.dart';
import 'package:login/service/loginservice.dart';

import '../pages/homescreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
   bool _validateLogin=false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            
            Container(
              // height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Text(
                    //   'LOG IN',
                    //   style: TextStyle(
                    //       color: Colors.blue,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.w500),
                    // ),
                    Icon(Icons.account_circle,size: 130,color: Colors.blue,)
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                 Text('Welcome Back',
               style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),),
               Text('Sign to Continue',style: TextStyle(color: Colors.grey),)
              ],
            ),
            Container(
              margin: const EdgeInsets.all(40),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailcontroller,
                        
                        validator: (value){
                          
                          if(value==null || value.isEmpty){
                            return 'Email is required';
                          }
                          return null;

                        },
                        decoration:  InputDecoration(
                          errorText:_validateLogin ?' Invalid Email':null ,
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          icon: const Icon(Icons.person),
                        )),
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
                        decoration:  InputDecoration(
                          errorText:_validateLogin ?' Invalid Password':null ,
                            hintText: 'Enter Password',
                            labelText: 'Password',
                            icon: const Icon(Icons.paste_outlined))),
                             const SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        //TODO FORGOT PASSWORD SCREEN GOES HERE
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                     const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: FlatButton(
                        onPressed: () async {
                          if(_formkey.currentState!.validate())
                          {
                            var value=await LoginService().checkLogin(emailcontroller.text, passcontroller.text);
                            if(value.length >0)
                            {
                              var data=value;
                                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>  HomeScreen(data: data,)));
                            }
                            else{
                            setState(() {
                              _validateLogin=true;
                            });
                              
                            }
                          }
                          
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                   
                  ],
                ),
              ),
            ),
             Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text("Don't have account?"),
                       TextButton(onPressed: (){
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUp()));
                       },
                        child: const Text('Create a new account',
                        style: TextStyle(color: Colors.blue),))
                     ],
                         
                    )
          ],
        ),
      )),
    );
  }
}
