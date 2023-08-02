import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/personal_state.dart';

class PersonalInformationWidget extends StatefulWidget {
  final PersonalState state;
  final VoidCallback? onPressed;
  const PersonalInformationWidget({
    super.key,
    required this.state,
    required this.onPressed,
  });

  @override
  State<PersonalInformationWidget> createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  final genderSelectList = ["Male", "Female"];
  String? selectedVal = "Male";

  final controllerFirstName = TextEditingController();
  final controllerlastName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerGender = TextEditingController();

  firstNameChange(String text) {
    widget.state.firstName = controllerFirstName.text;
    setState(() {});
  }

  lastNameChange(String text) {
    widget.state.lastName = controllerlastName.text;
    setState(() {});
  }

  phoneNumberChange(String text) {
    widget.state.phoneNumber = controllerPhoneNumber.text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    controllerFirstName.text = widget.state.firstName;
    controllerlastName.text = widget.state.lastName;
    controllerPhoneNumber.text = widget.state.phoneNumber;

    return Scaffold(
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${widget.state.firstName} ${widget.state.lastName}",
                  ),
                ),
                const Text("yurakutenko@gmail.com"),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controllerFirstName,
                  onSubmitted: firstNameChange,
                  onEditingComplete: widget.onPressed,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: controllerlastName,
                  onSubmitted: lastNameChange,
                  onEditingComplete: widget.onPressed,
                  decoration: const InputDecoration(
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
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: controllerPhoneNumber,
                  onSubmitted: phoneNumberChange,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
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
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    labelText: "Select your gender",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                  value: selectedVal,
                  items: genderSelectList
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      // widget.state.gender = value as String;
                      selectedVal = value;
                    });
                  },
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
