import 'package:everything_in_one/model/personal_state.dart';
import 'package:everything_in_one/pages/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PersonalInformationWidget extends StatefulWidget {
  final VoidCallback onPressed;

  const PersonalInformationWidget({
    super.key,
    required this.onPressed,
  });

  @override
  State<PersonalInformationWidget> createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  var selectedGender = globalPersonalState.gender;

  final controllerFirstName = TextEditingController();
  final controllerlastName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerDate = TextEditingController();

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2020));

    if (pickedDate != null) {
      controllerDate.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  void _profileUpdate() {
    // TODO: read about cascade operators
    globalPersonalState
      ..firstName = controllerFirstName.text
      ..lastName = controllerlastName.text
      ..phoneNumber = controllerPhoneNumber.text
      ..mail = controllerMail.text
      ..gender = selectedGender
      ..date = controllerDate.text;
    widget.onPressed();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    controllerFirstName.text = globalPersonalState.firstName;
    controllerlastName.text = globalPersonalState.lastName;
    controllerPhoneNumber.text = globalPersonalState.phoneNumber;
    controllerMail.text = globalPersonalState.mail;
    controllerDate.text = globalPersonalState.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
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
                    "${globalPersonalState.firstName} ${globalPersonalState.lastName}",
                  ),
                ),
                Text(globalPersonalState.mail),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controllerFirstName,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "What's your first name?",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: controllerlastName,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "And your last name?",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: controllerPhoneNumber,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone number",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: controllerMail,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Your mail",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
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
                  value: selectedGender,
                  items: genderSelectList
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedGender = value;
                      });
                    }
                  },
                ),
                TextField(
                  controller: controllerDate,
                  decoration: const InputDecoration(
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
                  onTap: _showDatePicker,
                ),
                const SizedBox(
                  height: 25,
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
                  onPressed: _profileUpdate,
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
