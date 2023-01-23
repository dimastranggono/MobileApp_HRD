import 'package:fb_fetchapi_postget_getx/view/BerandaScreen.dart';
import 'package:fb_fetchapi_postget_getx/viewmodel/stategetx_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  stateLogin xLogin = Get.put(stateLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<stateLogin>(
      builder: (stateX) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/bgSplash.jpg', fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(12, 18, 12, 20),
                  width: 340,
                  height: 620,
                  decoration: BoxDecoration(
                      color: Color(0xffFEFCF3).withOpacity(0.95),
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    children: [
                      Text(
                        'Alfahuma Present Form',
                        style: GoogleFonts.poppins(fontSize: 26),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/office.png',
                            width: 42,
                          ),
                          Text(
                            'Alfahuma',
                            style: GoogleFonts.inter(fontSize: 18),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Column(
                          children: [
                            TextField(
                              onChanged: (value) {
                                xLogin.inputUsernameLogin(value);
                              },
                              decoration: InputDecoration(
                                  prefix: Icon(Icons.person),
                                  hintText: 'email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 21)),
                            TextField(
                              obscureText: stateX.iconPassword,
                              onChanged: (value) {
                                xLogin.inputPasswordLogin(value);
                              },
                              decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        stateX.changePasswordSeen();
                                      },
                                      child:
                                          Icon(Icons.remove_red_eye_rounded)),
                                  prefixIcon: Icon(Icons.lock_rounded),
                                  hintText: 'password',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12))),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          var rsll = await stateX.LoginUser(
                              emil: xLogin.email, pasword: xLogin.password);
                              print(rsll);
                          if (rsll.statusCode == 200) {
                            Get.to(BerandaScreen());
                          }
                          // Get.to(()=>BerandaScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            minimumSize: Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.inter(fontSize: 32),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: RichText(
                            text: TextSpan(
                                text: 'Belum Punya Akun?',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                children: [
                              TextSpan(
                                  text: 'Ayo Daftar disini',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.blue))
                            ])),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        );
      },
    ));
  }
}

//eve.holt@reqres.in
//cityslicka
