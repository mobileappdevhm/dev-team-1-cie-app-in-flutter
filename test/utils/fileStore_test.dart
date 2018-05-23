/* TODO: Finish Data Storage Mechanism and Write Tests per Sprint #2
  FileStore.getFile(FileStore.COURSES).then((File file) {
  FileStore.readFileAsString(FileStore.COURSES).then((String value) {
  file.writeAsString('''
          [{
            "course_name": "Konklab",
            "professor_name": "Mireielle",
            "classroom_name": "Brightwell",
            "building_name": "Dresse",
            "schedule_time": "7:08 AM",
            "schedule_days": "10:23 AM"
          }, {
            "course_name": "Daltfresh",
            "professor_name": "Matilde",
            "classroom_name": "Rubenchik",
            "building_name": "Perello",
            "schedule_time": "11:11 PM",
            "schedule_days": "5:06 AM"
          }]
          ''');
  print(JSON.decode(value)[1]['course_name']);
  });
  });
*/
