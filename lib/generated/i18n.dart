
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

//This file is automatically generated. DO NOT EDIT, all your changes would be lost.

class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
      const GeneratedLocalizationsDelegate();

  static S of(BuildContext context) =>
      Localizations.of<S>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get alert_button_no => "CANCEL";
  String get alert_button_yes => "COMPLETE";
  String get course_weekdays_short_0 => "Mon";
  String get course_weekdays_short_1 => "Tue";
  String get course_weekdays_short_2 => "Wed";
  String get course_weekdays_short_3 => "Thu";
  String get course_weekdays_short_4 => "Fri";
  String get course_weekdays_short_5 => "Sat";
  String get course_weekdays_short_6 => "Sun";
  String get courses_courseStatus_available => "Available";
  String get courses_courseStatus_maybeAvailable => "Maybe available";
  String get courses_courseStatus_notAvailable => "Not available";
  String get courses_filter_department => "Department";
  String get courses_hint_search => "Search by Course Name";
  String get courses_label_contact => "Contact";
  String get courses_label_description => "Description";
  String get courses_label_ects => "ECTS";
  String get courses_label_hoursPerWeek => "Hours per Week";
  String get courses_list_department_short => "DP";
  String get courses_list_noCoursesFound => "No Courses found!";
  String get courses_list_time => "Time";
  String get courses_title => "Courses";
  String get courses_title_courseDetails => "Course Details";
  String get favorites_button_alreadyRegistered => "Courses Already Submitted";
  String get favorites_button_register => "Register Favorited Courses";
  String get favorites_message_completeRegistration => "Complete Registration?";
  String get favorites_title => "Favorites";
  String get login_button_login => "LOGIN";
  String get login_button_loginAsGuest => "Login as Guest";
  String get login_error_passwordNotValid => "Password is not valid";
  String get login_headline => "Courses in English";
  String get login_label_email => "E-Mail";
  String get login_label_password => "Password";
  String get login_text_forgetPassword => "Forgot your password?";
  String get login_text_noAccount => "Don't have an account?";
  String get main_title => "CiE";
  String get maps_campus_karlstrasse => "Karlstrasse Campus";
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  String get maps_campus_pasing => "Pasing Campus";
  String get maps_openMapDescription => "Click on the maps to get directions.";
  String get maps_title => "Map";
  String get schedule_headline_today => "Today";
  String get schedule_headline_weekly => "Weekly";
  String get schedule_item_campus => "Campus";
  String get schedule_item_day => "Day";
  String get schedule_item_room => "Room";
  String get schedule_item_time => "Time";
  String get schedule_text_timeConflict => "Possible Scheduling Conflict";
  String get schedule_title => "Timetable";
  String get settings_button_logout => "Log out";
  String get settings_cieCertificate => "Courses in English Certificate";
  String get settings_contactInternationalOffice => "Contact International Office";
  String get settings_ieCertificate => "International Engineering Certificate";
  String get settings_label_department => "Department";
  String get settings_label_ects => "ECTS";
  String get settings_label_loggedInAs => "Logged in as";
  String get settings_label_status => "Status";
  String get settings_label_takenCourses => "Taken Courses";
  String get settings_label_totalOf => "Total of";
  String get settings_status_exchange => "Exchange student";
  String get settings_status_local => "Local student";
  String get settings_title => "Settings";
  String get start_button_start => "Start";
  String get start_headline => "Courses in English";
  String get tabs_courses => "Courses";
  String get tabs_favorites => "Favorites";
  String get tabs_maps => "Map";
  String get tabs_schedule => "Timetable";
  String get tabs_settings => "Settings";
}

