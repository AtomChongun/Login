import 'package:flutter/material.dart';
import 'package:loginapp/logincpmplate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: LoginApp(),
    );
  }
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

bool isChecked = false;

class _LoginAppState extends State<LoginApp> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      print("ji");
      return Colors.blue;
    }
    return Colors.black;
  }

  String username = "";
  String password = "";
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.purple,
            radius: 50,
          ),
          const Text(
            "My LoginApp",
            style: TextStyle(fontSize: 36),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.purple,
                  ),
                  labelText: "Username"),
              autofocus: true,
              validator: (str) {
                if (str!.isEmpty) {
                  return "กรุณาป้อนชื่อผู้ใช้";
                }
                return null;
              },
              controller: usernameController,
            ),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.all(8),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: const Icon(
                    Icons.key,
                    color: Colors.purple,
                  ),
                  labelText: "Password"),
              autofocus: true,
              validator: (str) {
                if (str!.isEmpty) {
                  return "กรุณาป้อนรหัสผ่าน";
                }
                return null;
              },
              controller: passwordController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                          print(isChecked);
                        });
                      }),
                  const Text("Remeber me")
                ],
              ),
              TextButton(
                  onPressed: () {
                    print("Change Password");
                  },
                  child: const Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          ),
          Container(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print("Sign in");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Logincomplete();
                    }));
                  }
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't I have ancount?"),
              TextButton(
                  onPressed: () {
                    print("Create");
                  },
                  child: Text(
                    "Create account",
                    style: TextStyle(color: Colors.purple),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
