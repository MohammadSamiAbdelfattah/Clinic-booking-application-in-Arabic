import 'package:hospital_appointments/models/departments_model.dart';

class HospitalModel {
  String hospitalName;
  String image;
  List<DepartmentsModel> departments;

  HospitalModel({
    required this.hospitalName,
    required this.image,
    required this.departments,
  });
}

List<HospitalModel> hospitalsList = [
  HospitalModel(
    hospitalName: "الجراحة",
    image: "assets/images/surgery.jpg",
    departments: surgeryDepartments,
  ),
  HospitalModel(
    hospitalName: "الباطنة",
    image: "assets/images/medicine.jpg",
    departments: internalMedicineDepartments,
  ),
  HospitalModel(
    hospitalName: "الأطفال",
    image: "assets/images/pediatrics.jpg",
    departments: pediatricsDepartments,
  ),
  HospitalModel(
    hospitalName: "النساء والتوليد",
    image: "assets/images/obsgyn.jpg",
    departments: obsGynDepartments,
  ),
  HospitalModel(
    hospitalName: "الأورام",
    image: "assets/images/oncology.jpg",
    departments: oncologyDepartments,
  ),
];