class de extends S {
  const de();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Raum";
  @override
  String get login_label_email => "E-Mail";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Belegte Kurse";
  @override
  String get courses_title => "Kurse";
  @override
  String get courses_courseStatus_available => "Verfügbar";
  @override
  String get settings_title => "Einstellungen";
  @override
  String get settings_label_status => "Status";
  @override
  String get schedule_item_time => "Zeit";
  @override
  String get courses_list_noCoursesFound => "Keine Kurse gefunden!";
  @override
  String get courses_label_hoursPerWeek => "Stunden pro Woche";
  @override
  String get courses_list_department_short => "FK";
  @override
  String get settings_button_logout => "Abmelden";
  @override
  String get settings_cieCertificate => "Courses in English Zertifikat";
  @override
  String get tabs_maps => "Karte";
  @override
  String get login_text_forgetPassword => "Passwort vergessen?";
  @override
  String get settings_label_loggedInAs => "Angemeldet als";
  @override
  String get schedule_title => "Zeitplan";
  @override
  String get schedule_headline_today => "Heute";
  @override
  String get courses_hint_search => "Suche nach Kursname";
  @override
  String get settings_status_exchange => "Austauschstudent";
  @override
  String get maps_openMapDescription => "Klicke auf die Karten, um eine Wegbeschreibung zu erhalten.";
  @override
  String get courses_label_contact => "Kontakt";
  @override
  String get maps_campus_lothstrasse => "Campus Lothstraße";
  @override
  String get courses_filter_department => "Abteilung";
  @override
  String get maps_campus_karlstrasse => "Karlstraße Campus";
  @override
  String get schedule_headline_weekly => "wöchentlich";
  @override
  String get favorites_button_register => "Favoritenliste eintragen";
  @override
  String get tabs_schedule => "Fahrplan";
  @override
  String get login_text_noAccount => "Noch kein Konto?";
  @override
  String get favorites_title => "Favoriten";
  @override
  String get favorites_message_completeRegistration => "Vollständige Registrierung?";
  @override
  String get login_button_loginAsGuest => "Als Gast einloggen";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Kurse auf Englisch";
  @override
  String get courses_label_description => "Beschreibung";
  @override
  String get course_weekdays_short_6 => "So";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "International Engineering Zertifikat";
  @override
  String get course_weekdays_short_5 => "Sa";
  @override
  String get course_weekdays_short_4 => "Fr";
  @override
  String get login_headline => "Kurse auf Englisch";
  @override
  String get course_weekdays_short_3 => "Do";
  @override
  String get schedule_item_day => "Tag";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Kurse";
  @override
  String get favorites_button_alreadyRegistered => "Bereits eingereichte Kurse";
  @override
  String get courses_title_courseDetails => "Kursdetails";
  @override
  String get alert_button_no => "ABBRECHEN";
  @override
  String get settings_contactInternationalOffice => "International Office";
  @override
  String get maps_title => "Karte";
  @override
  String get tabs_settings => "Einstellungen";
  @override
  String get courses_courseStatus_maybeAvailable => "Vielleicht verfügbar";
  @override
  String get login_label_password => "Passwort";
  @override
  String get settings_status_local => "Lokaler Student";
  @override
  String get tabs_favorites => "Favoriten";
  @override
  String get alert_button_yes => "BESTÄTIGEN";
  @override
  String get course_weekdays_short_2 => "Mi";
  @override
  String get course_weekdays_short_1 => "Di";
  @override
  String get course_weekdays_short_0 => "Mo";
  @override
  String get start_button_start => "Start";
  @override
  String get courses_list_time => "Zeit";
  @override
  String get login_error_passwordNotValid => "Passwort ist nicht gültig";
  @override
  String get settings_label_department => "Fakultät";
  @override
  String get schedule_text_timeConflict => "Möglicher zeitlicher Konflikt";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Insgesamt";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Nicht verfügbar";
}

