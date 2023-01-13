import 'package:flutter/material.dart';
import 'package:hospital_appointments/models/hospital_depart_model.dart';
import 'package:hospital_appointments/screens/departments.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("عيادات المستشفى"),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                height: 200,
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/clinic.jpg",
                      height: 60,
                      width: 60,
                    ),
                    const Text(
                      "عيادات المستشفى",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.people_alt_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "المواقع الاجتماعية",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.info_outline_rounded,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "معلومات عن التطبيق",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.share_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "شارك التطبيق",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[700],
                        height: 40,
                        indent: 30,
                        endIndent: 30,
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.policy_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "شروط الاستخدام والخصوصية",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.check_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "اقترح ميزة جديدة",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: Colors.blue,
                        ),
                        title: Text(
                          "بلغ عن خطأ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _preface(),
            _title(),
            _hospitalCard(context),
          ],
        ),
      ),
    );
  }
}

Widget _preface() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 15),
    height: 150,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: const Text(
      "تعد عيادات المستشفى من أوائل العيادات فى مصر حيث تم انشاؤها منذ 30 عاماً وتقع بالقاهرة وتعد من أقدم وأكبر العيادات بمصر",
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );
}

Widget _title() {
  return Container(
    padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
    child: const Text(
      "المستشفيات",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _hospitalCard(BuildContext context) {
  return Expanded(
    child: ListView.builder(
      itemCount: hospitalsList.length,
      itemBuilder: (_, index) {
        var hospital = hospitalsList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Departments.routeName,
                arguments: [
                  hospital.hospitalName,
                  hospital.departments,
                ],
              );
            },
            child: Card(
              elevation: 30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      hospital.image,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          hospital.hospitalName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
