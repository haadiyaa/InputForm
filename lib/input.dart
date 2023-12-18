import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inputfield/home.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final reg = RegExp(r"^[a-zA-Z0-9_\-\.\S]{4,}[@][a-z]+[\.][a-z]{2,3}$");
  final reg2 = RegExp(r"^[6789]\d{9}$");
  final paswd =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  final name = RegExp(r'^[A-Za-z]+$');
  final age = RegExp(r"^[0-9]{1,2}$");
  bool _pass = true;
  bool _pass2 = true;
  final _key = GlobalKey<FormState>();
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Text(
                    'Please fill the form below',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black
                        // height: 1,
                        ),
                  ),
                  Text(
                    'Please fill the form below',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 7, 255, 214)
                          .withOpacity(0.6),
                      fontStyle: FontStyle.italic,
                      // height: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //textfields

              TextFormField(
                controller: myController,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (myController.text.isEmpty) {
                    return 'Name can\'t be empty';
                  } else if (myController.text.length < 3) {
                    return 'Name should be atleast 3 characters';
                  } else if (!name.hasMatch(myController.text)) {
                    return "Enter a valid name";
                  }
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: Text('Enter your first name '),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name can\'t be empty';
                  } else if (!name.hasMatch(value)) {
                    return "Enter a valid name";
                  }
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: Text('Enter your last name '),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'E-Mail can\'t be empty';
                  } else if (!reg.hasMatch(value)) {
                    return 'enter a valid email';
                  }
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: Text('Enter your email '),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Number can\'t be empty';
                  } else if (value.length > 10) {
                    return "number exact 10";
                  } else if (!reg2.hasMatch(value)) {
                    return 'Enter a valid phone number';
                  }
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: Text('Enter your phone number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: myController2,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  print('output: $value');
                },
                obscureText: _pass,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'pleas enter the password';
                  } else if (!paswd.hasMatch(value)) {
                    return 'Password should contain at least one upper case, \none lower case, one digit, one special character and \nmust be 8 characters in length';
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _pass = !_pass;
                          },
                        );
                      },
                      icon: Icon(
                        _pass ? Icons.visibility_off : Icons.visibility,
                        size: 23,
                      )),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: const Text('Enter Password'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: myController3,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  print('output: $value');
                },
                obscureText: _pass2,
                validator: (value) {
                  if (value != myController3.text) {
                    return 'Password does\'nt match';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _pass2 = !_pass2;
                          },
                        );
                      },
                      icon: Icon(
                        _pass2 ? Icons.visibility_off : Icons.visibility,
                        size: 23,
                      )),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: const Text('Re-enter the Password'),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // keyboardType: TextInputType.number,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age can\'t be empty';
                  } else if (value.length > 2) {
                    return "Enter valid age";
                  } else if (!age.hasMatch(value)) {
                    return 'Invalid age!';
                  } else if (int.parse(value) < 18) {
                    return 'Age must be greater than 18';
                  }
                },
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.5,
                    ),
                  ),
                  label: Text('Enter your age'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 171, 203, 206)),
                ),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Submission Successful',
                            style: TextStyle(fontSize: 20),
                          ),
                          content: const Text('Do you want to login?'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    )),
                                child: const Text("OK")),
                          ],
                        );
                      },
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Submitted')),
                    // );
                    //..........Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                  }
                },
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