class fi extends S {
  const fi();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Room";
  @override
  String get login_label_email => "Sähköposti";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Taken Courses";
  @override
  String get courses_title => "Kurssit";
  @override
  String get courses_courseStatus_available => "Saatavilla";
  @override
  String get settings_title => "Asetukset";
  @override
  String get settings_label_status => "Tila";
  @override
  String get schedule_item_time => "Aika";
  @override
  String get courses_list_noCoursesFound => "Ei löytynyt kursseja!";
  @override
  String get courses_label_hoursPerWeek => "Tunnit viikossa";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "Kirjaudu ulos";
  @override
  String get settings_cieCertificate => "Courses in English Certificate";
  @override
  String get tabs_maps => "Kartta";
  @override
  String get login_text_forgetPassword => "Unohtuiko salasana?";
  @override
  String get settings_label_loggedInAs => "Kirjautunut sisään";
  @override
  String get schedule_title => "Aikataulu";
  @override
  String get schedule_headline_today => "Tänään";
  @override
  String get courses_hint_search => "Haku kurssien nimestä";
  @override
  String get settings_status_exchange => "Vaihto-opiskelija";
  @override
  String get maps_openMapDescription => "Napsauta karttoja saadaksesi reittiohjeet.";
  @override
  String get courses_label_contact => "Yhteystiedot";
  @override
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  @override
  String get courses_filter_department => "osasto";
  @override
  String get maps_campus_karlstrasse => "Karlstrasse Campus";
  @override
  String get schedule_headline_weekly => "Weekly";
  @override
  String get favorites_button_register => "Rekisteröidy suosikki kursseja";
  @override
  String get tabs_schedule => "Aikataulu";
  @override
  String get login_text_noAccount => "Sinulla ei ole tiliä?";
  @override
  String get favorites_title => "Suosikit";
  @override
  String get favorites_message_completeRegistration => "Täydellinen rekisteröinti?";
  @override
  String get login_button_loginAsGuest => "Kirjaudu sisään vierailijaksi";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Kurssit englanniksi";
  @override
  String get courses_label_description => "Kuvaus";
  @override
  String get course_weekdays_short_6 => "Sun";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "International Engineering Certificate";
  @override
  String get course_weekdays_short_5 => "Sat";
  @override
  String get course_weekdays_short_4 => "Fri";
  @override
  String get login_headline => "Kurssit englanniksi";
  @override
  String get course_weekdays_short_3 => "To";
  @override
  String get schedule_item_day => "päivä";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Kurssit";
  @override
  String get favorites_button_alreadyRegistered => "Kurssit jo lähetetty";
  @override
  String get courses_title_courseDetails => "Kurssitiedot";
  @override
  String get alert_button_no => "PERUUTA";
  @override
  String get settings_contactInternationalOffice => "Ota yhteys kansainväliseen toimistoon";
  @override
  String get maps_title => "Kartta";
  @override
  String get tabs_settings => "Asetukset";
  @override
  String get courses_courseStatus_maybeAvailable => "Ehkä saatavilla";
  @override
  String get login_label_password => "Salasana";
  @override
  String get settings_status_local => "Paikallinen opiskelija";
  @override
  String get tabs_favorites => "Suosikit";
  @override
  String get alert_button_yes => "COMPLETE";
  @override
  String get course_weekdays_short_2 => "Wed";
  @override
  String get course_weekdays_short_1 => "Tue";
  @override
  String get course_weekdays_short_0 => "Mon";
  @override
  String get start_button_start => "Käynnistä";
  @override
  String get courses_list_time => "Time";
  @override
  String get login_error_passwordNotValid => "Salasana ei ole kelvollinen";
  @override
  String get settings_label_department => "osasto";
  @override
  String get schedule_text_timeConflict => "Mahdollinen ajoitusongelma";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Yhteensä";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Ei saatavilla";
}

