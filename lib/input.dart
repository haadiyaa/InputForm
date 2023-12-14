import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool _pass = true;
  final _key = GlobalKey<FormState>();
  final myController=TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Fill the form below',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color:  Color.fromARGB(255, 55, 0, 150),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                autofocus: true,
                controller: myController,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if(myController.text.isEmpty){
                    return 'Name can\'t be empty';
                  }
                  else if(myController.text.length<3){
                    return 'Name should be atleast 3 characters';
                  }
                },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Name can\'t be empty';
                //   } else if (value.length < 3) {
                //     return 'Name should be atleast 3 characters';
                //   }
                // },
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
                  } else if (!(value.contains('@'))) {
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
                  } else if (value.length < 10 || value.length > 10) {
                    return 'Number should be exactly 10 digits';
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
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  print('output: $value');
                },
                obscureText: _pass,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'pleas enter the password';
                  } else if (value.length < 8) {
                    return 'Password must be greater then 8 characters';
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
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print('output: $value');
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Age can\'t be empty';
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Submitted')),
                    );
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
