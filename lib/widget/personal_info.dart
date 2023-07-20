import 'package:everything_in_one/pages/third_page.dart';
import 'package:flutter/material.dart';

class PersonalInformationWidget extends StatelessWidget {
  const PersonalInformationWidget({super.key});

  void navigateToThirdPage(BuildContext context) {
    final navigator = Navigator.of(context);
    navigator.pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => const ThirdPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          // onPressed: () => navigateToThirdPage(context),
          onPressed: Navigator.of(context).pop,
        ),
        title: const Text(
          "Bio-data",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 80,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Yurii Kutenko"),
                ),
                const Text("yurakutenko@gmail.com"),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(
                    // Высота Labela
                    // isCollapsed: true,
                    // contentPadding: EdgeInsets.all(15),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "What's your first name?",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "And your last name?",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.phone),
                    hintText: "Phone number",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.expand_more),
                    hintText: "Select your gender",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.event_note),
                    hintText: "What is your date of birth?",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 16, 101, 170)),
                    minimumSize: MaterialStateProperty.all(const Size(280, 70)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: null,
                  child: const Text("Update Profile?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