class sv extends S {
  const sv();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Room";
  @override
  String get login_label_email => "E-post";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Taken Courses";
  @override
  String get courses_title => "Kurser";
  @override
  String get courses_courseStatus_available => "Available";
  @override
  String get settings_title => "Inställningar";
  @override
  String get settings_label_status => "Status";
  @override
  String get schedule_item_time => "Time";
  @override
  String get courses_list_noCoursesFound => "Inga kurser hittades!";
  @override
  String get courses_label_hoursPerWeek => "Hours per Week";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "Logga ut";
  @override
  String get settings_cieCertificate => "Kurser i engelska certifikat";
  @override
  String get tabs_maps => "Map";
  @override
  String get login_text_forgetPassword => "Glömt ditt lösenord?";
  @override
  String get settings_label_loggedInAs => "Inloggad som";
  @override
  String get schedule_title => "Timetable";
  @override
  String get schedule_headline_today => "Today";
  @override
  String get courses_hint_search => "Sök efter kursnamn";
  @override
  String get settings_status_exchange => "Exchange student";
  @override
  String get maps_openMapDescription => "Klicka på kartorna för att få vägbeskrivning.";
  @override
  String get courses_label_contact => "Kontakt";
  @override
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  @override
  String get courses_filter_department => "Department";
  @override
  String get maps_campus_karlstrasse => "Karlstrasse Campus";
  @override
  String get schedule_headline_weekly => "Weekly";
  @override
  String get favorites_button_register => "Registrera favoriterade kurser";
  @override
  String get tabs_schedule => "Tidsplan";
  @override
  String get login_text_noAccount => "Har du inte ett konto?";
  @override
  String get favorites_title => "Favoriter";
  @override
  String get favorites_message_completeRegistration => "Fullständig registrering?";
  @override
  String get login_button_loginAsGuest => "Logga in som gäst";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Kurser på engelska";
  @override
  String get courses_label_description => "Beskrivning";
  @override
  String get course_weekdays_short_6 => "Sun";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "International Engineering Certificate";
  @override
  String get course_weekdays_short_5 => "Sat";
  @override
  String get course_weekdays_short_4 => "Fri";
  @override
  String get login_headline => "Kurser på engelska";
  @override
  String get course_weekdays_short_3 => "Thu";
  @override
  String get schedule_item_day => "Day";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Kurser";
  @override
  String get favorites_button_alreadyRegistered => "Kurser som redan skickats in";
  @override
  String get courses_title_courseDetails => "Kursinformation";
  @override
  String get alert_button_no => "CANCEL";
  @override
  String get settings_contactInternationalOffice => "Kontakta International Office";
  @override
  String get maps_title => "Map";
  @override
  String get tabs_settings => "Inställningar";
  @override
  String get courses_courseStatus_maybeAvailable => "Kanske tillgänglig";
  @override
  String get login_label_password => "Lösenord";
  @override
  String get settings_status_local => "Lokal student";
  @override
  String get tabs_favorites => "Favoriter";
  @override
  String get alert_button_yes => "COMPLETE";
  @override
  String get course_weekdays_short_2 => "ons";
  @override
  String get course_weekdays_short_1 => "tis";
  @override
  String get course_weekdays_short_0 => "Mon";
  @override
  String get start_button_start => "Start";
  @override
  String get courses_list_time => "Time";
  @override
  String get login_error_passwordNotValid => "Lösenordet är inte giltigt";
  @override
  String get settings_label_department => "Department";
  @override
  String get schedule_text_timeConflict => "Möjlig schemaläggningskonflikt";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Totalt av";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Ej tillgänglig";
}

