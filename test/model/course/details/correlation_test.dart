import 'package:cie_team1/model/course/details/correlation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 correlation', () {
    var correlation = Map<String, dynamic>();
    correlation['organiser'] = "FK 07";
    correlation['curriculum'] = "IF";
    correlation['actions'] = null;
    var correlations = new List<Map<String, dynamic>>();
    correlations.add(correlation);

    var list = CorrelationBuilder.fromJson(correlations);

    expect(list[0].organiser, "FK 07");
    expect(list[0].curriculum, "IF");
    expect(list[0].actions, null);
  });
}
