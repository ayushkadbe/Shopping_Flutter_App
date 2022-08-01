import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://media-exp1.licdn.com/dms/image/C5603AQGzUsChUqKtKw/profile-displayphoto-shrink_200_200/0/1620734238429?e=2147483647&v=beta&t=btD5202lcTiTmiZBl4hTPf-cC0tMocIsMAMcjjAwtiI";
    return Drawer(
      
      child: Container(
        color: Colors.blue,

        child: ListView(
          padding: EdgeInsets.zero,        
           
          children: const [
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                accountName: Text("Ayush"),
                accountEmail: Text("email@gmail.com"),
              ),
            ),

            //ListTile: for adding in left icon and right text with ontap() feature
            ListTile(
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

             ListTile(
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

             ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Contact us",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
                      
            
          ],
        ),

      ),

     
    );

  }
}