class pt extends S {
  const pt();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Room";
  @override
  String get login_label_email => "E-Mail";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Taken Courses";
  @override
  String get courses_title => "Cursos";
  @override
  String get courses_courseStatus_available => "Disponível";
  @override
  String get settings_title => "Configurações";
  @override
  String get settings_label_status => "Status";
  @override
  String get schedule_item_time => "Tempo";
  @override
  String get courses_list_noCoursesFound => "Nenhum curso encontrado!";
  @override
  String get courses_label_hoursPerWeek => "Horas por semana";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "Sair";
  @override
  String get settings_cieCertificate => "Cursos em certificado de inglês";
  @override
  String get tabs_maps => "Mapa";
  @override
  String get login_text_forgetPassword => "Esqueceu sua senha?";
  @override
  String get settings_label_loggedInAs => "Conectado como";
  @override
  String get schedule_title => "Horário";
  @override
  String get schedule_headline_today => "Today";
  @override
  String get courses_hint_search => "Pesquisar por nome do curso";
  @override
  String get settings_status_exchange => "estudante do Exchange";
  @override
  String get maps_openMapDescription => "Clique nos mapas para obter direções.";
  @override
  String get courses_label_contact => "Contact";
  @override
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  @override
  String get courses_filter_department => "Departamento";
  @override
  String get maps_campus_karlstrasse => "Karlstrasse Campus";
  @override
  String get schedule_headline_weekly => "Weekly";
  @override
  String get favorites_button_register => "Registre cursos favoritos";
  @override
  String get tabs_schedule => "Horário";
  @override
  String get login_text_noAccount => "Não tem uma conta?";
  @override
  String get favorites_title => "Favoritos";
  @override
  String get favorites_message_completeRegistration => "Complete Registration?";
  @override
  String get login_button_loginAsGuest => "Login como convidado";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Cursos em inglês";
  @override
  String get courses_label_description => "Descrição";
  @override
  String get course_weekdays_short_6 => "Sun";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "International Engineering Certificate";
  @override
  String get course_weekdays_short_5 => "Sat";
  @override
  String get course_weekdays_short_4 => "Fri";
  @override
  String get login_headline => "Cursos em inglês";
  @override
  String get course_weekdays_short_3 => "Thu";
  @override
  String get schedule_item_day => "Dia";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Cursos";
  @override
  String get favorites_button_alreadyRegistered => "Cursos já enviados";
  @override
  String get courses_title_courseDetails => "Detalhes do curso";
  @override
  String get alert_button_no => "CANCELAR";
  @override
  String get settings_contactInternationalOffice => "Contact International Office";
  @override
  String get maps_title => "Mapa";
  @override
  String get tabs_settings => "Configurações";
  @override
  String get courses_courseStatus_maybeAvailable => "Talvez disponível";
  @override
  String get login_label_password => "Senha";
  @override
  String get settings_status_local => "estudante local";
  @override
  String get tabs_favorites => "Favoritos";
  @override
  String get alert_button_yes => "COMPLETO";
  @override
  String get course_weekdays_short_2 => "qua";
  @override
  String get course_weekdays_short_1 => "Tue";
  @override
  String get course_weekdays_short_0 => "Mon";
  @override
  String get start_button_start => "Iniciar";
  @override
  String get courses_list_time => "Tempo";
  @override
  String get login_error_passwordNotValid => "Senha não é válida";
  @override
  String get settings_label_department => "Departamento";
  @override
  String get schedule_text_timeConflict => "Conflito de agendamento possível";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Total de";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Não disponível";
}

