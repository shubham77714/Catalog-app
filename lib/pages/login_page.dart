import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton=true;
      });
                    
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homePage);
    
      setState(() {
        changeButton=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/hey.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
               Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        else if(!value.contains('@') || !value.contains('.com')){
                          return "invalid username";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name=value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if(value.length<8){
                          return "Minimum Password length is 8";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                        BorderRadius.circular(changeButton ? 50 : 20),        
                      child: InkWell(
                        onTap: ()=>moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height:40, 
                          width:changeButton ? 80 : 150,
                          alignment: Alignment.center,
                          child:changeButton? 
                            const Icon(
                              Icons.done_all,
                              color: Colors.green,
                            ): 
                            const  Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}