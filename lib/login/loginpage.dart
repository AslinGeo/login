

import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 203, 203),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
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
                            return 'UserName is required';
                          }
                          return null;

                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Name',
                          icon: Icon(Icons.person),
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
                        decoration: const InputDecoration(
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
                        onPressed: () {
                          if(_formkey.currentState!.validate())
                          {
                            
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const HomeScreen()));
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text('New User?'),
                       TextButton(onPressed: (){},
                        child: const Text('Create Account',
                        style: TextStyle(color: Colors.blue),))
                     ],
                         
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