class th extends S {
  const th();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "ห้อง";
  @override
  String get login_label_email => "E-Mail";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "หลักสูตรที่ได้รับ";
  @override
  String get courses_title => "หลักสูตร";
  @override
  String get courses_courseStatus_available => "พร้อมใช้งาน";
  @override
  String get settings_title => "การตั้งค่า";
  @override
  String get settings_label_status => "สถานะ";
  @override
  String get schedule_item_time => "เวลา";
  @override
  String get courses_list_noCoursesFound => "ไม่พบหลักสูตร!";
  @override
  String get courses_label_hoursPerWeek => "Hours per Week";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "ออกจากระบบ";
  @override
  String get settings_cieCertificate => "หลักสูตรภาษาอังกฤษ";
  @override
  String get tabs_maps => "แผนที่";
  @override
  String get login_text_forgetPassword => "ลืมรหัสผ่านของคุณ?";
  @override
  String get settings_label_loggedInAs => "เข้าสู่ระบบด้วย";
  @override
  String get schedule_title => "ตารางเวลา";
  @override
  String get schedule_headline_today => "วันนี้";
  @override
  String get courses_hint_search => "ค้นหาตามชื่อหลักสูตร";
  @override
  String get settings_status_exchange => "แลกเปลี่ยนนักเรียน";
  @override
  String get maps_openMapDescription => "คลิกที่แผนที่เพื่อขอเส้นทาง";
  @override
  String get courses_label_contact => "ติดต่อ";
  @override
  String get courses_filter_department => "ภาควิชา";
  @override
  String get schedule_headline_weekly => "Weekly";
  @override
  String get favorites_button_register => "ลงทะเบียนหลักสูตรที่ชื่นชอบ";
  @override
  String get tabs_schedule => "ตารางเวลา";
  @override
  String get login_text_noAccount => "ไม่มีบัญชีหรือ?";
  @override
  String get favorites_title => "รายการโปรด";
  @override
  String get favorites_message_completeRegistration => "การลงทะเบียนแบบสมบูรณ์?";
  @override
  String get login_button_loginAsGuest => "เข้าสู่ระบบด้วย Guest";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "หลักสูตรภาษาอังกฤษ";
  @override
  String get courses_label_description => "คำอธิบาย";
  @override
  String get course_weekdays_short_6 => "ดวงอาทิตย์";
  @override
  String get schedule_item_campus => "วิทยาเขต";
  @override
  String get settings_ieCertificate => "ใบรับรองวิศวกรรมนานาชาติ";
  @override
  String get course_weekdays_short_5 => "เสาร์";
  @override
  String get course_weekdays_short_4 => "ศุกร์";
  @override
  String get login_headline => "หลักสูตรภาษาอังกฤษ";
  @override
  String get course_weekdays_short_3 => "พฤหัสบดี";
  @override
  String get schedule_item_day => "วัน";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "หลักสูตร";
  @override
  String get favorites_button_alreadyRegistered => "หลักสูตรที่ส่งแล้ว";
  @override
  String get courses_title_courseDetails => "รายละเอียดหลักสูตร";
  @override
  String get alert_button_no => "CANCEL";
  @override
  String get settings_contactInternationalOffice => "ติดต่อสำนักงานระหว่างประเทศ";
  @override
  String get maps_title => "แผนที่";
  @override
  String get tabs_settings => "การตั้งค่า";
  @override
  String get courses_courseStatus_maybeAvailable => "อาจจะใช้ได้";
  @override
  String get login_label_password => "รหัสผ่าน";
  @override
  String get settings_status_local => "นักเรียนท้องถิ่น";
  @override
  String get tabs_favorites => "รายการโปรด";
  @override
  String get alert_button_yes => "COMPLETE";
  @override
  String get course_weekdays_short_2 => "พุธ";
  @override
  String get course_weekdays_short_1 => "อังคาร";
  @override
  String get course_weekdays_short_0 => "จันทร์";
  @override
  String get start_button_start => "Start";
  @override
  String get courses_list_time => "เวลา";
  @override
  String get login_error_passwordNotValid => "รหัสผ่านไม่ถูกต้อง";
  @override
  String get settings_label_department => "Department";
  @override
  String get schedule_text_timeConflict => "ความขัดแย้งในการจัดกำหนดการที่เป็นไปได้";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "รวม";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "ไม่พร้อมใช้งาน";
}

class en extends S {
  const en();
}

