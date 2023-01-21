import 'package:flutter/material.dart';
import '../../services/users_services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_application_1/widgets/custom_TextField.dart';
import 'package:flutter_application_1/widgets/custom_passwordTextField.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AddAdmin extends StatefulWidget {
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {

  
   final NameController=TextEditingController() ;
   final EmailController=TextEditingController() ;
   final TypeController =TextEditingController() ;
   final TextEditingController passwordController = TextEditingController();


    final GlobalKey<FormState> _globalKey = GlobalKey<FormState>(); 

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      
                      Container(
                          child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 400,
                            height: 400,
                          ),
                          Positioned(
                              height: 85,
                              child: Text(
                                'Add Admin',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey),
                              ))
                        ],
                      )),
                    ],
                  ),
                ),
                ],
          ),
          Positioned(
                  top: 240,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(255, 252, 250, 250),
                    ),
                    width: 330,
                    height: 450,
                    margin: EdgeInsets.only(bottom: 30),
                    child: Form(
                      key: _globalKey,
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          
                          CustomTextField(
                            controller:NameController,
                            // lable: 'Trip Name',
                            hint: 'Name',
                            icon: Icons.person_add, 
                            ot: false ,
                            
                          ),
                          
                    
                          SizedBox(
                            height: 5,
                          ),
                          
                          CustomTextField(
                            ot: false ,

                            controller:EmailController,
                            hint: 'Email : username@mail.com',
                            icon: Icons.email  ,
                            
                          ),
                          SizedBox(
                            height: 5,
                          ),
                           CustomTextField(
                              ot: true ,

                            controller:passwordController,
                            hint: 'Password',
                            icon: Icons.password  ,
                            
                          ),
                           FlutterPwValidator(
                              controller: passwordController,
                              minLength: 6,
                              numericCharCount: 3,
                              width: 300,
                              height: 50,
                              onSuccess: () {
                                // print("MATCHED");
                                // ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                //     content: new Text("Password is matched")));
                              },
                              onFail: () {
                                // print("NOT MATCHED");
                              },
                          ),
                          
                          SizedBox(
                            height: 5,
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                   
                                    context.go('/AdminHome');
                                  },
                                  child: Text('Back')),

                              TextButton(
                                onPressed: (){
                                   if (_globalKey.currentState!.validate()) {
                                         

                                         final String newName=NameController.text;
                                         final String newEmail=EmailController.text;
                                         final String newPassword=passwordController.text;
                                         final String newType=TypeController.text;

                                         User_Service().creatUser(
                                              name: newName,
                                              password: newPassword,
                                              email: newEmail,
                                              type: "admin",
                                              
                                              // 
                                              );
                                     _globalKey.currentState!.reset();


                                    }
                                },
                                child: Text('Add') 
                                       
                              ),
                            ]
                          )
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}