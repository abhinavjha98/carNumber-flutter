import 'package:carplate/models/carDetails.dart';
import 'package:carplate/models/pcnCode.dart';

class PCNSummary {
  int id;
  List<PCNCODE>? pcnCode;
  List<CarDetails>? carDetails;
  String dateOfCreation;
  String reason;

  PCNSummary({this.id = 0, this.reason = "", this.dateOfCreation = ""});

  static PCNSummary fromMap(Map<String, dynamic> map) {
    var _pcnSummary = PCNSummary();
    try {
      _pcnSummary.id = map["id"] == null ? 0 : map['id'];
      _pcnSummary.dateOfCreation =
          map["dateOfCreation"] == null ? "" : map['dateOfCreation'];
      _pcnSummary.reason = map["reason"] == null ? "" : map['reason'];
      _pcnSummary.pcnCode = map['pcnCode'] == null
          ? ""
          : map["pcnCode"]
              .map<PCNCODE>((e) => PCNCODE.fromMap(e))
              .where((e) => e != null)
              .toList();
      _pcnSummary.carDetails = map['carDetails'] == null
          ? ""
          : map["carDetails"]
              .map<CarDetails>((e) => CarDetails.fromMap(e))
              .where((e) => e != null)
              .toList();
    } catch (err) {
      print(err);
    }
    return _pcnSummary;
  }
}
