import 'package:medical_desktop/dao/patient_dao.dart';
import 'package:medical_desktop/models/patient.dart';

class PatientRepository {
  final _patientDao = PatientDao();

  Future<int> save(Patient project) => _patientDao.save(project);

  Future<List<Patient>> findAll() => _patientDao.findAll();

  Future<Patient> findById(int id) => _patientDao.findById(id);

  Future<int> deleteAll() => _patientDao.deleteAll();

  Future<int> delete(int id) => _patientDao.delete(id);
}