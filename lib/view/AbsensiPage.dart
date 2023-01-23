import 'package:fb_fetchapi_postget_getx/viewmodel/stategetx_absen.dart';
import 'package:fb_fetchapi_postget_getx/viewmodel/stategetx_getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class Absensi extends StatefulWidget {
  const Absensi({Key key}) : super(key: key);

  @override
  State<Absensi> createState() => _AbsensiState();
}

class _AbsensiState extends State<Absensi> {
  getData dataX = Get.put(getData());
  StateAbsen absenX = Get.put(StateAbsen());

  @override
  void initState() {
    dataX.getDataUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 35, 15, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Absensi Alfahuma',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Jangan lupa untuk absen pegawai hari ini',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(12, 15, 12, 10),
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.blue[800], width: 2)),
            child: GetBuilder<StateAbsen>(
              builder: (absensiX) {
                return Column(
                  children: [
                    Text(
                      'Masukkan Nama Anda',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextField(
                      onChanged: (value) {
                        absensiX.InputNamaUser(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Nama Lengkap anda',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    Text(
                      'Masukkan Jabatan anda',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    TextField(
                      onChanged: (value) {
                        absensiX.InputJabatanUser(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Jabatan anda',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                    ),
                    Padding(padding: EdgeInsets.all(14)),
                    ElevatedButton(
                        onPressed: () async {
                          var rslt = await absensiX.postAbsen(
                              name: absensiX.name, job: absensiX.job);
                              print(rslt);
                          if (rslt.statusCode == 201) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      title: Row(
                                        children: [
                                          Text(
                                            'Berhasil Absen',
                                            style: GoogleFonts.poppins(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Image.asset(
                                                'assets/check.png',
                                                scale: 15,
                                              ))
                                        ],
                                      ),
                                      actions: [
                                        Container(
                                          width: 270,
                                          height: 370,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Anda Berhasil Absen',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Tutup',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]);
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                        title: Row(
                                          children: [
                                            Text(
                                              'Gagal Absen',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: Image.asset(
                                                  'assets/cancel.png',
                                                  scale: 15,
                                                ))
                                          ],
                                        ),
                                        actions: [
                                          Container(
                                            width: 270,
                                            height: 370,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Anda Gagal Absen',
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Tutup',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14))),
                        child: Text(
                          'Absen Sekarang!',
                          style: GoogleFonts.poppins(fontSize: 18),
                        ))
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Karyawan Alfahuma',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Karyawan alfahuma',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Container(
                  width: 345,
                  height: 250,
                  child: GetBuilder<getData>(
                    builder: (getX) {
                      if (getX.dataUser == null) {
                        return Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: Colors.blueGrey,
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text('Loading Data'))
                              ],
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: getX.dataUser.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Color(0xff5BC0F8),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2.5,
                                        offset: Offset(2, 5),
                                        color: Colors.black.withOpacity(0.5))
                                  ]),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    '${getX.dataUser['data'][index]['avatar']}',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 5, 3, 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${getX.dataUser['data'][index]['first_name']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${getX.dataUser['data'][index]['email']}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
