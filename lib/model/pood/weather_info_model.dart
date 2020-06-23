class WeatherDetailModel {
  String status;
  BasicInfo basic;
  UpdateInfo updateInfo;
  WeatherNowInfo nowInfo;

  WeatherDetailModel({this.basic, this.updateInfo, this.status, this.nowInfo});

  factory WeatherDetailModel.fromJson(Map<String, dynamic> jsonObj) {
    return WeatherDetailModel(
      basic: BasicInfo.fromJson(jsonObj['basic']),
      updateInfo: UpdateInfo.fromJson(jsonObj["update"]),
      status: jsonObj["status"],
      nowInfo: WeatherNowInfo.fromJson(jsonObj["now"]),
    );
  }
}

class BasicInfo {
  String cid;
  String location;
  String parentCity;
  String adminArea;
  String cnty;
  String lat;
  String lon;
  String tz;

  BasicInfo(
      {this.cid,
      this.location,
      this.parentCity,
      this.adminArea,
      this.cnty,
      this.lat,
      this.lon,
      this.tz});

  factory BasicInfo.fromJson(Map<String, dynamic> jsonObj) {
    return BasicInfo(
      cid: jsonObj["cid"],
      location: jsonObj["location"],
      parentCity: jsonObj["parent_city"],
      adminArea: jsonObj["admin_area"],
      cnty: jsonObj["cnty"],
      lat: jsonObj["lat"],
      lon: jsonObj["lon"],
      tz: jsonObj["tz"],
    );
  }
}

class UpdateInfo {
  String loc;
  String utc;

  UpdateInfo({this.loc, this.utc});

  factory UpdateInfo.fromJson(Map<String, dynamic> jsonObj) {
    return UpdateInfo(loc: jsonObj["loc"], utc: jsonObj["utc"]);
  }
}

class WeatherNowInfo {
  String cloud;
  String condCode;
  String condtxt;
  String fl;
  String hum;
  String pcpn;
  String pres;
  String tmp;
  String vis;
  String windDeg;
  String windDir;
  String windSc;
  String windSpd;

  WeatherNowInfo({
    this.cloud,
    this.condCode,
    this.condtxt,
    this.fl,
    this.hum,
    this.pcpn,
    this.pres,
    this.tmp,
    this.vis,
    this.windDeg,
    this.windDir,
    this.windSc,
    this.windSpd,
  });

  factory WeatherNowInfo.fromJson(Map<String, dynamic> jsonObj) {
    return WeatherNowInfo(
      cloud: jsonObj["loc"],
      condCode: jsonObj["cond_code"],
      condtxt: jsonObj["cond_txt"],
      fl: jsonObj["fl"],
      hum: jsonObj["hum"],
      pcpn: jsonObj["pcpn"],
      pres: jsonObj["pres"],
      tmp: jsonObj["tmp"],
      vis: jsonObj["vis"] ,
      windDeg: jsonObj["wind_deg"],
      windDir: jsonObj["wind_dir"],
      windSc: jsonObj["wind_sc"],
      windSpd: jsonObj["wind_spd"],
    );
  }
}
