import 'package:flutter/material.dart';
import 'package:form/shared_component/custom_textFormField.dart';
import 'package:form/shared_component/text_in_app.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 98, 42, 1.0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textInApp(text: "Pizza Restaurant ",color: Colors.amberAccent,fontWeight: FontWeight.bold,fontSize: 40),
              const SizedBox(height: 20,),
              textInApp(text: "Create Account ",fontSize: 30,color: Colors.amber.shade200),
              const SizedBox(height: 7,),
              textInApp(text: "Lets get stared and create your account",color: Colors.amber.shade100),
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                     BoxShadow(
                        color: Colors.white60,
                        spreadRadius: 2,
                       offset: Offset(0,3)
                     ),
                  ]
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultTextFormField(
                        controller:nameController ,
                        keyboardType: TextInputType.emailAddress,
                        validatorText: "Email",
                        label: "Email",
                      ),
                      DefaultTextFormField(
                        controller:userNameController ,
                        validatorText: "Username",
                        label: "Username",
                      ),
                      DefaultTextFormField(
                        controller:passwordController ,
                        validatorText: "Password",
                        label: "Password",
                        obscureText: true,
                      ),
                      DefaultTextFormField(
                        controller:confirmPasswordController ,
                        validatorText: "confirm Password",
                        label: "confirm Password",
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                                onPressed: (){
                                  setState(() {
                                    autoValidate = true;
                                  });
                                  if(formKey.currentState!.validate())
                                    {
                                      nameController.clear();
                                      userNameController.clear();
                                      passwordController.clear();
                                      confirmPasswordController.clear();
                                      setState(() {
                                        autoValidate = false;
                                      });
                                      print("Navigate to Home Page");
                  
                                    }
                                },
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
                                ),
                                child: textInApp(
                                    text: "Sign Up",
                                   color: Colors.blue.shade900,
                                  fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                  
                  
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
     nameController.dispose();
     userNameController.dispose();
     passwordController.dispose();
     confirmPasswordController.dispose();
    super.dispose();
  }
}
