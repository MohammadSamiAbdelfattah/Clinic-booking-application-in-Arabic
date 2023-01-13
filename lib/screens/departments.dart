import 'package:flutter/material.dart';
import 'package:hospital_appointments/screens/department_info.dart';

class Departments extends StatelessWidget {
  const Departments({Key? key}) : super(key: key);

  static const routeName = "departments";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as List;
    String hospitalName = args[0];
    List departments = args[1];
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
                  hospitalName,
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
              Expanded(
                child: departments.isEmpty
                    ? const Center(
                        child: Text(
                          "لا يوجد بيانات",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        itemCount: departments.length,
                        itemBuilder: (_, index) {
                          var department = departments[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DepartmentInfo.routeName,
                                arguments: [
                                  department.departmentName,
                                  department.description,
                                  department.link
                                ],
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 30,
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      department.image,
                                      height: 60,
                                      width: 50,
                                    ),
                                    const SizedBox(width: 45),
                                    Text(
                                      department.departmentName,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
