import 'package:fb_fetchapi_postget_getx/view/AbsensiPage.dart';
import 'package:fb_fetchapi_postget_getx/viewmodel/stategetx_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BerandaScreen extends StatefulWidget {
  // const BerandaScreen({Key? key}) : super(key: key);

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(14,55, 14, 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat datang',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight:FontWeight.w600,
                    color: Colors.black
                  ),
                ),
                Text('Alfahuma presensi kerja harian',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight:FontWeight.w400,
                    color: Colors.black
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(14, 0, 14, 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Absensi());
                  },
                  child: BuildContainerContent('assets/office.png','absensi Kepegawaian')
                  ),
                 InkWell(
                  onTap: () {
                    
                  },
                  child: BuildContainerContent('assets/manager.png','Agenda Harian')
                  ),
                  BuildContainerContent('assets/topic.png','Izin Karyawan'),
              ],
            ),
          ),
          Container(
            width: 360,
            height: 140,
            decoration: BoxDecoration(
              color: Color(0xffFFDE00),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.5,
                  offset: Offset(1,5),
                  color: Colors.black.withOpacity(0.3)
                )
              ]
            ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container BuildContainerContent(String gambar, String judul) {
    return Container(
                margin: EdgeInsets.symmetric(horizontal: 2),
                padding: EdgeInsets.fromLTRB(5, 15, 5,10),
                width: 114,
                height: 190,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.2,
                      spreadRadius: 2,
                      offset: Offset(0,5),
                      color: Colors.black.withOpacity(0.2)
                    )
                  ],
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.lightBlue
                ),
                child: Column(
                  children: [
                    Image.asset(gambar,scale:5,),
                    Text(judul,
                    textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize : 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              );
  }
}