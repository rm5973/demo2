import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'homescreen.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 178, 178),
        title: Text('Profile'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? Icons.sunny : Icons.dark_mode))
        ],
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
              curve: Curves.easeInOut,
              backgroundColor: Colors.black,
              color: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              activeColor: Colors.white,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  active: false,
                  activeBorder: Border(),
                  onPressed: () => {
                    Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => const profile()))
                  },
                  icon: (Icons.settings),
                  text: 'settings',
                ),
                GButton(
                    onPressed: () => {},
                    icon: (Icons.favorite_border),
                    text: 'like'),
                GButton(
                    onPressed: () => {}, icon: (Icons.search), text: "search"),
                GButton(
                    active: true,
                    onPressed: () => {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const NewWidget()))
                        },
                    icon: (Icons.home),
                    text: 'home'),
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("images/p1rofile.png")),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(" Dexter morgen", style: TextStyle(fontSize: 20.0)),
              Text("masurnaikrakshit@gmail.com"),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 217, 0),
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "settings",
                icon: Icons.settings,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                title: "Billing Details",
                icon: Icons.wallet,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                title: "User Management",
                icon: Icons.verified_user,
                onPressed: () {},
              ),
              const Divider(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                title: "Information",
                icon: Icons.info,
                onPressed: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.login,
                onPressed: () {},
                textColor: Colors.red,
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPressed,
      this.endIcon = true,
      this.textColor})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.purpleAccent.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.blueAccent,
        ),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyText1?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.chevron_right,
                color: Colors.grey,
                size: 18.0,
              ),
            )
          : null,
    );
  }
}
