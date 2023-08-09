import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:everything_in_one/model/personal_state.dart';

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
  _PersonalInformationWidgetState() {
    selectedGender = genderSelectList[0];
  }

  final genderSelectList = ["Male", "Female"];
  String? selectedGender = "";

  final controllerFirstName = TextEditingController();
  final controllerlastName = TextEditingController();
  final controllerPhoneNumber = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerMail = TextEditingController();
  final controllerDate = TextEditingController();

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2025));

    if (pickedDate != null) {
      controllerDate.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  void _profileUpdate() {
    setState(() {
      widget.state.firstName = controllerFirstName.text;
      widget.state.lastName = controllerlastName.text;
      widget.state.phoneNumber = controllerPhoneNumber.text;
      widget.state.mail = controllerMail.text;
      widget.state.gender = controllerGender.text;
      widget.state.date = controllerDate.text;
      widget.onPressed!();
    });
  }

  @override
  Widget build(BuildContext context) {
    controllerFirstName.text = widget.state.firstName;
    controllerlastName.text = widget.state.lastName;
    controllerPhoneNumber.text = widget.state.phoneNumber;
    controllerMail.text = widget.state.mail;
    controllerDate.text = widget.state.date;

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
                    "${widget.state.firstName} ${widget.state.lastName}",
                  ),
                ),
                Text(widget.state.mail),
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
                    setState(() {
                      selectedGender = value;
                    });
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
