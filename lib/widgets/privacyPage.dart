import 'package:cie_team1/utils/cieColor.dart';
import 'package:flutter/material.dart';
import 'package:cie_team1/utils/cieStyle.dart';
import 'package:cie_team1/utils/staticVariables.dart';

class PrivacyPage extends StatefulWidget {
  PrivacyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PrivacyPageState createState() => new _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool changeLanguage = false;
  String privacyPolicyText = '';
  String privacyButtonText = '';

  @override
  Widget build(BuildContext context) {
    if (changeLanguage == true) {
      privacyPolicyText = privacyTextGER;
      privacyButtonText = StaticVariables.CHANGE_TO_ENGLISH;
    } else {
      privacyPolicyText = privacyTextENG;
      privacyButtonText = StaticVariables.CHANGE_TO_GERMAN;
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Privacy Policy",
          style: CiEStyle.getAppBarTitleStyle(context),
        ),
        elevation: CiEStyle.getAppBarElevation(context),
        backgroundColor: CiEColor.lightGray,
      ),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new SingleChildScrollView(
                    child: new Text(
                  privacyPolicyText,
                  style: new TextStyle(fontSize: 15.0),
                )),
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                const IconData(0xe0e1,
                                    fontFamily: 'MaterialIcons'),
                                size: 30.0,
                              ),
                              new Text(
                                "Contact",
                                style: new TextStyle(fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    child: new RaisedButton(
                      onPressed: toggleLanguage,
                      shape: new RoundedRectangleBorder(
                          borderRadius: CiEStyle.getButtonBorderRadius()),
                      color: CiEColor.red,
                      child: new Text(
                        privacyButtonText,
                        style: CiEStyle.getSettingsPrivacyStyle(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void toggleLanguage() {
    setState(() {
      this.changeLanguage = !changeLanguage;
    });
  }

  final String privacyTextENG = "This data protection declaration explains to you the type, scope and purpose of the processing of personal data (hereinafter referred to as “data”) within our online offer and the associated websites, functions and contents as well as external online presences, e.g. our social media profile (hereinafter jointly referred to as “online offer”). With regard to the terms used, such as “processing” or “person responsible”, we refer to the definitions in Art. 4 of the General Data Protection Regulation (GDPR)\n\n" +
      "Types of data processed: \n" +
      "- Inventory data (e.g., Names, Addresses). \n- Contact data (e.g., E-mail, Telephone numbers). \n- Content data (e.g., Text input, Photographs, Videos). \n- Usage data (e.g., Interest in content, Access times). \n- Meta/communication data (e.g., Device information, IP addresses)." +
      "\n\n\Categories of affected persons\n" +
      "Visitors and users of the online offer (hereinafter referred to as “Users”)." +
      "\n\nPurpose of processing\n" +
      "\n- Provision of the online offer, its functions and contents."
      "\n- Response to contact requests and communication with users. "
      "\n- Safety precautions. "
      "\n- Range measurement" +
      "\n\nTerms usage\n" +
      "“Personal Information” is all information that relates to an identified or identifiable natural person (in what follows “affected individual“) ;identifiable is a natural person who can be identified, directly or indirectly, in particular by association with an identifier such as a name, an identification number, location data, an online identifier (e.g. Cookie) or one or more special features which express the physical, physiological, genetic, psychological, economic, cultural or social identity of that natural person." +
      "\n“Processing” means any operation or series of operations carried out with or without the aid of automated procedures in connection with personal data. The term goes a long way and covers practically every handling of data." +
      "\n“Pseudonymisation” means the processing of personal data in such a way that the personal data cannot be attributed to a specific data subject without the use of additional information, provided that this additional information is kept separately and is subject to technical and organizational measures to ensure that the personal data are not attributed to an identified or identifiable natural person." +
      "\n“Profiling” means any automated processing of personal data consisting in the use of such personal data to evaluate certain personal aspects relating to a natural person, in particular to analyst or predict aspects relating to the work performance, economic situation, health, personal preferences, interests, reliability, behavior, location or relocation of that natural person." +
      "\nAs “Responsible” means the natural or legal person, authority, institution or other body which alone or together with others decides on the purposes and means of processing personal data." +
      "\n“Processor” means any natural or legal person, authority, institution or other body processing personal data on behalf of the data controller." +
      "\n\nApplicable legal bases\n" +
      "In accordance with Art. 13 GDPR, we inform you of the legal basis of our data processing. If the legal basis is not mentioned in the data protection declaration, the following applies: The legal basis for obtaining consents is Art. 6 para. 1 lit. a and Art. 7 GDPR, the legal basis for processing for the performance of our services and performance of contractual measures as well as for answering inquiries is Art. 6 para. 1 lit. b GDPR, the legal basis for processing to fulfil our legal obligations is Art. 6 para. 1 lit. c GDPR, and the legal basis for processing to protect our legitimate interests is Art. 6 para. 1 lit. f GDPR. In the event that the vital interests of the data subject or another natural person require the processing of personal data, Article 6(1)(d) GDPR serves as the legal basis." +
      "\n\nSafety precautions\n" +
      "We shall take appropriate technical and organisational measures to ensure a level of protection appropriate to the risk, taking into account the state of the art, implementation costs and the nature, scope, circumstances and purposes of the processing and the different likelihood and severity of the risk to the rights and freedoms of natural persons, in accordance with Article 32 GDPR." +
      "Such measures shall in particular include ensuring the confidentiality, integrity and availability of data by controlling physical access to the data, as well as the access, input, transmission, security of availability and its separation. Furthermore, we have established procedures to ensure the exercise of rights of data subjects, deletion of data and reaction to endangerment of data. Furthermore, we already consider the protection of personal data during the development or selection of hardware, software and procedures, in accordance with the principle of data protection through technology design and data protection-friendly presettings (Art. 25 GDPR)." +
      "\n\nCooperation with contract processors and third parties\n" +
      "If we disclose data to other persons and companies (contract processors or third parties) within the scope of our processing, transmit it to them or otherwise grant them access to the data, this shall only take place on the basis of a legal permission (e.g. if a transmission of the data to third parties, such as payment service providers, in accordance with Art. 6 para. 1 letter b GDPR is required for contract fulfilment), if you have consented, if a legal obligation provides for this or on the basis of our legitimate interests (e.g. when using agents, web hosts, etc.)." +
      "\nIf we commission third parties with the processing of data on the basis of a so-called “order processing contract” this is done on the basis of Art. 28 GDPR." +
      "\n\nTransfers to third countries\n" +
      "\nIf we process data in a third country (i.e. outside the European Union (EU) or the European Economic Area (EEA)) or if this occurs in the context of the use of third-party services or disclosure or transfer of data to third parties, this only takes place if it occurs for the fulfilment of our (pre)contractual obligations, on the basis of your consent, on the basis of a legal obligation or on the basis of our legitimate interests. Subject to legal or contractual permissions, we process or leave the data in a third country only if the special requirements of Art. 44 ff. Process GDPR. This means, for example, processing is carried out on the basis of special guarantees, such as the officially recognised determination of a data protection level corresponding to the EU (e.g. for the USA by the “Privacy Shield”) or compliance with officially recognised special contractual obligations (so-called “Standard Contractual Clauses”)." +
      "\n\nRights of data subjects\n" +
      "\nYou have the right to request confirmation as to whether the data concerned are being processed and to request information about these data as well as further information and a copy of the data in accordance with Art. 15 GDPR" +
      "\nThey have correspondingly. In accordance with Article 16 of the GDPR, you have the right to request the completion of data concerning you or the correction of inaccurate data concerning you." +
      "\nYou have the right under Art. 17 GDPR to demand that the data concerned be deleted immediately or, alternatively, to demand a restriction on the processing of the data under Art. 18 GDPR." +
      "\nYou have the right to request that the data concerning you that you have provided to us be received in accordance with Art. 20 GDPR and to request its transmission to other persons responsible." +
      "\nYou also have the right to file a complaint with the competent supervisory authority pursuant to Art. 77 GDPR." +
      "\n\nRight of revocation\n" +
      "\nYou have the right to revoke consents granted in accordance with Art. 7 para. 3 GDPR with effect for the future" +
      "\n\nRight of objection\n" +
      "\nYou can object to the future processing of the data concerning you in accordance with Art. 21 GDPR at any time. The objection may be lodged in particular against processing for direct marketing purposes." +
      "\n\nDeletion of data\n" +
      "\nThe data processed by us will be deleted or its processing restricted in accordance with Articles 17 and 18 GDPR. Unless expressly stated in this data protection declaration, the data stored by us will be deleted as soon as it is no longer required for its intended purpose and the deletion does not conflict with any statutory storage obligations. If the data are not deleted because they are necessary for other and legally permissible purposes, their processing is restricted. This means that the data is blocked and not processed for other purposes. This applies, for example, to data that must be retained for commercial or tax reasons." +
      "In accordance with legal requirements in Germany, the storage is carried out in particular for 10 years in accordance with §§ 147 para. 1 AO, 257 para. 1 no. 1 and 4, para. 4 HGB (books, records, management reports, accounting documents, trading books, documents relevant for taxation, etc.) and 6 years in accordance with § 257 para. 1 no. 2 and 3, para. 4 HGB (commercial letters)." +
      "In accordance with legal requirements in Austria, storage is carried out in particular for 7 years in accordance with § 132 para. 1 BAO (accounting documents, receipts/invoices, accounts, receipts, business papers, statement of income and expenses, etc.), for 22 years in connection with real estate and for 10 years for documents in connection with electronically provided services, telecommunications, radio and television services which are provided to non-entrepreneurs in EU member states and for which the Mini-One-Stop-Shop (MOSS) is used." +
      "\nAdministration, financial accounting, office organization, contact management" +
      "\nWe process data within the scope of administrative tasks as well as the organization of our company, financial accounting and compliance with legal obligations, such as archiving. We process the same data that we process in the course of providing our contractual services. The processing bases are Art. 6 para. 1 lit. c. GDPR, Art. 6 para. 1 lit. f. GDPR. Customers, prospects, business partners and website visitors are affected by the processing. The purpose and our interest in the processing lies in the administration, financial accounting, office organization, archiving of data, thus tasks which serve the maintenance of our business activities, perception of our tasks and provision of our services. The deletion of the data with regard to contractual services and contractual communication corresponds to the information provided in these processing activities." +
      "\nWe disclose or transmit data to the tax authorities, consultants such as tax consultants or auditors as well as other fee offices and payment service providers." +
      "\nFurthermore, we store information on suppliers, organizers and other business partners on the basis of our business interests, e.g. for the purpose of making contact at a later date. We store this data, which is mainly company-related, permanently." +
      "\n\nContacting\n" +
      "\nWhen contacting us (e.g. via Contact form, E-mail, Telephone or Social media), the user's details for processing the contact enquiry and its processing pursuant to Art. 6 (1) (b). (in the context of contractual/pre-contractual relationships), Art. 6 para. 1 lit. f. (other requests) GDPR processed. User information can be stored in a Customer Relationship Management System (\"CRM System\")  or comparable request organization." +
      "\nWe delete the requests if they are no longer necessary. We review this requirement every two years; the statutory archiving obligations also apply." +
      "\n\nGoogle Analytics\n" +
      "\nOn the basis of our legitimate interests (i.e. interest in the analysis, optimisation and economic operation of our online offer within the meaning of Art. 6 para. 1 lit. f. GDPR) Google Analytics, a web analysis service of Google LLC(“Google”). Google uses cookies. The information generated by the cookie about the use of the online offer by users is generally transferred to a Google server in the USA and stored there." +
      "\nGoogle is certified under the Privacy Shield Agreement and thus offers a guarantee to comply with European data protection law (https://www.privacyshield.gov/participant?id=a2zt000000001L5AAI&amp;status=Active)." +
      "\nGoogle will use this information on our behalf to evaluate the use of our online offer by users, to compile reports on the activities within this online offer and to provide us with further services associated with the use of this online offer and Internet use. Pseudonymous user profiles can be created from the processed data." +
      "\nWe only use Google Analytics with IP anonymization enabled. This means that Google will reduce the IP address of users within Member States of the European Union or in other states party to the Agreement on the European Economic Area. Only in exceptional cases will the full IP address be transmitted to a Google server in the USA and shortened there." +
      "\nThe IP address transmitted by the user's browser is not merged with other Google data. Users may refuse the use of cookies by selecting the appropriate settings on their browser software; users may also prevent Google from collecting data generated by the cookie and relating to their use of the website and from processing this data by downloading and installing the browser plug-in available at the following link: http://tools.google.com/dlpage/gaoptout?hl=de." +
      "\nFurther information on data use by Google, setting and objection options, can be found in Google's data protection declaration. (https://policies.google.com/technologies/ads) as well as in the settings for the display of advertisements by Google (https://adssettings.google.com/authenticated)." +
      "\nThe personal data of the users will be deleted or anonymized after 14 months." +
      "\n\nIntegration of third-party services and content\n" +
      "\nWe set within our online offer on the basis of our legitimate interests (i.e. interest in the analysis, optimisation and economic operation of our online offer within the meaning of Art. 6 para. 1 lit. f.GDPR) content or service offerings of third parties to incorporate their content and services, such as videos or fonts (hereinafter uniformly referred to as “content”)." +
      "\nThis always requires that the third party providers of this content perceive the IP address of the users, since without the IP address they could not send the content to their browser. The IP address is therefore required for the display of this content. We make every effort to use only those contents whose respective providers use the IP address only for the delivery of the contents. Third-party providers may also use so-called pixel tags (invisible graphics, also known as  \"Web Beacons\") for statistical or marketing purposes. The \"Pixel-Tags\" allow information such as visitor traffic on the pages of this website to be evaluated. The pseudonymous information may also be stored in cookies on the user's device and may include technical information about the browser and operating system, referring websites, visiting time and other information about the use of our online offer, as well as be linked to such information from other sources." +
      "\n\nGoogle Maps\n" +
      "We integrate the maps of the service “Google Maps” of the provider Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA. The processed data may include in particular IP addresses and location data of the users, which, however, are not collected without their consent (as a rule within the framework of the settings of their mobile devices). The data can be processed in the USA. Privacy Policy: https://www.google.com/policies/privacy/, Opt-Out: https://adssettings.google.com/authenticated.";

  final String privacyTextGER = "Diese Datenschutzerklärung klärt Sie über die Art, den Umfang und Zweck der Verarbeitung von personenbezogenen Daten (nachfolgend kurz “Daten”) innerhalb unseres Onlineangebotes und der mit ihm verbundenen Webseiten, Funktionen und Inhalte sowie externen Onlinepräsenzen, wie z.B. unser Social Media Profile auf (nachfolgend gemeinsam bezeichnet als “Onlineangebot”). Im Hinblick auf die verwendeten Begrifflichkeiten, wie z.B. “Verarbeitung” oder “Verantwortlicher” verweisen wir auf die Definitionen im Art. 4 der Datenschutzgrundverordnung (DSGVO)\n\n" +
      "Arten der verarbeiteten Daten:\n" +
      "- Bestandsdaten (z.B., Namen, Adressen). \n- Kontaktdaten (z.B., E-Mail, Telefonnummern). \n- Inhaltsdaten (z.B., Texteingaben, Fotografien, Videos). \n- Nutzungsdaten (z.B., Interesse an Inhalten, Zugriffszeiten). \n- Meta-/Kommunikationsdaten (z.B., Geräte-Informationen, IP-Adressen)." +
      "\n\nKategorien betroffener Persone\n" +
      "Besucher und Nutzer des Onlineangebotes (Nachfolgend bezeichnen wir die betroffenen Personen zusammenfassend auch als “Nutzer”)." +
      "\n\nZweck der Verarbeitung\n" +
      "\n- Zurverfügungstellung des Onlineangebotes, seiner Funktionen und Inhalte."
      "\n- Beantwortung von Kontaktanfragen und Kommunikation mit Nutzern. "
      "\n- Sicherheitsmaßnahmen. "
      "\n- Reichweitenmessung" +
      "\n\nVerwendete Begrifflichkeiten\n" +
      "“Personenbezogene Daten” sind alle Informationen, die sich auf eine identifizierte oder identifizierbare natürliche Person (im Folgenden “betroffene Person”) beziehen; als identifizierbar wird eine natürliche Person angesehen, die direkt oder indirekt, insbesondere mittels Zuordnung zu einer Kennung wie einem Namen, zu einer Kennnummer, zu Standortdaten, zu einer Online-Kennung (z.B. Cookie) oder zu einem oder mehreren besonderen Merkmalen identifiziert werden kann, die Ausdruck der physischen, physiologischen, genetischen, psychischen, wirtschaftlichen, kulturellen oder sozialen Identität dieser natürlichen Person sind." +
      "\n“Verarbeitung” ist jeder mit oder ohne Hilfe automatisierter Verfahren ausgeführte Vorgang oder jede solche Vorgangsreihe im Zusammenhang mit personenbezogenen Daten. Der Begriff reicht weit und umfasst praktisch jeden Umgang mit Daten." +
      "\n“Pseudonymisierung” die Verarbeitung personenbezogener Daten in einer Weise, dass die personenbezogenen Daten ohne Hinzuziehung zusätzlicher Informationen nicht mehr einer spezifischen betroffenen Person zugeordnet werden können, sofern diese zusätzlichen Informationen gesondert aufbewahrt werden und technischen und organisatorischen Maßnahmen unterliegen, die gewährleisten, dass die personenbezogenen Daten nicht einer identifizierten oder identifizierbaren natürlichen Person zugewiesen werden." +
      "\n“Profiling” jede Art der automatisierten Verarbeitung personenbezogener Daten, die darin besteht, dass diese personenbezogenen Daten verwendet werden, um bestimmte persönliche Aspekte, die sich auf eine natürliche Person beziehen, zu bewerten, insbesondere um Aspekte bezüglich Arbeitsleistung, wirtschaftliche Lage, Gesundheit, persönliche Vorlieben, Interessen, Zuverlässigkeit, Verhalten, Aufenthaltsort oder Ortswechsel dieser natürlichen Person zu analysieren oder vorherzusagen." +
      "\nAls “Verantwortlicher” wird die natürliche oder juristische Person, Behörde, Einrichtung oder andere Stelle, die allein oder gemeinsam mit anderen über die Zwecke und Mittel der Verarbeitung von personenbezogenen Daten entscheidet, bezeichnet." +
      "\n“Auftragsverarbeiter” eine natürliche oder juristische Person, Behörde, Einrichtung oder andere Stelle, die personenbezogene Daten im Auftrag des Verantwortlichen verarbeitet." +
      "\n\nMaßgebliche Rechtsgrundlagen\n" +
      "Nach Maßgabe des Art. 13 DSGVO teilen wir Ihnen die Rechtsgrundlagen unserer Datenverarbeitungen mit. Sofern die Rechtsgrundlage in der Datenschutzerklärung nicht genannt wird, gilt Folgendes: Die Rechtsgrundlage für die Einholung von Einwilligungen ist Art. 6 Abs. 1 lit. a und Art. 7 DSGVO, die Rechtsgrundlage für die Verarbeitung zur Erfüllung unserer Leistungen und Durchführung vertraglicher Maßnahmen sowie Beantwortung von Anfragen ist Art. 6 Abs. 1 lit. b DSGVO, die Rechtsgrundlage für die Verarbeitung zur Erfüllung unserer rechtlichen Verpflichtungen ist Art. 6 Abs. 1 lit. c DSGVO, und die Rechtsgrundlage für die Verarbeitung zur Wahrung unserer berechtigten Interessen ist Art. 6 Abs. 1 lit. f DSGVO. Für den Fall, dass lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen Person eine Verarbeitung personenbezogener Daten erforderlich machen, dient Art. 6 Abs. 1 lit. d DSGVO als Rechtsgrundlage." +
      "\n\nSicherheitsmaßnahmen\n" +
      "Wir treffen nach Maßgabe des Art. 32 DSGVO unter Berücksichtigung des Stands der Technik, der Implementierungskosten und der Art, des Umfangs, der Umstände und der Zwecke der Verarbeitung sowie der unterschiedlichen Eintrittswahrscheinlichkeit und Schwere des Risikos für die Rechte und Freiheiten natürlicher Personen, geeignete technische und organisatorische Maßnahmen, um ein dem Risiko angemessenes Schutzniveau zu gewährleisten." +
      "Zu den Maßnahmen gehören insbesondere die Sicherung der Vertraulichkeit, Integrität und Verfügbarkeit von Daten durch Kontrolle des physischen Zugangs zu den Daten, als auch des sie betreffenden Zugriffs, der Eingabe, Weitergabe, der Sicherung der Verfügbarkeit und ihrer Trennung. Des Weiteren haben wir Verfahren eingerichtet, die eine Wahrnehmung von Betroffenenrechten, Löschung von Daten und Reaktion auf Gefährdung der Daten gewährleisten. Ferner berücksichtigen wir den Schutz personenbezogener Daten bereits bei der Entwicklung, bzw. Auswahl von Hardware, Software sowie Verfahren, entsprechend dem Prinzip des Datenschutzes durch Technikgestaltung und durch datenschutzfreundliche Voreinstellungen (Art. 25 DSGVO)." +
      "\n\nZusammenarbeit mit Auftragsverarbeitern und Dritten\n" +
      "Sofern wir im Rahmen unserer Verarbeitung Daten gegenüber anderen Personen und Unternehmen (Auftragsverarbeitern oder Dritten) offenbaren, sie an diese übermitteln oder ihnen sonst Zugriff auf die Daten gewähren, erfolgt dies nur auf Grundlage einer gesetzlichen Erlaubnis (z.B. wenn eine Übermittlung der Daten an Dritte, wie an Zahlungsdienstleister, gem. Art. 6 Abs. 1 lit. b DSGVO zur Vertragserfüllung erforderlich ist), Sie eingewilligt haben, eine rechtliche Verpflichtung dies vorsieht oder auf Grundlage unserer berechtigten Interessen (z.B. beim Einsatz von Beauftragten, Webhostern, etc.)." +
      "\nSofern wir Dritte mit der Verarbeitung von Daten auf Grundlage eines sog. “Auftragsverarbeitungsvertrages” beauftragen, geschieht dies auf Grundlage des Art. 28 DSGVO." +
      "\n\nÜbermittlungen in Drittländer\n" +
      "\nSofern wir Daten in einem Drittland (d.h. außerhalb der Europäischen Union (EU) oder des Europäischen Wirtschaftsraums (EWR)) verarbeiten oder dies im Rahmen der Inanspruchnahme von Diensten Dritter oder Offenlegung, bzw. Übermittlung von Daten an Dritte geschieht, erfolgt dies nur, wenn es zur Erfüllung unserer (vor)vertraglichen Pflichten, auf Grundlage Ihrer Einwilligung, aufgrund einer rechtlichen Verpflichtung oder auf Grundlage unserer berechtigten Interessen geschieht. Vorbehaltlich gesetzlicher oder vertraglicher Erlaubnisse, verarbeiten oder lassen wir die Daten in einem Drittland nur beim Vorliegen der besonderen Voraussetzungen der Art. 44 ff. DSGVO verarbeiten. D.h. die Verarbeitung erfolgt z.B. auf Grundlage besonderer Garantien, wie der offiziell anerkannten Feststellung eines der EU entsprechenden Datenschutzniveaus (z.B. für die USA durch das “Privacy Shield”) oder Beachtung offiziell anerkannter spezieller vertraglicher Verpflichtungen (so genannte “Standardvertragsklauseln”)." +
      "\n\nRechte der betroffenen Personen\n" +
      "\nSie haben das Recht, eine Bestätigung darüber zu verlangen, ob betreffende Daten verarbeitet werden und auf Auskunft über diese Daten sowie auf weitere Informationen und Kopie der Daten entsprechend Art. 15 DSGVO." +
      "\nSie haben entsprechend. Art. 16 DSGVO das Recht, die Vervollständigung der Sie betreffenden Daten oder die Berichtigung der Sie betreffenden unrichtigen Daten zu verlangen." +
      "\nSie haben nach Maßgabe des Art. 17 DSGVO das Recht zu verlangen, dass betreffende Daten unverzüglich gelöscht werden, bzw. alternativ nach Maßgabe des Art. 18 DSGVO eine Einschränkung der Verarbeitung der Daten zu verlangen." +
      "\nSie haben das Recht zu verlangen, dass die Sie betreffenden Daten, die Sie uns bereitgestellt haben nach Maßgabe des Art. 20 DSGVO zu erhalten und deren Übermittlung an andere Verantwortliche zu fordern." +
      "\nSie haben ferner gem. Art. 77 DSGVO das Recht, eine Beschwerde bei der zuständigen Aufsichtsbehörde einzureichen." +
      "\n\nWiderrufsrecht\n" +
      "\nSie haben das Recht, erteilte Einwilligungen gem. Art. 7 Abs. 3 DSGVO mit Wirkung für die Zukunft zu widerrufen" +
      "\n\nWiderspruchsrecht\n" +
      "\nSie können der künftigen Verarbeitung der Sie betreffenden Daten nach Maßgabe des Art. 21 DSGVO jederzeit widersprechen. Der Widerspruch kann insbesondere gegen die Verarbeitung für Zwecke der Direktwerbung erfolgen." +
      "\n\nLöschung von Daten\n" +
      "\nDie von uns verarbeiteten Daten werden nach Maßgabe der Art. 17 und 18 DSGVO gelöscht oder in ihrer Verarbeitung eingeschränkt. Sofern nicht im Rahmen dieser Datenschutzerklärung ausdrücklich angegeben, werden die bei uns gespeicherten Daten gelöscht, sobald sie für ihre Zweckbestimmung nicht mehr erforderlich sind und der Löschung keine gesetzlichen Aufbewahrungspflichten entgegenstehen. Sofern die Daten nicht gelöscht werden, weil sie für andere und gesetzlich zulässige Zwecke erforderlich sind, wird deren Verarbeitung eingeschränkt. D.h. die Daten werden gesperrt und nicht für andere Zwecke verarbeitet. Das gilt z.B. für Daten, die aus handels- oder steuerrechtlichen Gründen aufbewahrt werden müssen." +
      "Nach gesetzlichen Vorgaben in Deutschland, erfolgt die Aufbewahrung insbesondere für 10 Jahre gemäß §§ 147 Abs. 1 AO, 257 Abs. 1 Nr. 1 und 4, Abs. 4 HGB (Bücher, Aufzeichnungen, Lageberichte, Buchungsbelege, Handelsbücher, für Besteuerung relevanter Unterlagen, etc.) und 6 Jahre gemäß § 257 Abs. 1 Nr. 2 und 3, Abs. 4 HGB (Handelsbriefe)." +
      "\nNach gesetzlichen Vorgaben in Österreich erfolgt die Aufbewahrung insbesondere für 7 J gemäß § 132 Abs. 1 BAO (Buchhaltungsunterlagen, Belege/Rechnungen, Konten, Belege, Geschäftspapiere, Aufstellung der Einnahmen und Ausgaben, etc.), für 22 Jahre im Zusammenhang mit Grundstücken und für 10 Jahre bei Unterlagen im Zusammenhang mit elektronisch erbrachten Leistungen, Telekommunikations-, Rundfunk- und Fernsehleistungen, die an Nichtunternehmer in EU-Mitgliedstaaten erbracht werden und für die der Mini-One-Stop-Shop (MOSS) in Anspruch genommen wird." +
      "\nAdministration, Finanzbuchhaltung, Büroorganisation, Kontaktverwaltung" +
      "\nWir verarbeiten Daten im Rahmen von Verwaltungsaufgaben sowie Organisation unseres Betriebs, Finanzbuchhaltung und Befolgung der gesetzlichen Pflichten, wie z.B. der Archivierung. Hierbei verarbeiten wir dieselben Daten, die wir im Rahmen der Erbringung unserer vertraglichen Leistungen verarbeiten. Die Verarbeitungsgrundlagen sind Art. 6 Abs. 1 lit. c. DSGVO, Art. 6 Abs. 1 lit. f. DSGVO. Von der Verarbeitung sind Kunden, Interessenten, Geschäftspartner und Websitebesucher betroffen. Der Zweck und unser Interesse an der Verarbeitung liegt in der Administration, Finanzbuchhaltung, Büroorganisation, Archivierung von Daten, also Aufgaben die der Aufrechterhaltung unserer Geschäftstätigkeiten, Wahrnehmung unserer Aufgaben und Erbringung unserer Leistungen dienen. Die Löschung der Daten im Hinblick auf vertragliche Leistungen und die vertragliche Kommunikation entspricht den, bei diesen Verarbeitungstätigkeiten genannten Angaben." +
      "\nWir offenbaren oder übermitteln hierbei Daten an die Finanzverwaltung, Berater, wie z.B., Steuerberater oder Wirtschaftsprüfer sowie weitere Gebührenstellen und Zahlungsdienstleister." +
      "\nFerner speichern wir auf Grundlage unserer betriebswirtschaftlichen Interessen Angaben zu Lieferanten, Veranstaltern und sonstigen Geschäftspartnern, z.B. zwecks späterer Kontaktaufnahme. Diese mehrheitlich unternehmensbezogenen Daten, speichern wir grundsätzlich dauerhaft." +
      "\n\nKontaktaufnahme\n" +
      "\nBei der Kontaktaufnahme mit uns (z.B. per Kontaktformular, E-Mail, Telefon oder via sozialer Medien) werden die Angaben des Nutzers zur Bearbeitung der Kontaktanfrage und deren Abwicklung gem. Art. 6 Abs. 1 lit. b. (im Rahmen vertraglicher-/vorvertraglicher Beziehungen), Art. 6 Abs. 1 lit. f. (andere Anfragen) DSGVO verarbeitet.. Die Angaben der Nutzer können in einem Customer-Relationship-Management System (\"CRM System\") oder vergleichbarer Anfragenorganisation gespeichert werden." +
      "\nWir löschen die Anfragen, sofern diese nicht mehr erforderlich sind. Wir überprüfen die Erforderlichkeit alle zwei Jahre; Ferner gelten die gesetzlichen Archivierungspflichten." +
      "\n\nGoogle Analytics\n" +
      "\nWir setzen auf Grundlage unserer berechtigten Interessen (d.h. Interesse an der Analyse, Optimierung und wirtschaftlichem Betrieb unseres Onlineangebotes im Sinne des Art. 6 Abs. 1 lit. f. DSGVO) Google Analytics, einen Webanalysedienst der Google LLC (“Google”) ein. Google verwendet Cookies. Die durch das Cookie erzeugten Informationen über Benutzung des Onlineangebotes durch die Nutzer werden in der Regel an einen Server von Google in den USA übertragen und dort gespeichert." +
      "\nGoogle ist unter dem Privacy-Shield-Abkommen zertifiziert und bietet hierdurch eine Garantie, das europäische Datenschutzrecht einzuhalten (https://www.privacyshield.gov/participant?id=a2zt000000001L5AAI&amp;status=Active)." +
      "\nGoogle wird diese Informationen in unserem Auftrag benutzen, um die Nutzung unseres Onlineangebotes durch die Nutzer auszuwerten, um Reports über die Aktivitäten innerhalb dieses Onlineangebotes zusammenzustellen und um weitere, mit der Nutzung dieses Onlineangebotes und der Internetnutzung verbundene Dienstleistungen, uns gegenüber zu erbringen. Dabei können aus den verarbeiteten Daten pseudonyme Nutzungsprofile der Nutzer erstellt werden." +
      "\nWir setzen Google Analytics nur mit aktivierter IP-Anonymisierung ein. Das bedeutet, die IP-Adresse der Nutzer wird von Google innerhalb von Mitgliedstaaten der Europäischen Union oder in anderen Vertragsstaaten des Abkommens über den Europäischen Wirtschaftsraum gekürzt. Nur in Ausnahmefällen wird die volle IP-Adresse an einen Server von Google in den USA übertragen und dort gekürzt." +
      "\nDie von dem Browser des Nutzers übermittelte IP-Adresse wird nicht mit anderen Daten von Google zusammengeführt. Die Nutzer können die Speicherung der Cookies durch eine entsprechende Einstellung ihrer Browser-Software verhindern; die Nutzer können darüber hinaus die Erfassung der durch das Cookie erzeugten und auf ihre Nutzung des Onlineangebotes bezogenen Daten an Google sowie die Verarbeitung dieser Daten durch Google verhindern, indem sie das unter folgendem Link verfügbare Browser-Plugin herunterladen und installieren: http://tools.google.com/dlpage/gaoptout?hl=de." +
      "\nWeitere Informationen zur Datennutzung durch Google, Einstellungs- und Widerspruchsmöglichkeiten, erfahren Sie in der Datenschutzerklärung von Google (https://policies.google.com/technologies/ads) sowie in den Einstellungen für die Darstellung von Werbeeinblendungen durch Google (https://adssettings.google.com/authenticated)." +
      "\nDie personenbezogenen Daten der Nutzer werden nach 14 Monaten gelöscht oder anonymisiert." +
      "\n\nEinbindung von Diensten und Inhalten Dritter\n" +
      "\nWir setzen innerhalb unseres Onlineangebotes auf Grundlage unserer berechtigten Interessen (d.h. Interesse an der Analyse, Optimierung und wirtschaftlichem Betrieb unseres Onlineangebotes im Sinne des Art. 6 Abs. 1 lit. f. DSGVO) Inhalts- oder Serviceangebote von Drittanbietern ein, um deren Inhalte und Services, wie z.B. Videos oder Schriftarten einzubinden (nachfolgend einheitlich bezeichnet als “Inhalte”)." +
      "\nDies setzt immer voraus, dass die Drittanbieter dieser Inhalte, die IP-Adresse der Nutzer wahrnehmen, da sie ohne die IP-Adresse die Inhalte nicht an deren Browser senden könnten. Die IP-Adresse ist damit für die Darstellung dieser Inhalte erforderlich. Wir bemühen uns nur solche Inhalte zu verwenden, deren jeweilige Anbieter die IP-Adresse lediglich zur Auslieferung der Inhalte verwenden. Drittanbieter können ferner so genannte Pixel-Tags (unsichtbare Grafiken, auch als \"Web Beacons\" bezeichnet) für statistische oder Marketingzwecke verwenden. Durch die \"Pixel-Tags\" können Informationen, wie der Besucherverkehr auf den Seiten dieser Website ausgewertet werden. Die pseudonymen Informationen können ferner in Cookies auf dem Gerät der Nutzer gespeichert werden und unter anderem technische Informationen zum Browser und Betriebssystem, verweisende Webseiten, Besuchszeit sowie weitere Angaben zur Nutzung unseres Onlineangebotes enthalten, als auch mit solchen Informationen aus anderen Quellen verbunden werden." +
      "\n\nGoogle Maps\n" +
      "Wir binden die Landkarten des Dienstes “Google Maps” des Anbieters Google LLC, 1600 Amphitheatre Parkway, Mountain View, CA 94043, USA, ein. Zu den verarbeiteten Daten können insbesondere IP-Adressen und Standortdaten der Nutzer gehören, die jedoch nicht ohne deren Einwilligung (im Regelfall im Rahmen der Einstellungen ihrer Mobilgeräte vollzogen), erhoben werden. Die Daten können in den USA verarbeitet werden. Datenschutzerklärung: https://www.google.com/policies/privacy/, Opt-Out: https://adssettings.google.com/authenticated.";
}
