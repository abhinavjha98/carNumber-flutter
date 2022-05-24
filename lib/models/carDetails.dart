class CarDetails {
  String numberPlate;
  String carModel;
  String carColor;
  String carLocation;
  String carImage;

  CarDetails({
    this.numberPlate = "",
    this.carModel = "",
    this.carColor = "",
    this.carLocation = "",
    this.carImage = "",
  });

  static CarDetails fromMap(Map<String, dynamic> map) {
    var _carDetails = CarDetails();
    try {
      _carDetails.numberPlate =
          map["number_plate"] == null ? "" : map['number_plate'];
      _carDetails.carModel = map["car_model"] == null ? "" : map['car_model'];
      _carDetails.carColor = map["car_color"] == null ? "" : map['car_color'];
      _carDetails.carLocation =
          map["car_location"] == null ? "" : map['car_location'];
      _carDetails.carColor = map["car_image"] == null ? "" : map['car_image'];
    } catch (err) {
      print(err);
    }
    return _carDetails;
  }
}
