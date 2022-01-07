
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String url ="https://www.psdgraphics.com/wp-content/uploads/2010/04/web-user.jpg";

  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      child: ListView(
        shrinkWrap: true,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigoAccent),
            padding: EdgeInsets.zero,
             child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                accountName:  const Text(
                  "username",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ), 
                accountEmail: const Text(
                  "emailid@mail.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15, 
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(url),
                )
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
              ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
              ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.settings,
              color: Colors.white,
              ),
            title: Text(
              "Settings",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.person,
              color: Colors.white,
              ),
            title: Text(
              "About Us",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.phone_circle,
              color: Colors.white,
              ),
            title: Text(
              "Contact Us",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.white,
              ),
            title: Text(
              "Chat with us",
              textScaleFactor: 1.2,
              style: TextStyle(
                    color: Colors.white, 
              ),
            ),
          ),          
        ],
      ),
    );
  }
}