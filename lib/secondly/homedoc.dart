import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/portfolio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

 const Urlf = 'https://www.facebook.com/maaz.ajmal.77';

 const url2 = 'https://maps.app.goo.gl/LMGKXmfU5qdF89yY6';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          padding: EdgeInsets.only(left: 20.0,top: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/doctorz.jpg",
                    ),
                    radius: 40.0,
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DR.Asma@gmail.com",style: TextStyle(
                    fontSize: 20.0,
                  ),),
                ],
              ),
              SizedBox(height: 25.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    color: Colors.green,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Portfolio()));
                      },
                      child: Text("About me",style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 65.0),
            child: Text(
              "Dr.Asma",
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: AssetImage("assets/images/backg.jpg"),
          //   fit: BoxFit.cover,
          // )
            color: Colors.white70,
    ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                  child: Column(
                children: [
                  SizedBox(height: 30.0,),
                  Hero(
                    tag: 'dash',
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/doctorz.jpg",
                      ),
                      radius: 60.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Dr.Asma"),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "       BDS(HUDH) RDS(PAK) \n Hassan Medical Complex Sawat",
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, '/appointment'),
                            child: Image(
                              image: AssetImage(
                                "assets/images/doctor.png",
                              ),
                              width: 60,
                              height: 60,
                            ),
                          ),
                          Text(
                            "Apointment",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                 _launchphone('tel:03055900106');
                              });
                            },
                            child: Image(
                              image: AssetImage(
                                "assets/images/call.png",
                              ),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Text("Phone"),
                        ],
                      ),
                      SizedBox(
                        width: 23.0,
                      ),
                      Column(
                        children: [
                          InkWell(
                            // onTap: launchURL1,
                            onTap: () => launchWhatsApp(),
                            child: Image(
                              image: AssetImage("assets/images/whatsapp.png"),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Text("Chat"),
                        ],
                      ),
                      SizedBox(
                        width: 23.0,
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: launchURL2,
                            child: Image(
                              image:
                                  AssetImage("assets/images/google-maps.png"),
                              width: 40,
                              height: 40,
                            ),
                          ),
                          Text("Location"),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              )),
            ],
          ),
        ));
  }
}

launchWhatsApp() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+923134819007',
    text: "Hey! I need Appointment , Can i get it today...?",
  );
  // Convert the WhatsAppUnilink instance to a string.
  // Use either Dart's string interpolation or the toString() method.
  // The "launch" method is part of "url_launcher".
  await launch('$link');
}

void launchURL2() async => await canLaunch(url2)
    ? await launch(url2)
    : throw 'Could not launch cz $url2';




Future<void> _launchUniversalLinkIos(String url) async {
  if (await canLaunch(url)) {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }
}

// Future<void> _launchInWebViewOrVC(String url) async {
//   if (await canLaunch(url)) {
//     await launch(
//       url,
//       forceSafariVC: true,
//       forceWebView: true,
//       headers: <String, String>{'my_header_key': 'my_header_value'},
//     );
//   } else {
//     throw 'Could not launch $url';
//   }
// }



Future<void> _launchphone(String url) async {
  if (await canLaunch(url)) {
     await launch(url);

  }
  else{
    throw 'Could not launch ';
  }
  }

