class PCNCODE {
  String pcnCode;
  String slug;

  PCNCODE({
    this.pcnCode = "",
    this.slug = "",
  });

  static PCNCODE fromMap(Map<String, dynamic> map) {
    var _pcnCode = PCNCODE();
    try {
      _pcnCode.pcnCode = map["pcnCode"] == null ? "" : map['pcnCode'];
      _pcnCode.slug = map["slug"] == null ? "" : map['slug'];
    } catch (err) {
      print(err);
    }
    return _pcnCode;
  }
}