class it extends S {
  const it();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Room";
  @override
  String get login_label_email => "E-mail";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Corsi presi";
  @override
  String get courses_title => "Corsi";
  @override
  String get courses_courseStatus_available => "Disponibile";
  @override
  String get settings_title => "Impostazioni";
  @override
  String get settings_label_status => "Stato";
  @override
  String get schedule_item_time => "Time";
  @override
  String get courses_list_noCoursesFound => "Nessun corso trovato!";
  @override
  String get courses_label_hoursPerWeek => "Ore per settimana";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "Esci";
  @override
  String get settings_cieCertificate => "Corsi in inglese certificato";
  @override
  String get tabs_maps => "Mappa";
  @override
  String get login_text_forgetPassword => "Hai dimenticato la password?";
  @override
  String get settings_label_loggedInAs => "Connesso come";
  @override
  String get schedule_title => "Orario";
  @override
  String get schedule_headline_today => "Today";
  @override
  String get courses_hint_search => "Cerca per nome del corso";
  @override
  String get settings_status_exchange => "Scambia studenti";
  @override
  String get maps_openMapDescription => "Fai clic sulle mappe per ottenere indicazioni stradali.";
  @override
  String get courses_label_contact => "Contatto";
  @override
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  @override
  String get courses_filter_department => "Dipartimento";
  @override
  String get maps_campus_karlstrasse => "Campus di Karlstrasse";
  @override
  String get schedule_headline_weekly => "Weekly";
  @override
  String get favorites_button_register => "Registra i corsi preferiti";
  @override
  String get tabs_schedule => "Orario";
  @override
  String get login_text_noAccount => "Non hai un account?";
  @override
  String get favorites_title => "Preferiti";
  @override
  String get favorites_message_completeRegistration => "Completa registrazione?";
  @override
  String get login_button_loginAsGuest => "Accedi come ospite";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Corsi in inglese";
  @override
  String get courses_label_description => "Descrizione";
  @override
  String get course_weekdays_short_6 => "Sun";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "Certificato di ingegneria internazionale";
  @override
  String get course_weekdays_short_5 => "Sat";
  @override
  String get course_weekdays_short_4 => "Fri";
  @override
  String get login_headline => "Corsi in inglese";
  @override
  String get course_weekdays_short_3 => "Thu";
  @override
  String get schedule_item_day => "Day";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Corsi";
  @override
  String get favorites_button_alreadyRegistered => "Corsi già inoltrati";
  @override
  String get courses_title_courseDetails => "Dettagli del corso";
  @override
  String get alert_button_no => "ANNULLA";
  @override
  String get settings_contactInternationalOffice => "Contatta l'ufficio internazionale";
  @override
  String get maps_title => "Mappa";
  @override
  String get tabs_settings => "Impostazioni";
  @override
  String get courses_courseStatus_maybeAvailable => "Forse disponibile";
  @override
  String get login_label_password => "Password";
  @override
  String get settings_status_local => "Studente locale";
  @override
  String get tabs_favorites => "Preferiti";
  @override
  String get alert_button_yes => "COMPLETE";
  @override
  String get course_weekdays_short_2 => "Wed";
  @override
  String get course_weekdays_short_1 => "Tue";
  @override
  String get course_weekdays_short_0 => "Mon";
  @override
  String get start_button_start => "Start";
  @override
  String get courses_list_time => "Time";
  @override
  String get login_error_passwordNotValid => "La password non è valida";
  @override
  String get settings_label_department => "Dipartimento";
  @override
  String get schedule_text_timeConflict => "Possibile conflitto di pianificazione";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Totale di";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Non disponibile";
}

