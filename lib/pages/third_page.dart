import 'package:flutter/material.dart';

import '../widget/personal_info.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ProfileWidget(),
                AccountWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "More",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AboutAndSupportWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  void navigateToPersonalInfo() {
    final navigator = Navigator.of(context);
    navigator.push(
      MaterialPageRoute(
        builder: (BuildContext context) => const PersonalInformationWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 15,
      color: const Color.fromARGB(255, 15, 100, 170),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text("Yurii Kutenko"),
        ),
        subtitle: const Text("yurakutenko@gmail.com"),
        iconColor: Colors.white,
        textColor: Colors.white,
        leading: const Icon(
          Icons.account_circle_rounded,
          size: 60,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.create,
            size: 25,
            color: Colors.white,
          ),
          onPressed: navigateToPersonalInfo,
        ),
      ),
    );
  }
}

class AccountWidget extends StatefulWidget {
  const AccountWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  bool _isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("My Account"),
            ),
            subtitle: Text("Make changes to your account"),
            leading: Icon(
              Icons.account_circle_rounded,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Saved Benefeciary"),
            ),
            subtitle: Text("Manage your saved account"),
            leading: Icon(
              Icons.account_circle_rounded,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.all(10),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Face ID / Touch ID"),
            ),
            subtitle: const Text("Manage your device security"),
            secondary: const Icon(
              Icons.lock_outline,
              size: 50,
            ),
            value: _isActive,
            onChanged: (value) {
              setState(() {
                _isActive = value;
              });
            },
          ),
          const ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Two-Factor Authentification"),
            ),
            subtitle: Text("Further secure your account for safety"),
            leading: Icon(
              Icons.verified_user_outlined,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Log out"),
            ),
            subtitle: Text("Further secure your account for safety"),
            leading: Icon(
              Icons.logout_outlined,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutAndSupportWidget extends StatelessWidget {
  const AboutAndSupportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: const [
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Help & Support"),
            ),
            leading: Icon(
              Icons.notifications_none_outlined,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(10),
            title: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("About App"),
            ),
            leading: Icon(
              Icons.favorite_border_outlined,
              size: 50,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Colors.grey,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}
