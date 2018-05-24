import 'package:cie_team1/model/course/course.dart';
import 'package:test/test.dart';

@Timeout(const Duration(seconds: 10))

void main(){

  group("simplecourseTest", () {

    test('1', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.name, "Blaba");
    });

    test('2', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.faculty, "7");
    });
    test('3', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.startTime, "2");
    });
    test('4', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.description, "boring");
    });
    test('5', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.hoursPerWeak, 2);
    });
    test('6', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.ects, 2);
    });

    test('7', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.professorEmail, "example@hm.edu");
    });

    test('8', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.professorName, "Max Mustermann");
    });

    test('9', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.availableForStudent, 1);
    });

    test('10', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.isFavourite, false);
    });

    test('11', () {
      final Course sut = new Course(
          "Blaba",
          "7",
          "Mo",
          "2",
          "3",
          "boring",
          2,
          2,
          "example@hm.edu",
          "Max Mustermann",
          1,
          false,
          5);

      expect(sut.availability, 5);
    });
  });


}

