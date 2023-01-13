import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DepartmentInfo extends StatelessWidget {
  const DepartmentInfo({Key? key}) : super(key: key);

  static const routeName = "department_info";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List;
    String departmentName = args[0];
    String description = args[1];
    String link = args[2];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "assets/images/appointment.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const Text(
                    "عيادات المستشفى",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(
                  departmentName,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 3,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: link == ""
                      ? () {}
                      : () async {
                          final Uri uri = Uri.parse(link);
                          if (!await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw "Can not launch url";
                          }
                        },
                  child: const Text(
                    "حجز الكشف",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      elevation: 3,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      )),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "مواعيد العيادة:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "السبت والأحد من الساعة التاسعة صباحاً إلى الساعة الحادية عشر مساءً",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(
                      color: Colors.grey[700],
                      height: 40,
                      indent: 30,
                      endIndent: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "التعريف بالقسم:",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
