import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconAnimation;
  late AnimationController _iconAnimationController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );

    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackBar = SnackBar(
      content: Text("Email: $_email, password: $_password"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black87,
          ),
          Theme(
            data: ThemeData(
                brightness: Brightness.dark,
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle:
                      TextStyle(color: Colors.tealAccent, fontSize: 25.0),
                )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: _iconAnimation.value * 140.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Enter Email",
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) =>
                                  !val!.contains('@') ? 'Invalid Email' : null,
                              onSaved: (val) => _email = val!,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Enter Password",
                              ),
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              validator: (val) =>
                                  val!.length < 6 ? 'Password too short' : null,
                              onSaved: (val) => _password = val!,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 60.0),
                            ),
                            MaterialButton(
                              height: 50.0,
                              minWidth: 150.0,
                              color: Colors.green,
                              splashColor: Colors.teal,
                              textColor: Colors.white,
                              child:
                                  const Icon(FontAwesomeIcons.rightToBracket),
                              onPressed: _submit,
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
