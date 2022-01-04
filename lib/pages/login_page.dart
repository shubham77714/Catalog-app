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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_img.png",
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async{
                      setState(() {
                        changeButton=true;
                      });

                      await Future.delayed(const Duration(milliseconds: 800));
                      Navigator.pushNamed(context, MyRoutes.homePage);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 800),
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
                      decoration: BoxDecoration(
                        color: changeButton ? Colors.white : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton ? 50 : 20),
                        boxShadow: [
                          BoxShadow(
                            color: changeButton ? Colors.white : Colors.deepPurpleAccent,
                            blurRadius: 10,
                            offset: const Offset(4, 7),
                            )]
                      ),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: (){
                  //     Navigator.pushNamed(context, MyRoutes.homePage);
                  //   },
                  //   child: const Text("Login"),
                  //   style: TextButton.styleFrom(
                  //     backgroundColor: Colors.deepPurple,
                  //     minimumSize: const Size(150, 40),
                  //     elevation: 17,
                  //     shadowColor: Colors.indigoAccent,                      
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}