class fr extends S {
  const fr();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get schedule_item_room => "Salle";
  @override
  String get login_label_email => "E-Mail";
  @override
  String get maps_campus_pasing => "Pasing Campus";
  @override
  String get settings_label_takenCourses => "Cours suivis";
  @override
  String get courses_title => "Cours";
  @override
  String get courses_courseStatus_available => "Disponible";
  @override
  String get settings_title => "Paramètres";
  @override
  String get settings_label_status => "Statut";
  @override
  String get schedule_item_time => "Heure";
  @override
  String get courses_list_noCoursesFound => "Aucun cours trouvé!";
  @override
  String get courses_label_hoursPerWeek => "Heures par semaine";
  @override
  String get courses_list_department_short => "DP";
  @override
  String get settings_button_logout => "Déconnexion";
  @override
  String get settings_cieCertificate => "Cours en anglais";
  @override
  String get tabs_maps => "Carte";
  @override
  String get login_text_forgetPassword => "Mot de passe oublié?";
  @override
  String get settings_label_loggedInAs => "Connecté en tant que";
  @override
  String get schedule_title => "Timetable";
  @override
  String get schedule_headline_today => "Aujourd'hui";
  @override
  String get courses_hint_search => "Recherche par nom de cours";
  @override
  String get settings_status_exchange => "Echange d'étudiants";
  @override
  String get maps_openMapDescription => "Cliquez sur les cartes pour obtenir les directions.";
  @override
  String get courses_label_contact => "Contact";
  @override
  String get maps_campus_lothstrasse => "Lothstrasse Campus";
  @override
  String get courses_filter_department => "Département";
  @override
  String get maps_campus_karlstrasse => "Karlstrasse Campus";
  @override
  String get schedule_headline_weekly => "Hebdomadaire";
  @override
  String get favorites_button_register => "Enregistrer les cours favoris";
  @override
  String get tabs_schedule => "Calendrier";
  @override
  String get login_text_noAccount => "Vous n'avez pas de compte?";
  @override
  String get favorites_title => "Favoris";
  @override
  String get favorites_message_completeRegistration => "Enregistrement complet?";
  @override
  String get login_button_loginAsGuest => "Connexion en tant qu'invité";
  @override
  String get login_button_login => "LOGIN";
  @override
  String get start_headline => "Cours en anglais";
  @override
  String get courses_label_description => "Description";
  @override
  String get course_weekdays_short_6 => "Soleil";
  @override
  String get schedule_item_campus => "Campus";
  @override
  String get settings_ieCertificate => "Certificat d'ingénierie international";
  @override
  String get course_weekdays_short_5 => "Sat";
  @override
  String get course_weekdays_short_4 => "Ven";
  @override
  String get login_headline => "Cours en anglais";
  @override
  String get course_weekdays_short_3 => "Jeu";
  @override
  String get schedule_item_day => "Jour";
  @override
  String get settings_label_ects => "ECTS";
  @override
  String get tabs_courses => "Cours";
  @override
  String get favorites_button_alreadyRegistered => "Cours déjà soumis";
  @override
  String get courses_title_courseDetails => "Détails du cours";
  @override
  String get alert_button_no => "ANNULER";
  @override
  String get settings_contactInternationalOffice => "Contacter le bureau international";
  @override
  String get maps_title => "Carte";
  @override
  String get tabs_settings => "Paramètres";
  @override
  String get courses_courseStatus_maybeAvailable => "Peut-être disponible";
  @override
  String get login_label_password => "Mot de passe";
  @override
  String get settings_status_local => "Étudiant local";
  @override
  String get tabs_favorites => "Favoris";
  @override
  String get alert_button_yes => "COMPLETE";
  @override
  String get course_weekdays_short_2 => "Mer";
  @override
  String get course_weekdays_short_1 => "Mar";
  @override
  String get course_weekdays_short_0 => "Mon";
  @override
  String get start_button_start => "Démarrer";
  @override
  String get courses_list_time => "Heure";
  @override
  String get login_error_passwordNotValid => "Le mot de passe n'est pas valide";
  @override
  String get settings_label_department => "Département";
  @override
  String get schedule_text_timeConflict => "Conflit d'ordonnancement possible";
  @override
  String get courses_label_ects => "ECTS";
  @override
  String get settings_label_totalOf => "Total de";
  @override
  String get main_title => "CiE";
  @override
  String get courses_courseStatus_notAvailable => "Non disponible";
}

class es extends S {
  const es();

   @override
  TextDirection get textDirection => TextDirection.ltr;

}


class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[

      const Locale("de", ""),
      const Locale("fi", ""),
      const Locale("sv", ""),
      const Locale("pt", ""),
      const Locale("th", ""),
      const Locale("en", ""),
      const Locale("it", ""),
      const Locale("fr", ""),
      const Locale("es", ""),

    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      final Locale languageLocale = new Locale(locale.languageCode, "");
      if (supported.contains(locale))
        return locale;
      else if (supported.contains(languageLocale))
        return languageLocale;
      else {
        final Locale fallbackLocale = fallback ?? supported.first;
        return fallbackLocale;
      }
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    final String lang = getLang(locale);
    switch (lang) {

      case "de":
        return new SynchronousFuture<WidgetsLocalizations>(const de());
      case "fi":
        return new SynchronousFuture<WidgetsLocalizations>(const fi());
      case "sv":
        return new SynchronousFuture<WidgetsLocalizations>(const sv());
      case "pt":
        return new SynchronousFuture<WidgetsLocalizations>(const pt());
      case "th":
        return new SynchronousFuture<WidgetsLocalizations>(const th());
      case "en":
        return new SynchronousFuture<WidgetsLocalizations>(const en());
      case "it":
        return new SynchronousFuture<WidgetsLocalizations>(const it());
      case "fr":
        return new SynchronousFuture<WidgetsLocalizations>(const fr());
      case "es":
        return new SynchronousFuture<WidgetsLocalizations>(const es());

      default:
        return new SynchronousFuture<WidgetsLocalizations>(const S());
    }
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

String getLang(Locale l) => l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
