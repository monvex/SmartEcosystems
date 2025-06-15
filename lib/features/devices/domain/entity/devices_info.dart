// To parse this JSON data, do
//
//     final devicesInfo = devicesInfoFromJson(jsonString);

import 'dart:convert';

DevicesInfo devicesInfoFromJson(String str) =>
    DevicesInfo.fromJson(json.decode(str));

String devicesInfoToJson(DevicesInfo data) => json.encode(data.toJson());

class DevicesInfo {
  Map<String, DeviceParameter> deviceParameters;
  List<Device> devices;
  String result;

  DevicesInfo({
    required this.deviceParameters,
    required this.devices,
    required this.result,
  });

  factory DevicesInfo.fromJson(Map<String, dynamic> json) => DevicesInfo(
    deviceParameters: Map.from(json["deviceParameters"]).map(
      (k, v) =>
          MapEntry<String, DeviceParameter>(k, DeviceParameter.fromJson(v)),
    ),
    devices: List<Device>.from(json["devices"].map((x) => Device.fromJson(x))),
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "deviceParameters": Map.from(
      deviceParameters,
    ).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "devices": List<dynamic>.from(devices.map((x) => x.toJson())),
    "result": result,
  };
}

class DeviceParameter {
  num chart;
  String color;
  DeviceParameterCreatedAt createdAt;
  num deviceTypeId;
  Icon icon;
  num id;
  String label;
  num? maxLimit;
  num? minLimit;
  num? moduleTypeId;
  String name;
  num? order;
  String shortLabel;
  String units;
  String updatedAt;

  DeviceParameter({
    required this.chart,
    required this.color,
    required this.createdAt,
    required this.deviceTypeId,
    required this.icon,
    required this.id,
    required this.label,
    required this.maxLimit,
    required this.minLimit,
    required this.moduleTypeId,
    required this.name,
    required this.order,
    required this.shortLabel,
    required this.units,
    required this.updatedAt,
  });

  factory DeviceParameter.fromJson(Map<String, dynamic> json) =>
      DeviceParameter(
        chart: json["chart"],
        color: json["color"],
        createdAt: deviceParameterCreatedAtValues.map[json["created_at"]]!,
        deviceTypeId: json["device_type_id"],
        icon: iconValues.map[json["icon"]]!,
        id: json["id"],
        label: json["label"],
        maxLimit: json["max_limit"],
        minLimit: json["min_limit"],
        moduleTypeId: json["module_type_id"],
        name: json["name"],
        order: json["order"],
        shortLabel: json["short_label"],
        units: json["units"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
    "chart": chart,
    "color": color,
    "created_at": deviceParameterCreatedAtValues.reverse[createdAt],
    "device_type_id": deviceTypeId,
    "icon": iconValues.reverse[icon],
    "id": id,
    "label": label,
    "max_limit": maxLimit,
    "min_limit": minLimit,
    "module_type_id": moduleTypeId,
    "name": name,
    "order": order,
    "short_label": shortLabel,
    "units": units,
    "updated_at": updatedAt,
  };
}

enum DeviceParameterCreatedAt {
  FRI_20_OCT_2023100000_GMT,
  FRI_22_SEP_2023100000_GMT,
  MON_29_MAY_2023100000_GMT,
  SAT_05_AUG_2023100000_GMT,
  SAT_06_MAY_2023232301_GMT,
  SAT_21_OCT_2023100000_GMT,
  THU_21_SEP_2023100000_GMT,
  THU_25_MAY_2023100000_GMT,
  TUE_25_JUL_2023100000_GMT,
  TUE_28_FEB_2023220211_GMT,
  WED_03_MAY_2023092829_GMT,
  WED_13_DEC_2023100000_GMT,
}

final deviceParameterCreatedAtValues = EnumValues({
  "Fri, 20 Oct 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.FRI_20_OCT_2023100000_GMT,
  "Fri, 22 Sep 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.FRI_22_SEP_2023100000_GMT,
  "Mon, 29 May 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.MON_29_MAY_2023100000_GMT,
  "Sat, 05 Aug 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.SAT_05_AUG_2023100000_GMT,
  "Sat, 06 May 2023 23:23:01 GMT":
      DeviceParameterCreatedAt.SAT_06_MAY_2023232301_GMT,
  "Sat, 21 Oct 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.SAT_21_OCT_2023100000_GMT,
  "Thu, 21 Sep 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.THU_21_SEP_2023100000_GMT,
  "Thu, 25 May 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.THU_25_MAY_2023100000_GMT,
  "Tue, 25 Jul 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.TUE_25_JUL_2023100000_GMT,
  "Tue, 28 Feb 2023 22:02:11 GMT":
      DeviceParameterCreatedAt.TUE_28_FEB_2023220211_GMT,
  "Wed, 03 May 2023 09:28:29 GMT":
      DeviceParameterCreatedAt.WED_03_MAY_2023092829_GMT,
  "Wed, 13 Dec 2023 10:00:00 GMT":
      DeviceParameterCreatedAt.WED_13_DEC_2023100000_GMT,
});

enum Icon {
  BATT_MID_MIN_SVG,
  EMPTY,
  HUM1_SVG,
  HUM2_SVG,
  HUM3_SVG,
  HUM4_SVG,
  HUM_SVG,
  NOISE_AVG_SVG,
  NOISE_MAX_SVG,
  NOISE_MIN_SVG,
  PRESSURE_SVG,
  RADIATION_SVG,
  RAIN_SPEED_SVG,
  RAIN_SVG,
  SUN_SVG,
  TEMP_SVG,
  WIND_DIRECTION_SVG,
  WIND_SPEED_SVG,
}

final iconValues = EnumValues({
  "batt_mid_min.svg": Icon.BATT_MID_MIN_SVG,
  "": Icon.EMPTY,
  "hum1.svg": Icon.HUM1_SVG,
  "hum2.svg": Icon.HUM2_SVG,
  "hum3.svg": Icon.HUM3_SVG,
  "hum4.svg": Icon.HUM4_SVG,
  "hum.svg": Icon.HUM_SVG,
  "noise_avg.svg": Icon.NOISE_AVG_SVG,
  "noise_max.svg": Icon.NOISE_MAX_SVG,
  "noise_min.svg": Icon.NOISE_MIN_SVG,
  "pressure.svg": Icon.PRESSURE_SVG,
  "radiation.svg": Icon.RADIATION_SVG,
  "rain_speed.svg": Icon.RAIN_SPEED_SVG,
  "rain.svg": Icon.RAIN_SVG,
  "sun.svg": Icon.SUN_SVG,
  "temp.svg": Icon.TEMP_SVG,
  "wind_direction.svg": Icon.WIND_DIRECTION_SVG,
  "wind_speed.svg": Icon.WIND_SPEED_SVG,
});

class Device {
  bool? blocked;
  String? description;
  num deviceId;
  List<DeviceTypeIcon> deviceTypeIcons;
  num deviceTypeId;
  num idDevice;
  num? isAllowDownload;
  num isPublic;
  num? isVerified;
  LastParameterValues lastParameterValues;
  String? lastUpdateDatetime;
  num latitude;
  String locationDescription;
  num longitude;
  num? moduleTypeId;
  String name;
  String? serialNumber;
  num? timeNotOnline;
  num tz;
  String uuid;
  String? droneDescription;
  num? droneId;
  String? droneName;
  num? droneTypeId;

  Device({
    required this.blocked,
    required this.description,
    required this.deviceId,
    required this.deviceTypeIcons,
    required this.deviceTypeId,
    required this.idDevice,
    required this.isAllowDownload,
    required this.isPublic,
    required this.isVerified,
    required this.lastParameterValues,
    required this.lastUpdateDatetime,
    required this.latitude,
    required this.locationDescription,
    required this.longitude,
    required this.moduleTypeId,
    required this.name,
    required this.serialNumber,
    required this.timeNotOnline,
    required this.tz,
    required this.uuid,
    this.droneDescription,
    this.droneId,
    this.droneName,
    this.droneTypeId,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    blocked: json["blocked"],
    description: json["description"],
    deviceId: json["device_id"],
    deviceTypeIcons: List<DeviceTypeIcon>.from(
      json["device_type_icons"].map((x) => DeviceTypeIcon.fromJson(x)),
    ),
    deviceTypeId: json["device_type_id"],
    idDevice: json["id_device"],
    isAllowDownload: json["is_allow_download"],
    isPublic: json["is_public"],
    isVerified: json["is_verified"],
    lastParameterValues: LastParameterValues.fromJson(
      json["last_parameter_values"],
    ),
    lastUpdateDatetime: json["last_update_datetime"],
    latitude: json["latitude"]?.toDouble(),
    locationDescription: json["location_description"],
    longitude: json["longitude"]?.toDouble(),
    moduleTypeId: json["module_type_id"],
    name: json["name"],
    serialNumber: json["serial_number"],
    timeNotOnline: json["time_not_online"],
    tz: json["tz"],
    uuid: json["uuid"],
    droneDescription: json["drone_description"],
    droneId: json["drone_id"],
    droneName: json["drone_name"],
    droneTypeId: json["drone_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "blocked": blocked,
    "description": description,
    "device_id": deviceId,
    "device_type_icons": List<dynamic>.from(
      deviceTypeIcons.map((x) => x.toJson()),
    ),
    "device_type_id": deviceTypeId,
    "id_device": idDevice,
    "is_allow_download": isAllowDownload,
    "is_public": isPublic,
    "is_verified": isVerified,
    "last_parameter_values": lastParameterValues.toJson(),
    "last_update_datetime": lastUpdateDatetime,
    "latitude": latitude,
    "location_description": locationDescription,
    "longitude": longitude,
    "module_type_id": moduleTypeId,
    "name": name,
    "serial_number": serialNumber,
    "time_not_online": timeNotOnline,
    "tz": tz,
    "uuid": uuid,
    "drone_description": droneDescription,
    "drone_id": droneId,
    "drone_name": droneName,
    "drone_type_id": droneTypeId,
  };
}

class DeviceTypeIcon {
  num? conditionMaxValue;
  num conditionMinValue;
  DeviceTypeIconCreatedAt createdAt;
  num deviceParameterId;
  num deviceTypeId;
  IconFile iconFile;
  num id;
  dynamic moduleTypeId;
  UpdatedAt updatedAt;

  DeviceTypeIcon({
    required this.conditionMaxValue,
    required this.conditionMinValue,
    required this.createdAt,
    required this.deviceParameterId,
    required this.deviceTypeId,
    required this.iconFile,
    required this.id,
    required this.moduleTypeId,
    required this.updatedAt,
  });

  factory DeviceTypeIcon.fromJson(Map<String, dynamic> json) => DeviceTypeIcon(
    conditionMaxValue: json["condition_max_value"],
    conditionMinValue: json["condition_min_value"],
    createdAt: deviceTypeIconCreatedAtValues.map[json["created_at"]]!,
    deviceParameterId: json["device_parameter_id"],
    deviceTypeId: json["device_type_id"],
    iconFile: iconFileValues.map[json["icon_file"]]!,
    id: json["id"],
    moduleTypeId: json["module_type_id"],
    updatedAt: updatedAtValues.map[json["updated_at"]]!,
  );

  Map<String, dynamic> toJson() => {
    "condition_max_value": conditionMaxValue,
    "condition_min_value": conditionMinValue,
    "created_at": deviceTypeIconCreatedAtValues.reverse[createdAt],
    "device_parameter_id": deviceParameterId,
    "device_type_id": deviceTypeId,
    "icon_file": iconFileValues.reverse[iconFile],
    "id": id,
    "module_type_id": moduleTypeId,
    "updated_at": updatedAtValues.reverse[updatedAt],
  };
}

enum DeviceTypeIconCreatedAt {
  FRI_26_MAY_2023094925_GMT,
  FRI_26_MAY_2023095019_GMT,
  THU_25_MAY_2023103026_GMT,
  THU_25_MAY_2023103107_GMT,
  THU_25_MAY_2023125417_GMT,
  THU_25_MAY_2023125439_GMT,
  THU_25_MAY_2023125725_GMT,
  THU_25_MAY_2023131703_GMT,
  THU_25_MAY_2023170616_GMT,
  THU_25_MAY_2023170654_GMT,
  THU_25_MAY_2023184729_GMT,
}

final deviceTypeIconCreatedAtValues = EnumValues({
  "Fri, 26 May 2023 09:49:25 GMT":
      DeviceTypeIconCreatedAt.FRI_26_MAY_2023094925_GMT,
  "Fri, 26 May 2023 09:50:19 GMT":
      DeviceTypeIconCreatedAt.FRI_26_MAY_2023095019_GMT,
  "Thu, 25 May 2023 10:30:26 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023103026_GMT,
  "Thu, 25 May 2023 10:31:07 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023103107_GMT,
  "Thu, 25 May 2023 12:54:17 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023125417_GMT,
  "Thu, 25 May 2023 12:54:39 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023125439_GMT,
  "Thu, 25 May 2023 12:57:25 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023125725_GMT,
  "Thu, 25 May 2023 13:17:03 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023131703_GMT,
  "Thu, 25 May 2023 17:06:16 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023170616_GMT,
  "Thu, 25 May 2023 17:06:54 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023170654_GMT,
  "Thu, 25 May 2023 18:47:29 GMT":
      DeviceTypeIconCreatedAt.THU_25_MAY_2023184729_GMT,
});

enum IconFile {
  CLOUDS_BIGRAIN_SVG,
  CLOUDS_SVG,
  FULL_SUN_SVG,
  NIGHT_SVG,
  RAIN_SVG,
  SUN_WITH_CLOUDS_SVG,
}

final iconFileValues = EnumValues({
  "clouds_bigrain.svg": IconFile.CLOUDS_BIGRAIN_SVG,
  "clouds.svg": IconFile.CLOUDS_SVG,
  "full_sun.svg": IconFile.FULL_SUN_SVG,
  "night.svg": IconFile.NIGHT_SVG,
  "rain.svg": IconFile.RAIN_SVG,
  "sun_with_clouds.svg": IconFile.SUN_WITH_CLOUDS_SVG,
});

enum UpdatedAt {
  FRI_26_MAY_2023094942_GMT,
  FRI_26_MAY_2023095003_GMT,
  FRI_26_MAY_2023095019_GMT,
  MON_12_JUN_2023000351_GMT,
  THU_25_MAY_2023131703_GMT,
  THU_25_MAY_2023170616_GMT,
  THU_25_MAY_2023222917_GMT,
  THU_25_MAY_2023223001_GMT,
  WED_31_MAY_2023121634_GMT,
  WED_31_MAY_2023121726_GMT,
  WED_31_MAY_2023121735_GMT,
}

final updatedAtValues = EnumValues({
  "Fri, 26 May 2023 09:49:42 GMT": UpdatedAt.FRI_26_MAY_2023094942_GMT,
  "Fri, 26 May 2023 09:50:03 GMT": UpdatedAt.FRI_26_MAY_2023095003_GMT,
  "Fri, 26 May 2023 09:50:19 GMT": UpdatedAt.FRI_26_MAY_2023095019_GMT,
  "Mon, 12 Jun 2023 00:03:51 GMT": UpdatedAt.MON_12_JUN_2023000351_GMT,
  "Thu, 25 May 2023 13:17:03 GMT": UpdatedAt.THU_25_MAY_2023131703_GMT,
  "Thu, 25 May 2023 17:06:16 GMT": UpdatedAt.THU_25_MAY_2023170616_GMT,
  "Thu, 25 May 2023 22:29:17 GMT": UpdatedAt.THU_25_MAY_2023222917_GMT,
  "Thu, 25 May 2023 22:30:01 GMT": UpdatedAt.THU_25_MAY_2023223001_GMT,
  "Wed, 31 May 2023 12:16:34 GMT": UpdatedAt.WED_31_MAY_2023121634_GMT,
  "Wed, 31 May 2023 12:17:26 GMT": UpdatedAt.WED_31_MAY_2023121726_GMT,
  "Wed, 31 May 2023 12:17:35 GMT": UpdatedAt.WED_31_MAY_2023121735_GMT,
});

class LastParameterValues {
  DateTime? createdAt;
  num? id;
  num? msGustWindir;
  num? msGustWinspeed;
  num? msWinddir;
  num? msWindspeed;
  num? msbar;
  num? mshum;
  num? msid;
  num? mstemp;
  DateTime? mstime;
  DateTime? updatedAt;
  dynamic alb;
  num? battV24;
  num? battVolt;
  num? cnr1T;
  num? cnrHeatOn;
  num? deviceId;
  num? hfpHeatMv1;
  num? hfpHeatMv2;
  num? hfpHeatMv3;
  num? hfpHeatOn;
  num? lwinMeas;
  num? lwoutMeas;
  num? p;
  num? pa;
  num? ppfdinHol;
  num? ppfdinRid;
  num? ppfdoutHol;
  num? ppfdoutRid;
  num? ptemp;
  num? rhHol;
  num? rhRid;
  num? rn;
  num? rnLiteRid;
  num? shfCor1;
  num? shfCor2;
  num? shfCor3;
  num? shfRef1;
  num? shfRef2;
  num? shfRef3;
  num? stp102;
  num? stp105;
  num? stp110;
  num? stp120;
  num? stp150;
  num? stp202;
  num? stp205;
  num? stp210;
  num? stp220;
  num? stp250;
  num? stp302;
  num? stp305;
  num? stp310;
  num? stp320;
  dynamic stp350;
  num? stp402;
  num? stp405;
  num? stp410;
  num? stp420;
  dynamic stp450;
  num? stpHeatMv1;
  num? stpHeatMv2;
  num? stpHeatMv3;
  num? stpHeatMv4;
  num? stpHeatOn;
  num? stpHeatQ1;
  num? stpHeatQ2;
  num? stpHeatQ3;
  num? stpHeatQ4;
  num? swin;
  num? swout;
  num? taHol;
  num? taRid;
  num? tsoilAv1;
  num? tsoilAv2;
  dynamic waterAboveSensor;
  num? wd10M;
  num? wd2M;
  num? ws10M;
  num? ws2M;
  dynamic wtd;
  dynamic horizontalVisibility;
  num? humidity;
  dynamic maxTemperature;
  num? pressure;
  dynamic rain;
  num? temperature;
  dynamic totalCloudScore;
  String? winddirection;
  num? windspeed;
  num? coAvg;
  num? coMax;
  num? coMin;
  num? dbAvg;
  num? dbMax;
  num? dbMin;
  dynamic gsmStatus;
  num? hum;
  num? humMax;
  num? humMin;
  num? moduleId;
  num? nh3Avg;
  num? nh3Max;
  num? nh3Min;
  num? no2Avg;
  num? no2Max;
  num? no2Min;
  num? pm1;
  num? pm10;
  num? pm10Max;
  num? pm10Min;
  num? pm1Max;
  num? pm1Min;
  num? pm25;
  num? pm25Max;
  num? pm25Min;
  num? pressureMax;
  num? pressureMin;
  num? radAmoundImpulse;
  num? radAvg10;
  num? radAvg2;
  num? spectr125Hz;
  num? spectr1Khz;
  num? spectr250Hz;
  num? spectr2Khz;
  num? spectr31Hz;
  num? spectr4Khz;
  num? spectr500Hz;
  num? spectr63Hz;
  num? spectr8Khz;
  num? temp;
  num? tempMax;
  num? tempMin;
  num? voltage;
  dynamic voltageBattery;
  num? voltageMax;
  num? voltageMin;
  num? ang1;
  num? ang2;
  num? evs;
  num? hm;
  num? ks;
  num? l;
  num? li;
  num? pr;
  num? pr1;
  num? rssi;
  num? t;
  num? td;
  num? tr;
  num? upow;
  num? uv;
  num? uvi;
  num? wd;
  num? wm;
  num? wv;
  num? wv2;
  num? valueE;
  num? valueN;
  num? valueZ;
  num? airHum;
  num? airPressure;
  num? airTemp;
  num? bsId;
  dynamic gpsAltitude;
  dynamic gpsLatitude;
  dynamic gpsLongitude;
  dynamic status;
  num? voltage2;
  num? rainAmount;
  dynamic rainClicks15Minutes;
  dynamic rainClicks1Hour;
  dynamic rainClicks24Hours;
  num? rainClicksMonth;
  dynamic rainClicksThisStorm;
  dynamic rainClicksToday;
  num? rainClicksYear;
  num? rainHighRate;
  num? mq135;
  num? mq2;
  num? mq4;
  num? mq9;
  String? loraStatus;
  num? uvSens;
  num? vin;
  num? winddir;
  num? winddirAvg10Min;
  num? winddirMax3H;
  num? windspeedAvg10Min;
  num? windspeedMax3H;
  num? hm1;
  num? hm2;
  num? rad1;
  num? rad2;
  num? temperature1;
  num? temperature2;
  num? height;
  num? soilHum;
  num? soilTemp;
  num? soilTemp2;
  num? soilTemp3;
  String? description;
  String? filename;
  String? type;
  num? solarRad;
  dynamic solarRadHigh;
  num? uvIndex;
  dynamic uvIndexHigh;
  num? as7263610;
  num? as7263680;
  num? as7263730;
  num? as7263760;
  num? as7263810;
  num? as7263860;
  num? as7341415;
  num? as7341445;
  num? as7341480;
  num? as7341515;
  num? as7341555;
  num? as7341590;
  num? as7341630;
  num? as7341680;
  num? as7341Clear;
  num? as7341Nearir;
  num? humWood;
  dynamic isR;
  dynamic isS;
  dynamic isT;
  dynamic isTemp;
  dynamic isU;
  dynamic isV;
  dynamic isW;
  num? mlx90640Avg;
  num? mlx90640Max;
  num? mlx90640Min;
  num? ndvi;
  num? thickWood;
  num? trunkTemp;
  dynamic vsBlue;
  dynamic vsGreen;
  dynamic vsOrange;
  dynamic vsRed;
  dynamic vsTemp;
  dynamic vsViolet;
  dynamic vsYellow;
  dynamic f415;
  dynamic f445;
  dynamic f480;
  dynamic f515;
  dynamic f555;
  num? f590;
  num? f610;
  num? f630;
  num? f680;
  num? f730;
  num? f760;
  num? f810;
  num? f860;
  num? fClear;
  num? fNir;
  num? soil7Con;
  num? soil7Hum;
  num? soil7Nit;
  num? soil7Ph;
  num? soil7Phos;
  num? soil7Pot;
  num? soil7Temp;
  num? allObjects;
  num? avgSpeed;
  num? busObjects;
  num? carObjects;
  num? motorcycleObjects;
  num? peopleObjects;
  num? pollutionCh4;
  num? pollutionCo2;
  num? pollutionN2O;
  String? speeds;
  num? truckObjects;
  num? ccs811Bsln;
  num? ccs811Co2;
  num? ccs811Tvoc;
  num? miscCo;
  num? miscNh3;
  num? miscNo2;
  num? mq136;
  num? mq137;
  dynamic pulseDataV2ZDL;
  num? absoluteLimitsHf;
  num? airDensity;
  num? airHeatCapacity;
  num? airMolarVolume;
  num? airTemperature;
  num? amplitudeResolutionHf;
  num? attackAngleHf;
  num? auxInLi7200;
  num? avgSignalStrength7200Mean;
  num? badAuxTc1Li7700;
  num? badAuxTc2Li7700;
  num? badAuxTc3Li7700;
  num? badTempLi7700;
  num? blockTempUnregulatedLi7700;
  num? bottomHeaterOnLi7700;
  num? bowenRatio;
  num? boxConnectedLi7700;
  num? calibratingLi7700;
  num? ch4DefTimelag;
  num? ch4Flux;
  num? ch4MixingRatio;
  num? ch4MolarDensity;
  num? ch4MoleFraction;
  num? ch4Scf;
  num? ch4Spikes;
  dynamic ch4Strg;
  num? ch4TimeLag;
  num? ch4VAdv;
  num? ch4Var;
  num? chk;
  num? chopperLi7200;
  dynamic chopperLi7500;
  num? co2DefTimelag;
  num? co2Flux;
  num? co2Mean;
  num? co2MixingRatio;
  num? co2MolarDensity;
  num? co2MoleFraction;
  num? co2Scf;
  num? co2SignalStrength7200Mean;
  num? co2Spikes;
  dynamic co2Strg;
  num? co2TimeLag;
  num? co2VAdv;
  num? co2Var;
  num? daytime;
  num? deltaPLi7200;
  num? deltaSignalStrength7200Mean;
  num? detectorLi7200;
  dynamic detectorLi7500;
  num? dewPointMean;
  num? discontinuitiesHf;
  num? discontinuitiesSf;
  num? doy;
  num? dropOutHf;
  num? e;
  num? es;
  num? et;
  num? fileRecords;
  num? flowrateMean;
  num? h;
  num? h2ODefTimelag;
  num? h2OFlux;
  num? h2OMean;
  num? h2OMixingRatio;
  num? h2OMolarDensity;
  num? h2OMoleFraction;
  num? h2OScf;
  num? h2OSignalStrength7200Mean;
  num? h2OSpikes;
  dynamic h2OStrg;
  num? h2OTimeLag;
  num? h2OVAdv;
  num? h2OVar;
  num? hScf;
  dynamic hStrg;
  num? headDetectLi7200;
  num? hitPowerMean;
  num? hitVinMean;
  num? laserTempUnregulatedLi7700;
  num? le;
  num? leScf;
  dynamic leStrg;
  num? maxWindSpeed;
  dynamic meanValueLi7500;
  num? meanValueRssiLi7200;
  num? model;
  num? motorFailureLi7700;
  num? motorSpinningLi7700;
  num? noSignalLi7700;
  num? nonSteadyWindHf;
  num? noneDefTimelag;
  dynamic noneFlux;
  dynamic noneMixingRatio;
  dynamic noneMolarDensity;
  dynamic noneMoleFraction;
  dynamic noneSpikes;
  dynamic noneStrg;
  dynamic noneTimeLag;
  dynamic noneVAdv;
  dynamic noneVar;
  num? notReadyLi7700;
  num? pitch;
  num? pllLi7200;
  dynamic pllLi7500;
  num? pumpOnLi7700;
  num? qcCh4Flux;
  num? qcCo2Flux;
  num? qcH;
  num? qcH2OFlux;
  num? qcLe;
  dynamic qcNoneFlux;
  num? qcTau;
  dynamic randErrCh4Flux;
  dynamic randErrCo2Flux;
  dynamic randErrH;
  dynamic randErrH2OFlux;
  dynamic randErrLe;
  dynamic randErrNoneFlux;
  dynamic randErrTau;
  num? reUnlockedLi7700;
  num? rh;
  dynamic roll;
  num? skewnessKurtosisHf;
  num? skewnessKurtosisSf;
  num? sonicTemperature;
  num? specificHumidity;
  num? spikesHf;
  num? syncLi7200;
  dynamic syncLi7500;
  num? lastParameterValuesT;
  num? tInLi7200;
  num? tOutLi7200;
  num? tau;
  num? tauScf;
  num? tdew;
  num? timelagHf;
  num? timelagSf;
  num? tke;
  num? topHeaterOnLi7700;
  num? tsMean;
  num? tsSpikes;
  num? tsVar;
  num? u;
  num? uMean;
  num? uRot;
  num? uSpikes;
  num? uUnrot;
  num? uVar;
  num? unCh4Flux;
  num? unCo2Flux;
  num? unH;
  num? unH2OFlux;
  num? unLe;
  dynamic unNoneFlux;
  dynamic unNoneScf;
  num? unTau;
  num? usedRecords;
  num? vMean;
  num? vRot;
  num? vSpikes;
  num? vUnrot;
  num? vVar;
  num? vinSfMean;
  num? vpd;
  num? wCh4Cov;
  num? wCo2Cov;
  num? wH2OCov;
  num? wMean;
  dynamic wNoneCov;
  num? wRot;
  num? wSpikes;
  num? wTsCov;
  num? wUnrot;
  num? wVar;
  num? waterVaporDensity;
  num? windDir;
  num? windSpeed;
  num? x10;
  num? x30;
  num? x50;
  num? x70;
  num? x90;
  num? xOffset;
  num? xPeak;
  num? yaw;
  dynamic pulseDataZDL;

  LastParameterValues({
    this.createdAt,
    this.id,
    this.msGustWindir,
    this.msGustWinspeed,
    this.msWinddir,
    this.msWindspeed,
    this.msbar,
    this.mshum,
    this.msid,
    this.mstemp,
    this.mstime,
    this.updatedAt,
    this.alb,
    this.battV24,
    this.battVolt,
    this.cnr1T,
    this.cnrHeatOn,
    this.deviceId,
    this.hfpHeatMv1,
    this.hfpHeatMv2,
    this.hfpHeatMv3,
    this.hfpHeatOn,
    this.lwinMeas,
    this.lwoutMeas,
    this.p,
    this.pa,
    this.ppfdinHol,
    this.ppfdinRid,
    this.ppfdoutHol,
    this.ppfdoutRid,
    this.ptemp,
    this.rhHol,
    this.rhRid,
    this.rn,
    this.rnLiteRid,
    this.shfCor1,
    this.shfCor2,
    this.shfCor3,
    this.shfRef1,
    this.shfRef2,
    this.shfRef3,
    this.stp102,
    this.stp105,
    this.stp110,
    this.stp120,
    this.stp150,
    this.stp202,
    this.stp205,
    this.stp210,
    this.stp220,
    this.stp250,
    this.stp302,
    this.stp305,
    this.stp310,
    this.stp320,
    this.stp350,
    this.stp402,
    this.stp405,
    this.stp410,
    this.stp420,
    this.stp450,
    this.stpHeatMv1,
    this.stpHeatMv2,
    this.stpHeatMv3,
    this.stpHeatMv4,
    this.stpHeatOn,
    this.stpHeatQ1,
    this.stpHeatQ2,
    this.stpHeatQ3,
    this.stpHeatQ4,
    this.swin,
    this.swout,
    this.taHol,
    this.taRid,
    this.tsoilAv1,
    this.tsoilAv2,
    this.waterAboveSensor,
    this.wd10M,
    this.wd2M,
    this.ws10M,
    this.ws2M,
    this.wtd,
    this.horizontalVisibility,
    this.humidity,
    this.maxTemperature,
    this.pressure,
    this.rain,
    this.temperature,
    this.totalCloudScore,
    this.winddirection,
    this.windspeed,
    this.coAvg,
    this.coMax,
    this.coMin,
    this.dbAvg,
    this.dbMax,
    this.dbMin,
    this.gsmStatus,
    this.hum,
    this.humMax,
    this.humMin,
    this.moduleId,
    this.nh3Avg,
    this.nh3Max,
    this.nh3Min,
    this.no2Avg,
    this.no2Max,
    this.no2Min,
    this.pm1,
    this.pm10,
    this.pm10Max,
    this.pm10Min,
    this.pm1Max,
    this.pm1Min,
    this.pm25,
    this.pm25Max,
    this.pm25Min,
    this.pressureMax,
    this.pressureMin,
    this.radAmoundImpulse,
    this.radAvg10,
    this.radAvg2,
    this.spectr125Hz,
    this.spectr1Khz,
    this.spectr250Hz,
    this.spectr2Khz,
    this.spectr31Hz,
    this.spectr4Khz,
    this.spectr500Hz,
    this.spectr63Hz,
    this.spectr8Khz,
    this.temp,
    this.tempMax,
    this.tempMin,
    this.voltage,
    this.voltageBattery,
    this.voltageMax,
    this.voltageMin,
    this.ang1,
    this.ang2,
    this.evs,
    this.hm,
    this.ks,
    this.l,
    this.li,
    this.pr,
    this.pr1,
    this.rssi,
    this.t,
    this.td,
    this.tr,
    this.upow,
    this.uv,
    this.uvi,
    this.wd,
    this.wm,
    this.wv,
    this.wv2,
    this.valueE,
    this.valueN,
    this.valueZ,
    this.airHum,
    this.airPressure,
    this.airTemp,
    this.bsId,
    this.gpsAltitude,
    this.gpsLatitude,
    this.gpsLongitude,
    this.status,
    this.voltage2,
    this.rainAmount,
    this.rainClicks15Minutes,
    this.rainClicks1Hour,
    this.rainClicks24Hours,
    this.rainClicksMonth,
    this.rainClicksThisStorm,
    this.rainClicksToday,
    this.rainClicksYear,
    this.rainHighRate,
    this.mq135,
    this.mq2,
    this.mq4,
    this.mq9,
    this.loraStatus,
    this.uvSens,
    this.vin,
    this.winddir,
    this.winddirAvg10Min,
    this.winddirMax3H,
    this.windspeedAvg10Min,
    this.windspeedMax3H,
    this.hm1,
    this.hm2,
    this.rad1,
    this.rad2,
    this.temperature1,
    this.temperature2,
    this.height,
    this.soilHum,
    this.soilTemp,
    this.soilTemp2,
    this.soilTemp3,
    this.description,
    this.filename,
    this.type,
    this.solarRad,
    this.solarRadHigh,
    this.uvIndex,
    this.uvIndexHigh,
    this.as7263610,
    this.as7263680,
    this.as7263730,
    this.as7263760,
    this.as7263810,
    this.as7263860,
    this.as7341415,
    this.as7341445,
    this.as7341480,
    this.as7341515,
    this.as7341555,
    this.as7341590,
    this.as7341630,
    this.as7341680,
    this.as7341Clear,
    this.as7341Nearir,
    this.humWood,
    this.isR,
    this.isS,
    this.isT,
    this.isTemp,
    this.isU,
    this.isV,
    this.isW,
    this.mlx90640Avg,
    this.mlx90640Max,
    this.mlx90640Min,
    this.ndvi,
    this.thickWood,
    this.trunkTemp,
    this.vsBlue,
    this.vsGreen,
    this.vsOrange,
    this.vsRed,
    this.vsTemp,
    this.vsViolet,
    this.vsYellow,
    this.f415,
    this.f445,
    this.f480,
    this.f515,
    this.f555,
    this.f590,
    this.f610,
    this.f630,
    this.f680,
    this.f730,
    this.f760,
    this.f810,
    this.f860,
    this.fClear,
    this.fNir,
    this.soil7Con,
    this.soil7Hum,
    this.soil7Nit,
    this.soil7Ph,
    this.soil7Phos,
    this.soil7Pot,
    this.soil7Temp,
    this.allObjects,
    this.avgSpeed,
    this.busObjects,
    this.carObjects,
    this.motorcycleObjects,
    this.peopleObjects,
    this.pollutionCh4,
    this.pollutionCo2,
    this.pollutionN2O,
    this.speeds,
    this.truckObjects,
    this.ccs811Bsln,
    this.ccs811Co2,
    this.ccs811Tvoc,
    this.miscCo,
    this.miscNh3,
    this.miscNo2,
    this.mq136,
    this.mq137,
    this.pulseDataV2ZDL,
    this.absoluteLimitsHf,
    this.airDensity,
    this.airHeatCapacity,
    this.airMolarVolume,
    this.airTemperature,
    this.amplitudeResolutionHf,
    this.attackAngleHf,
    this.auxInLi7200,
    this.avgSignalStrength7200Mean,
    this.badAuxTc1Li7700,
    this.badAuxTc2Li7700,
    this.badAuxTc3Li7700,
    this.badTempLi7700,
    this.blockTempUnregulatedLi7700,
    this.bottomHeaterOnLi7700,
    this.bowenRatio,
    this.boxConnectedLi7700,
    this.calibratingLi7700,
    this.ch4DefTimelag,
    this.ch4Flux,
    this.ch4MixingRatio,
    this.ch4MolarDensity,
    this.ch4MoleFraction,
    this.ch4Scf,
    this.ch4Spikes,
    this.ch4Strg,
    this.ch4TimeLag,
    this.ch4VAdv,
    this.ch4Var,
    this.chk,
    this.chopperLi7200,
    this.chopperLi7500,
    this.co2DefTimelag,
    this.co2Flux,
    this.co2Mean,
    this.co2MixingRatio,
    this.co2MolarDensity,
    this.co2MoleFraction,
    this.co2Scf,
    this.co2SignalStrength7200Mean,
    this.co2Spikes,
    this.co2Strg,
    this.co2TimeLag,
    this.co2VAdv,
    this.co2Var,
    this.daytime,
    this.deltaPLi7200,
    this.deltaSignalStrength7200Mean,
    this.detectorLi7200,
    this.detectorLi7500,
    this.dewPointMean,
    this.discontinuitiesHf,
    this.discontinuitiesSf,
    this.doy,
    this.dropOutHf,
    this.e,
    this.es,
    this.et,
    this.fileRecords,
    this.flowrateMean,
    this.h,
    this.h2ODefTimelag,
    this.h2OFlux,
    this.h2OMean,
    this.h2OMixingRatio,
    this.h2OMolarDensity,
    this.h2OMoleFraction,
    this.h2OScf,
    this.h2OSignalStrength7200Mean,
    this.h2OSpikes,
    this.h2OStrg,
    this.h2OTimeLag,
    this.h2OVAdv,
    this.h2OVar,
    this.hScf,
    this.hStrg,
    this.headDetectLi7200,
    this.hitPowerMean,
    this.hitVinMean,
    this.laserTempUnregulatedLi7700,
    this.le,
    this.leScf,
    this.leStrg,
    this.maxWindSpeed,
    this.meanValueLi7500,
    this.meanValueRssiLi7200,
    this.model,
    this.motorFailureLi7700,
    this.motorSpinningLi7700,
    this.noSignalLi7700,
    this.nonSteadyWindHf,
    this.noneDefTimelag,
    this.noneFlux,
    this.noneMixingRatio,
    this.noneMolarDensity,
    this.noneMoleFraction,
    this.noneSpikes,
    this.noneStrg,
    this.noneTimeLag,
    this.noneVAdv,
    this.noneVar,
    this.notReadyLi7700,
    this.pitch,
    this.pllLi7200,
    this.pllLi7500,
    this.pumpOnLi7700,
    this.qcCh4Flux,
    this.qcCo2Flux,
    this.qcH,
    this.qcH2OFlux,
    this.qcLe,
    this.qcNoneFlux,
    this.qcTau,
    this.randErrCh4Flux,
    this.randErrCo2Flux,
    this.randErrH,
    this.randErrH2OFlux,
    this.randErrLe,
    this.randErrNoneFlux,
    this.randErrTau,
    this.reUnlockedLi7700,
    this.rh,
    this.roll,
    this.skewnessKurtosisHf,
    this.skewnessKurtosisSf,
    this.sonicTemperature,
    this.specificHumidity,
    this.spikesHf,
    this.syncLi7200,
    this.syncLi7500,
    this.lastParameterValuesT,
    this.tInLi7200,
    this.tOutLi7200,
    this.tau,
    this.tauScf,
    this.tdew,
    this.timelagHf,
    this.timelagSf,
    this.tke,
    this.topHeaterOnLi7700,
    this.tsMean,
    this.tsSpikes,
    this.tsVar,
    this.u,
    this.uMean,
    this.uRot,
    this.uSpikes,
    this.uUnrot,
    this.uVar,
    this.unCh4Flux,
    this.unCo2Flux,
    this.unH,
    this.unH2OFlux,
    this.unLe,
    this.unNoneFlux,
    this.unNoneScf,
    this.unTau,
    this.usedRecords,
    this.vMean,
    this.vRot,
    this.vSpikes,
    this.vUnrot,
    this.vVar,
    this.vinSfMean,
    this.vpd,
    this.wCh4Cov,
    this.wCo2Cov,
    this.wH2OCov,
    this.wMean,
    this.wNoneCov,
    this.wRot,
    this.wSpikes,
    this.wTsCov,
    this.wUnrot,
    this.wVar,
    this.waterVaporDensity,
    this.windDir,
    this.windSpeed,
    this.x10,
    this.x30,
    this.x50,
    this.x70,
    this.x90,
    this.xOffset,
    this.xPeak,
    this.yaw,
    this.pulseDataZDL,
  });

  factory LastParameterValues.fromJson(
    Map<String, dynamic> json,
  ) => LastParameterValues(
    createdAt:
        json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    msGustWindir: json["ms_gust_windir"],
    msGustWinspeed: json["ms_gust_winspeed"]?.toDouble(),
    msWinddir: json["ms_winddir"],
    msWindspeed: json["ms_windspeed"]?.toDouble(),
    msbar: json["msbar"],
    mshum: json["mshum"],
    msid: json["msid"],
    mstemp: json["mstemp"]?.toDouble(),
    mstime: json["mstime"] == null ? null : DateTime.parse(json["mstime"]),
    updatedAt:
        json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    alb: json["alb"],
    battV24: json["batt_v24"]?.toDouble(),
    battVolt: json["batt_volt"]?.toDouble(),
    cnr1T: json["cnr1_t"]?.toDouble(),
    cnrHeatOn: json["cnr_heat_on"],
    deviceId: json["device_id"],
    hfpHeatMv1: json["hfp_heat_mv_1"]?.toDouble(),
    hfpHeatMv2: json["hfp_heat_mv_2"]?.toDouble(),
    hfpHeatMv3: json["hfp_heat_mv_3"]?.toDouble(),
    hfpHeatOn: json["hfp_heat_on"],
    lwinMeas: json["lwin_meas"]?.toDouble(),
    lwoutMeas: json["lwout_meas"]?.toDouble(),
    p: json["p"],
    pa: json["pa"]?.toDouble(),
    ppfdinHol: json["ppfdin_hol"],
    ppfdinRid: json["ppfdin_rid"],
    ppfdoutHol: json["ppfdout_hol"],
    ppfdoutRid: json["ppfdout_rid"],
    ptemp: json["ptemp"]?.toDouble(),
    rhHol: json["rh_hol"]?.toDouble(),
    rhRid: json["rh_rid"]?.toDouble(),
    rn: json["rn"]?.toDouble(),
    rnLiteRid: json["rn_lite_rid"]?.toDouble(),
    shfCor1: json["shf_cor_1"]?.toDouble(),
    shfCor2: json["shf_cor_2"]?.toDouble(),
    shfCor3: json["shf_cor_3"]?.toDouble(),
    shfRef1: json["shf_ref_1"]?.toDouble(),
    shfRef2: json["shf_ref_2"]?.toDouble(),
    shfRef3: json["shf_ref_3"]?.toDouble(),
    stp102: json["stp_1_02"]?.toDouble(),
    stp105: json["stp_1_05"]?.toDouble(),
    stp110: json["stp_1_10"]?.toDouble(),
    stp120: json["stp_1_20"]?.toDouble(),
    stp150: json["stp_1_50"]?.toDouble(),
    stp202: json["stp_2_02"]?.toDouble(),
    stp205: json["stp_2_05"]?.toDouble(),
    stp210: json["stp_2_10"]?.toDouble(),
    stp220: json["stp_2_20"]?.toDouble(),
    stp250: json["stp_2_50"]?.toDouble(),
    stp302: json["stp_3_02"]?.toDouble(),
    stp305: json["stp_3_05"]?.toDouble(),
    stp310: json["stp_3_10"]?.toDouble(),
    stp320: json["stp_3_20"]?.toDouble(),
    stp350: json["stp_3_50"],
    stp402: json["stp_4_02"]?.toDouble(),
    stp405: json["stp_4_05"]?.toDouble(),
    stp410: json["stp_4_10"]?.toDouble(),
    stp420: json["stp_4_20"]?.toDouble(),
    stp450: json["stp_4_50"],
    stpHeatMv1: json["stp_heat_mv_1"]?.toDouble(),
    stpHeatMv2: json["stp_heat_mv_2"]?.toDouble(),
    stpHeatMv3: json["stp_heat_mv_3"]?.toDouble(),
    stpHeatMv4: json["stp_heat_mv_4"]?.toDouble(),
    stpHeatOn: json["stp_heat_on"],
    stpHeatQ1: json["stp_heat_q_1"],
    stpHeatQ2: json["stp_heat_q_2"],
    stpHeatQ3: json["stp_heat_q_3"]?.toDouble(),
    stpHeatQ4: json["stp_heat_q_4"]?.toDouble(),
    swin: json["swin"]?.toDouble(),
    swout: json["swout"],
    taHol: json["ta_hol"]?.toDouble(),
    taRid: json["ta_rid"]?.toDouble(),
    tsoilAv1: json["tsoil_av_1"]?.toDouble(),
    tsoilAv2: json["tsoil_av_2"]?.toDouble(),
    waterAboveSensor: json["water_above_sensor"],
    wd10M: json["wd_10m"]?.toDouble(),
    wd2M: json["wd_2m"]?.toDouble(),
    ws10M: json["ws_10m"]?.toDouble(),
    ws2M: json["ws_2m"]?.toDouble(),
    wtd: json["wtd"],
    horizontalVisibility: json["horizontal_visibility"],
    humidity: json["humidity"],
    maxTemperature: json["max_temperature"],
    pressure: json["pressure"]?.toDouble(),
    rain: json["rain"],
    temperature: json["temperature"]?.toDouble(),
    totalCloudScore: json["total_cloud_score"],
    winddirection: json["winddirection"],
    windspeed: json["windspeed"]?.toDouble(),
    coAvg: json["co_avg"]?.toDouble(),
    coMax: json["co_max"]?.toDouble(),
    coMin: json["co_min"]?.toDouble(),
    dbAvg: json["db_avg"]?.toDouble(),
    dbMax: json["db_max"]?.toDouble(),
    dbMin: json["db_min"]?.toDouble(),
    gsmStatus: json["gsm_status"],
    hum: json["hum"]?.toDouble(),
    humMax: json["hum_max"]?.toDouble(),
    humMin: json["hum_min"]?.toDouble(),
    moduleId: json["module_id"],
    nh3Avg: json["nh3_avg"]?.toDouble(),
    nh3Max: json["nh3_max"]?.toDouble(),
    nh3Min: json["nh3_min"]?.toDouble(),
    no2Avg: json["no2_avg"]?.toDouble(),
    no2Max: json["no2_max"]?.toDouble(),
    no2Min: json["no2_min"]?.toDouble(),
    pm1: json["pm1"],
    pm10: json["pm10"],
    pm10Max: json["pm10_max"],
    pm10Min: json["pm10_min"],
    pm1Max: json["pm1_max"],
    pm1Min: json["pm1_min"],
    pm25: json["pm25"],
    pm25Max: json["pm25_max"],
    pm25Min: json["pm25_min"],
    pressureMax: json["pressure_max"]?.toDouble(),
    pressureMin: json["pressure_min"]?.toDouble(),
    radAmoundImpulse: json["rad_amound_impulse"],
    radAvg10: json["rad_avg10"]?.toDouble(),
    radAvg2: json["rad_avg2"]?.toDouble(),
    spectr125Hz: json["spectr_125hz"]?.toDouble(),
    spectr1Khz: json["spectr_1khz"]?.toDouble(),
    spectr250Hz: json["spectr_250hz"]?.toDouble(),
    spectr2Khz: json["spectr_2khz"]?.toDouble(),
    spectr31Hz: json["spectr_31hz"]?.toDouble(),
    spectr4Khz: json["spectr_4khz"]?.toDouble(),
    spectr500Hz: json["spectr_500hz"]?.toDouble(),
    spectr63Hz: json["spectr_63hz"]?.toDouble(),
    spectr8Khz: json["spectr_8khz"]?.toDouble(),
    temp: json["temp"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    voltage: json["voltage"],
    voltageBattery: json["voltage_battery"],
    voltageMax: json["voltage_max"],
    voltageMin: json["voltage_min"],
    ang1: json["ang1"],
    ang2: json["ang2"],
    evs: json["evs"],
    hm: json["hm"],
    ks: json["ks"],
    l: json["l"]?.toDouble(),
    li: json["li"],
    pr: json["pr"]?.toDouble(),
    pr1: json["pr1"]?.toDouble(),
    rssi: json["rssi"],
    t: json["t"]?.toDouble(),
    td: json["td"]?.toDouble(),
    tr: json["tr"],
    upow: json["upow"]?.toDouble(),
    uv: json["uv"]?.toDouble(),
    uvi: json["uvi"],
    wd: json["wd"],
    wm: json["wm"]?.toDouble(),
    wv: json["wv"]?.toDouble(),
    wv2: json["wv2"]?.toDouble(),
    valueE: json["value_e"],
    valueN: json["value_n"],
    valueZ: json["value_z"],
    airHum: json["air_hum"]?.toDouble(),
    airPressure: json["air_pressure"]?.toDouble(),
    airTemp: json["air_temp"]?.toDouble(),
    bsId: json["bs_id"],
    gpsAltitude: json["gps_altitude"],
    gpsLatitude: json["gps_latitude"],
    gpsLongitude: json["gps_longitude"],
    status: json["status"],
    voltage2: json["voltage_2"],
    rainAmount: json["rain_amount"]?.toDouble(),
    rainClicks15Minutes: json["rain_clicks_15_minutes"],
    rainClicks1Hour: json["rain_clicks_1_hour"],
    rainClicks24Hours: json["rain_clicks_24_hours"],
    rainClicksMonth: json["rain_clicks_month"],
    rainClicksThisStorm: json["rain_clicks_this_storm"],
    rainClicksToday: json["rain_clicks_today"],
    rainClicksYear: json["rain_clicks_year"]?.toDouble(),
    rainHighRate: json["rain_high_rate"],
    mq135: json["mq_135"],
    mq2: json["mq_2"],
    mq4: json["mq_4"],
    mq9: json["mq_9"],
    loraStatus: json["lora_status"],
    uvSens: json["uv_sens"],
    vin: json["vin"],
    winddir: json["winddir"]?.toDouble(),
    winddirAvg10Min: json["winddir_avg_10min"]?.toDouble(),
    winddirMax3H: json["winddir_max_3h"]?.toDouble(),
    windspeedAvg10Min: json["windspeed_avg_10min"]?.toDouble(),
    windspeedMax3H: json["windspeed_max_3h"]?.toDouble(),
    hm1: json["hm1"],
    hm2: json["hm2"],
    rad1: json["rad1"],
    rad2: json["rad2"],
    temperature1: json["temperature1"]?.toDouble(),
    temperature2: json["temperature2"]?.toDouble(),
    height: json["height"],
    soilHum: json["soil_hum"]?.toDouble(),
    soilTemp: json["soil_temp"]?.toDouble(),
    soilTemp2: json["soil_temp_2"]?.toDouble(),
    soilTemp3: json["soil_temp_3"]?.toDouble(),
    description: json["description"],
    filename: json["filename"],
    type: json["type"],
    solarRad: json["solar_rad"],
    solarRadHigh: json["solar_rad_high"],
    uvIndex: json["uv_index"]?.toDouble(),
    uvIndexHigh: json["uv_index_high"],
    as7263610: json["as7263_610"],
    as7263680: json["as7263_680"],
    as7263730: json["as7263_730"],
    as7263760: json["as7263_760"],
    as7263810: json["as7263_810"],
    as7263860: json["as7263_860"],
    as7341415: json["as7341_415"],
    as7341445: json["as7341_445"],
    as7341480: json["as7341_480"],
    as7341515: json["as7341_515"],
    as7341555: json["as7341_555"],
    as7341590: json["as7341_590"],
    as7341630: json["as7341_630"],
    as7341680: json["as7341_680"],
    as7341Clear: json["as7341_clear"],
    as7341Nearir: json["as7341_nearir"],
    humWood: json["hum_wood"],
    isR: json["is_r"],
    isS: json["is_s"],
    isT: json["is_t"],
    isTemp: json["is_temp"],
    isU: json["is_u"],
    isV: json["is_v"],
    isW: json["is_w"],
    mlx90640Avg: json["mlx90640_avg"]?.toDouble(),
    mlx90640Max: json["mlx90640_max"]?.toDouble(),
    mlx90640Min: json["mlx90640_min"]?.toDouble(),
    ndvi: json["ndvi"]?.toDouble(),
    thickWood: json["thick_wood"]?.toDouble(),
    trunkTemp: json["trunk_temp"],
    vsBlue: json["vs_blue"],
    vsGreen: json["vs_green"],
    vsOrange: json["vs_orange"],
    vsRed: json["vs_red"],
    vsTemp: json["vs_temp"],
    vsViolet: json["vs_violet"],
    vsYellow: json["vs_yellow"],
    f415: json["f_415"],
    f445: json["f_445"],
    f480: json["f_480"],
    f515: json["f_515"],
    f555: json["f_555"],
    f590: json["f_590"],
    f610: json["f_610"],
    f630: json["f_630"],
    f680: json["f_680"],
    f730: json["f_730"],
    f760: json["f_760"],
    f810: json["f_810"],
    f860: json["f_860"],
    fClear: json["f_clear"],
    fNir: json["f_nir"],
    soil7Con: json["soil7_con"],
    soil7Hum: json["soil7_hum"]?.toDouble(),
    soil7Nit: json["soil7_nit"],
    soil7Ph: json["soil7_ph"]?.toDouble(),
    soil7Phos: json["soil7_phos"],
    soil7Pot: json["soil7_pot"],
    soil7Temp: json["soil7_temp"]?.toDouble(),
    allObjects: json["all_objects"],
    avgSpeed: json["avg_speed"]?.toDouble(),
    busObjects: json["bus_objects"],
    carObjects: json["car_objects"],
    motorcycleObjects: json["motorcycle_objects"],
    peopleObjects: json["people_objects"],
    pollutionCh4: json["pollution_ch4"]?.toDouble(),
    pollutionCo2: json["pollution_co2"]?.toDouble(),
    pollutionN2O: json["pollution_n2o"]?.toDouble(),
    speeds: json["speeds"],
    truckObjects: json["truck_objects"],
    ccs811Bsln: json["ccs811_bsln"],
    ccs811Co2: json["ccs811_co2"],
    ccs811Tvoc: json["ccs811_tvoc"],
    miscCo: json["misc_co"],
    miscNh3: json["misc_nh3"],
    miscNo2: json["misc_no2"],
    mq136: json["mq_136"],
    mq137: json["mq_137"],
    pulseDataV2ZDL: json["_PulseDataV2__z_d___l"],
    absoluteLimitsHf: json["absolute_limits_hf"],
    airDensity: json["air_density"]?.toDouble(),
    airHeatCapacity: json["air_heat_capacity"]?.toDouble(),
    airMolarVolume: json["air_molar_volume"]?.toDouble(),
    airTemperature: json["air_temperature"]?.toDouble(),
    amplitudeResolutionHf: json["amplitude_resolution_hf"],
    attackAngleHf: json["attack_angle_hf"],
    auxInLi7200: json["aux_in_li_7200"],
    avgSignalStrength7200Mean:
        json["avg_signal_strength_7200_mean"]?.toDouble(),
    badAuxTc1Li7700: json["bad_aux_tc1_li_7700"],
    badAuxTc2Li7700: json["bad_aux_tc2_li_7700"],
    badAuxTc3Li7700: json["bad_aux_tc3_li_7700"],
    badTempLi7700: json["bad_temp_li_7700"],
    blockTempUnregulatedLi7700: json["block_temp_unregulated_li_7700"],
    bottomHeaterOnLi7700: json["bottom_heater_on_li_7700"],
    bowenRatio: json["bowen_ratio"]?.toDouble(),
    boxConnectedLi7700: json["box_connected_li_7700"],
    calibratingLi7700: json["calibrating_li_7700"],
    ch4DefTimelag: json["ch4_def_timelag"],
    ch4Flux: json["ch4_flux"]?.toDouble(),
    ch4MixingRatio: json["ch4_mixing_ratio"]?.toDouble(),
    ch4MolarDensity: json["ch4_molar_density"]?.toDouble(),
    ch4MoleFraction: json["ch4_mole_fraction"]?.toDouble(),
    ch4Scf: json["ch4_scf"]?.toDouble(),
    ch4Spikes: json["ch4_spikes"],
    ch4Strg: json["ch4_strg"],
    ch4TimeLag: json["ch4_time_lag"]?.toDouble(),
    ch4VAdv: json["ch4_v_adv"]?.toDouble(),
    ch4Var: json["ch4_var"]?.toDouble(),
    chk: json["chk"],
    chopperLi7200: json["chopper_li_7200"],
    chopperLi7500: json["chopper_li_7500"],
    co2DefTimelag: json["co2_def_timelag"],
    co2Flux: json["co2_flux"]?.toDouble(),
    co2Mean: json["co2_mean"]?.toDouble(),
    co2MixingRatio: json["co2_mixing_ratio"]?.toDouble(),
    co2MolarDensity: json["co2_molar_density"]?.toDouble(),
    co2MoleFraction: json["co2_mole_fraction"]?.toDouble(),
    co2Scf: json["co2_scf"]?.toDouble(),
    co2SignalStrength7200Mean:
        json["co2_signal_strength_7200_mean"]?.toDouble(),
    co2Spikes: json["co2_spikes"],
    co2Strg: json["co2_strg"],
    co2TimeLag: json["co2_time_lag"]?.toDouble(),
    co2VAdv: json["co2_v_adv"]?.toDouble(),
    co2Var: json["co2_var"]?.toDouble(),
    daytime: json["daytime"],
    deltaPLi7200: json["delta_p_li_7200"],
    deltaSignalStrength7200Mean:
        json["delta_signal_strength_7200_mean"]?.toDouble(),
    detectorLi7200: json["detector_li_7200"],
    detectorLi7500: json["detector_li_7500"],
    dewPointMean: json["dew_point_mean"]?.toDouble(),
    discontinuitiesHf: json["discontinuities_hf"],
    discontinuitiesSf: json["discontinuities_sf"],
    doy: json["doy"]?.toDouble(),
    dropOutHf: json["drop_out_hf"],
    e: json["e"]?.toDouble(),
    es: json["es"]?.toDouble(),
    et: json["et"]?.toDouble(),
    fileRecords: json["file_records"],
    flowrateMean: json["flowrate_mean"]?.toDouble(),
    h: json["h"]?.toDouble(),
    h2ODefTimelag: json["h2o_def_timelag"],
    h2OFlux: json["h2o_flux"]?.toDouble(),
    h2OMean: json["h2o_mean"]?.toDouble(),
    h2OMixingRatio: json["h2o_mixing_ratio"]?.toDouble(),
    h2OMolarDensity: json["h2o_molar_density"]?.toDouble(),
    h2OMoleFraction: json["h2o_mole_fraction"]?.toDouble(),
    h2OScf: json["h2o_scf"]?.toDouble(),
    h2OSignalStrength7200Mean:
        json["h2o_signal_strength_7200_mean"]?.toDouble(),
    h2OSpikes: json["h2o_spikes"],
    h2OStrg: json["h2o_strg"],
    h2OTimeLag: json["h2o_time_lag"]?.toDouble(),
    h2OVAdv: json["h2o_v_adv"]?.toDouble(),
    h2OVar: json["h2o_var"]?.toDouble(),
    hScf: json["h_scf"]?.toDouble(),
    hStrg: json["h_strg"],
    headDetectLi7200: json["head_detect_li_7200"],
    hitPowerMean: json["hit_power_mean"],
    hitVinMean: json["hit_vin_mean"]?.toDouble(),
    laserTempUnregulatedLi7700: json["laser_temp_unregulated_li_7700"],
    le: json["le"]?.toDouble(),
    leScf: json["le_scf"]?.toDouble(),
    leStrg: json["le_strg"],
    maxWindSpeed: json["max_wind_speed"]?.toDouble(),
    meanValueLi7500: json["mean_value_li_7500"],
    meanValueRssiLi7200: json["mean_value_rssi_li_7200"],
    model: json["model"],
    motorFailureLi7700: json["motor_failure_li_7700"],
    motorSpinningLi7700: json["motor_spinning_li_7700"],
    noSignalLi7700: json["no_signal_li_7700"],
    nonSteadyWindHf: json["non_steady_wind_hf"],
    noneDefTimelag: json["none_def_timelag"],
    noneFlux: json["none_flux"],
    noneMixingRatio: json["none_mixing_ratio"],
    noneMolarDensity: json["none_molar_density"],
    noneMoleFraction: json["none_mole_fraction"],
    noneSpikes: json["none_spikes"],
    noneStrg: json["none_strg"],
    noneTimeLag: json["none_time_lag"],
    noneVAdv: json["none_v_adv"],
    noneVar: json["none_var"],
    notReadyLi7700: json["not_ready_li_7700"],
    pitch: json["pitch"]?.toDouble(),
    pllLi7200: json["pll_li_7200"],
    pllLi7500: json["pll_li_7500"],
    pumpOnLi7700: json["pump_on_li_7700"],
    qcCh4Flux: json["qc_ch4_flux"],
    qcCo2Flux: json["qc_co2_flux"],
    qcH: json["qc_h"],
    qcH2OFlux: json["qc_h2o_flux"],
    qcLe: json["qc_le"],
    qcNoneFlux: json["qc_none_flux"],
    qcTau: json["qc_tau"],
    randErrCh4Flux: json["rand_err_ch4_flux"],
    randErrCo2Flux: json["rand_err_co2_flux"],
    randErrH: json["rand_err_h"],
    randErrH2OFlux: json["rand_err_h2o_flux"],
    randErrLe: json["rand_err_le"],
    randErrNoneFlux: json["rand_err_none_flux"],
    randErrTau: json["rand_err_tau"],
    reUnlockedLi7700: json["re_unlocked_li_7700"],
    rh: json["rh"]?.toDouble(),
    roll: json["roll"],
    skewnessKurtosisHf: json["skewness_kurtosis_hf"],
    skewnessKurtosisSf: json["skewness_kurtosis_sf"],
    sonicTemperature: json["sonic_temperature"]?.toDouble(),
    specificHumidity: json["specific_humidity"]?.toDouble(),
    spikesHf: json["spikes_hf"],
    syncLi7200: json["sync_li_7200"],
    syncLi7500: json["sync_li_7500"],
    lastParameterValuesT: json["t__"]?.toDouble(),
    tInLi7200: json["t_in_li_7200"],
    tOutLi7200: json["t_out_li_7200"],
    tau: json["tau"]?.toDouble(),
    tauScf: json["tau_scf"]?.toDouble(),
    tdew: json["tdew"]?.toDouble(),
    timelagHf: json["timelag_hf"],
    timelagSf: json["timelag_sf"],
    tke: json["tke"]?.toDouble(),
    topHeaterOnLi7700: json["top_heater_on_li_7700"],
    tsMean: json["ts_mean"]?.toDouble(),
    tsSpikes: json["ts_spikes"],
    tsVar: json["ts_var"]?.toDouble(),
    u: json["u__"]?.toDouble(),
    uMean: json["u_mean"]?.toDouble(),
    uRot: json["u_rot"]?.toDouble(),
    uSpikes: json["u_spikes"],
    uUnrot: json["u_unrot"]?.toDouble(),
    uVar: json["u_var"]?.toDouble(),
    unCh4Flux: json["un_ch4_flux"]?.toDouble(),
    unCo2Flux: json["un_co2_flux"]?.toDouble(),
    unH: json["un_h"]?.toDouble(),
    unH2OFlux: json["un_h2o_flux"]?.toDouble(),
    unLe: json["un_le"]?.toDouble(),
    unNoneFlux: json["un_none_flux"],
    unNoneScf: json["un_none_scf"],
    unTau: json["un_tau"]?.toDouble(),
    usedRecords: json["used_records"],
    vMean: json["v_mean"]?.toDouble(),
    vRot: json["v_rot"]?.toDouble(),
    vSpikes: json["v_spikes"],
    vUnrot: json["v_unrot"]?.toDouble(),
    vVar: json["v_var"]?.toDouble(),
    vinSfMean: json["vin_sf_mean"]?.toDouble(),
    vpd: json["vpd"]?.toDouble(),
    wCh4Cov: json["w_ch4_cov"]?.toDouble(),
    wCo2Cov: json["w_co2_cov"]?.toDouble(),
    wH2OCov: json["w_h2o_cov"]?.toDouble(),
    wMean: json["w_mean"]?.toDouble(),
    wNoneCov: json["w_none_cov"],
    wRot: json["w_rot"]?.toDouble(),
    wSpikes: json["w_spikes"],
    wTsCov: json["w_ts_cov"]?.toDouble(),
    wUnrot: json["w_unrot"]?.toDouble(),
    wVar: json["w_var"]?.toDouble(),
    waterVaporDensity: json["water_vapor_density"]?.toDouble(),
    windDir: json["wind_dir"]?.toDouble(),
    windSpeed: json["wind_speed"]?.toDouble(),
    x10: json["x_10"]?.toDouble(),
    x30: json["x_30"]?.toDouble(),
    x50: json["x_50"]?.toDouble(),
    x70: json["x_70"]?.toDouble(),
    x90: json["x_90"]?.toDouble(),
    xOffset: json["x_offset"]?.toDouble(),
    xPeak: json["x_peak"]?.toDouble(),
    yaw: json["yaw"]?.toDouble(),
    pulseDataZDL: json["_PulseData__z_d___l"],
  );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "ms_gust_windir": msGustWindir,
    "ms_gust_winspeed": msGustWinspeed,
    "ms_winddir": msWinddir,
    "ms_windspeed": msWindspeed,
    "msbar": msbar,
    "mshum": mshum,
    "msid": msid,
    "mstemp": mstemp,
    "mstime": mstime?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "alb": alb,
    "batt_v24": battV24,
    "batt_volt": battVolt,
    "cnr1_t": cnr1T,
    "cnr_heat_on": cnrHeatOn,
    "device_id": deviceId,
    "hfp_heat_mv_1": hfpHeatMv1,
    "hfp_heat_mv_2": hfpHeatMv2,
    "hfp_heat_mv_3": hfpHeatMv3,
    "hfp_heat_on": hfpHeatOn,
    "lwin_meas": lwinMeas,
    "lwout_meas": lwoutMeas,
    "p": p,
    "pa": pa,
    "ppfdin_hol": ppfdinHol,
    "ppfdin_rid": ppfdinRid,
    "ppfdout_hol": ppfdoutHol,
    "ppfdout_rid": ppfdoutRid,
    "ptemp": ptemp,
    "rh_hol": rhHol,
    "rh_rid": rhRid,
    "rn": rn,
    "rn_lite_rid": rnLiteRid,
    "shf_cor_1": shfCor1,
    "shf_cor_2": shfCor2,
    "shf_cor_3": shfCor3,
    "shf_ref_1": shfRef1,
    "shf_ref_2": shfRef2,
    "shf_ref_3": shfRef3,
    "stp_1_02": stp102,
    "stp_1_05": stp105,
    "stp_1_10": stp110,
    "stp_1_20": stp120,
    "stp_1_50": stp150,
    "stp_2_02": stp202,
    "stp_2_05": stp205,
    "stp_2_10": stp210,
    "stp_2_20": stp220,
    "stp_2_50": stp250,
    "stp_3_02": stp302,
    "stp_3_05": stp305,
    "stp_3_10": stp310,
    "stp_3_20": stp320,
    "stp_3_50": stp350,
    "stp_4_02": stp402,
    "stp_4_05": stp405,
    "stp_4_10": stp410,
    "stp_4_20": stp420,
    "stp_4_50": stp450,
    "stp_heat_mv_1": stpHeatMv1,
    "stp_heat_mv_2": stpHeatMv2,
    "stp_heat_mv_3": stpHeatMv3,
    "stp_heat_mv_4": stpHeatMv4,
    "stp_heat_on": stpHeatOn,
    "stp_heat_q_1": stpHeatQ1,
    "stp_heat_q_2": stpHeatQ2,
    "stp_heat_q_3": stpHeatQ3,
    "stp_heat_q_4": stpHeatQ4,
    "swin": swin,
    "swout": swout,
    "ta_hol": taHol,
    "ta_rid": taRid,
    "tsoil_av_1": tsoilAv1,
    "tsoil_av_2": tsoilAv2,
    "water_above_sensor": waterAboveSensor,
    "wd_10m": wd10M,
    "wd_2m": wd2M,
    "ws_10m": ws10M,
    "ws_2m": ws2M,
    "wtd": wtd,
    "horizontal_visibility": horizontalVisibility,
    "humidity": humidity,
    "max_temperature": maxTemperature,
    "pressure": pressure,
    "rain": rain,
    "temperature": temperature,
    "total_cloud_score": totalCloudScore,
    "winddirection": winddirection,
    "windspeed": windspeed,
    "co_avg": coAvg,
    "co_max": coMax,
    "co_min": coMin,
    "db_avg": dbAvg,
    "db_max": dbMax,
    "db_min": dbMin,
    "gsm_status": gsmStatus,
    "hum": hum,
    "hum_max": humMax,
    "hum_min": humMin,
    "module_id": moduleId,
    "nh3_avg": nh3Avg,
    "nh3_max": nh3Max,
    "nh3_min": nh3Min,
    "no2_avg": no2Avg,
    "no2_max": no2Max,
    "no2_min": no2Min,
    "pm1": pm1,
    "pm10": pm10,
    "pm10_max": pm10Max,
    "pm10_min": pm10Min,
    "pm1_max": pm1Max,
    "pm1_min": pm1Min,
    "pm25": pm25,
    "pm25_max": pm25Max,
    "pm25_min": pm25Min,
    "pressure_max": pressureMax,
    "pressure_min": pressureMin,
    "rad_amound_impulse": radAmoundImpulse,
    "rad_avg10": radAvg10,
    "rad_avg2": radAvg2,
    "spectr_125hz": spectr125Hz,
    "spectr_1khz": spectr1Khz,
    "spectr_250hz": spectr250Hz,
    "spectr_2khz": spectr2Khz,
    "spectr_31hz": spectr31Hz,
    "spectr_4khz": spectr4Khz,
    "spectr_500hz": spectr500Hz,
    "spectr_63hz": spectr63Hz,
    "spectr_8khz": spectr8Khz,
    "temp": temp,
    "temp_max": tempMax,
    "temp_min": tempMin,
    "voltage": voltage,
    "voltage_battery": voltageBattery,
    "voltage_max": voltageMax,
    "voltage_min": voltageMin,
    "ang1": ang1,
    "ang2": ang2,
    "evs": evs,
    "hm": hm,
    "ks": ks,
    "l": l,
    "li": li,
    "pr": pr,
    "pr1": pr1,
    "rssi": rssi,
    "t": t,
    "td": td,
    "tr": tr,
    "upow": upow,
    "uv": uv,
    "uvi": uvi,
    "wd": wd,
    "wm": wm,
    "wv": wv,
    "wv2": wv2,
    "value_e": valueE,
    "value_n": valueN,
    "value_z": valueZ,
    "air_hum": airHum,
    "air_pressure": airPressure,
    "air_temp": airTemp,
    "bs_id": bsId,
    "gps_altitude": gpsAltitude,
    "gps_latitude": gpsLatitude,
    "gps_longitude": gpsLongitude,
    "status": status,
    "voltage_2": voltage2,
    "rain_amount": rainAmount,
    "rain_clicks_15_minutes": rainClicks15Minutes,
    "rain_clicks_1_hour": rainClicks1Hour,
    "rain_clicks_24_hours": rainClicks24Hours,
    "rain_clicks_month": rainClicksMonth,
    "rain_clicks_this_storm": rainClicksThisStorm,
    "rain_clicks_today": rainClicksToday,
    "rain_clicks_year": rainClicksYear,
    "rain_high_rate": rainHighRate,
    "mq_135": mq135,
    "mq_2": mq2,
    "mq_4": mq4,
    "mq_9": mq9,
    "lora_status": loraStatus,
    "uv_sens": uvSens,
    "vin": vin,
    "winddir": winddir,
    "winddir_avg_10min": winddirAvg10Min,
    "winddir_max_3h": winddirMax3H,
    "windspeed_avg_10min": windspeedAvg10Min,
    "windspeed_max_3h": windspeedMax3H,
    "hm1": hm1,
    "hm2": hm2,
    "rad1": rad1,
    "rad2": rad2,
    "temperature1": temperature1,
    "temperature2": temperature2,
    "height": height,
    "soil_hum": soilHum,
    "soil_temp": soilTemp,
    "soil_temp_2": soilTemp2,
    "soil_temp_3": soilTemp3,
    "description": description,
    "filename": filename,
    "type": type,
    "solar_rad": solarRad,
    "solar_rad_high": solarRadHigh,
    "uv_index": uvIndex,
    "uv_index_high": uvIndexHigh,
    "as7263_610": as7263610,
    "as7263_680": as7263680,
    "as7263_730": as7263730,
    "as7263_760": as7263760,
    "as7263_810": as7263810,
    "as7263_860": as7263860,
    "as7341_415": as7341415,
    "as7341_445": as7341445,
    "as7341_480": as7341480,
    "as7341_515": as7341515,
    "as7341_555": as7341555,
    "as7341_590": as7341590,
    "as7341_630": as7341630,
    "as7341_680": as7341680,
    "as7341_clear": as7341Clear,
    "as7341_nearir": as7341Nearir,
    "hum_wood": humWood,
    "is_r": isR,
    "is_s": isS,
    "is_t": isT,
    "is_temp": isTemp,
    "is_u": isU,
    "is_v": isV,
    "is_w": isW,
    "mlx90640_avg": mlx90640Avg,
    "mlx90640_max": mlx90640Max,
    "mlx90640_min": mlx90640Min,
    "ndvi": ndvi,
    "thick_wood": thickWood,
    "trunk_temp": trunkTemp,
    "vs_blue": vsBlue,
    "vs_green": vsGreen,
    "vs_orange": vsOrange,
    "vs_red": vsRed,
    "vs_temp": vsTemp,
    "vs_violet": vsViolet,
    "vs_yellow": vsYellow,
    "f_415": f415,
    "f_445": f445,
    "f_480": f480,
    "f_515": f515,
    "f_555": f555,
    "f_590": f590,
    "f_610": f610,
    "f_630": f630,
    "f_680": f680,
    "f_730": f730,
    "f_760": f760,
    "f_810": f810,
    "f_860": f860,
    "f_clear": fClear,
    "f_nir": fNir,
    "soil7_con": soil7Con,
    "soil7_hum": soil7Hum,
    "soil7_nit": soil7Nit,
    "soil7_ph": soil7Ph,
    "soil7_phos": soil7Phos,
    "soil7_pot": soil7Pot,
    "soil7_temp": soil7Temp,
    "all_objects": allObjects,
    "avg_speed": avgSpeed,
    "bus_objects": busObjects,
    "car_objects": carObjects,
    "motorcycle_objects": motorcycleObjects,
    "people_objects": peopleObjects,
    "pollution_ch4": pollutionCh4,
    "pollution_co2": pollutionCo2,
    "pollution_n2o": pollutionN2O,
    "speeds": speeds,
    "truck_objects": truckObjects,
    "ccs811_bsln": ccs811Bsln,
    "ccs811_co2": ccs811Co2,
    "ccs811_tvoc": ccs811Tvoc,
    "misc_co": miscCo,
    "misc_nh3": miscNh3,
    "misc_no2": miscNo2,
    "mq_136": mq136,
    "mq_137": mq137,
    "_PulseDataV2__z_d___l": pulseDataV2ZDL,
    "absolute_limits_hf": absoluteLimitsHf,
    "air_density": airDensity,
    "air_heat_capacity": airHeatCapacity,
    "air_molar_volume": airMolarVolume,
    "air_temperature": airTemperature,
    "amplitude_resolution_hf": amplitudeResolutionHf,
    "attack_angle_hf": attackAngleHf,
    "aux_in_li_7200": auxInLi7200,
    "avg_signal_strength_7200_mean": avgSignalStrength7200Mean,
    "bad_aux_tc1_li_7700": badAuxTc1Li7700,
    "bad_aux_tc2_li_7700": badAuxTc2Li7700,
    "bad_aux_tc3_li_7700": badAuxTc3Li7700,
    "bad_temp_li_7700": badTempLi7700,
    "block_temp_unregulated_li_7700": blockTempUnregulatedLi7700,
    "bottom_heater_on_li_7700": bottomHeaterOnLi7700,
    "bowen_ratio": bowenRatio,
    "box_connected_li_7700": boxConnectedLi7700,
    "calibrating_li_7700": calibratingLi7700,
    "ch4_def_timelag": ch4DefTimelag,
    "ch4_flux": ch4Flux,
    "ch4_mixing_ratio": ch4MixingRatio,
    "ch4_molar_density": ch4MolarDensity,
    "ch4_mole_fraction": ch4MoleFraction,
    "ch4_scf": ch4Scf,
    "ch4_spikes": ch4Spikes,
    "ch4_strg": ch4Strg,
    "ch4_time_lag": ch4TimeLag,
    "ch4_v_adv": ch4VAdv,
    "ch4_var": ch4Var,
    "chk": chk,
    "chopper_li_7200": chopperLi7200,
    "chopper_li_7500": chopperLi7500,
    "co2_def_timelag": co2DefTimelag,
    "co2_flux": co2Flux,
    "co2_mean": co2Mean,
    "co2_mixing_ratio": co2MixingRatio,
    "co2_molar_density": co2MolarDensity,
    "co2_mole_fraction": co2MoleFraction,
    "co2_scf": co2Scf,
    "co2_signal_strength_7200_mean": co2SignalStrength7200Mean,
    "co2_spikes": co2Spikes,
    "co2_strg": co2Strg,
    "co2_time_lag": co2TimeLag,
    "co2_v_adv": co2VAdv,
    "co2_var": co2Var,
    "daytime": daytime,
    "delta_p_li_7200": deltaPLi7200,
    "delta_signal_strength_7200_mean": deltaSignalStrength7200Mean,
    "detector_li_7200": detectorLi7200,
    "detector_li_7500": detectorLi7500,
    "dew_point_mean": dewPointMean,
    "discontinuities_hf": discontinuitiesHf,
    "discontinuities_sf": discontinuitiesSf,
    "doy": doy,
    "drop_out_hf": dropOutHf,
    "e": e,
    "es": es,
    "et": et,
    "file_records": fileRecords,
    "flowrate_mean": flowrateMean,
    "h": h,
    "h2o_def_timelag": h2ODefTimelag,
    "h2o_flux": h2OFlux,
    "h2o_mean": h2OMean,
    "h2o_mixing_ratio": h2OMixingRatio,
    "h2o_molar_density": h2OMolarDensity,
    "h2o_mole_fraction": h2OMoleFraction,
    "h2o_scf": h2OScf,
    "h2o_signal_strength_7200_mean": h2OSignalStrength7200Mean,
    "h2o_spikes": h2OSpikes,
    "h2o_strg": h2OStrg,
    "h2o_time_lag": h2OTimeLag,
    "h2o_v_adv": h2OVAdv,
    "h2o_var": h2OVar,
    "h_scf": hScf,
    "h_strg": hStrg,
    "head_detect_li_7200": headDetectLi7200,
    "hit_power_mean": hitPowerMean,
    "hit_vin_mean": hitVinMean,
    "laser_temp_unregulated_li_7700": laserTempUnregulatedLi7700,
    "le": le,
    "le_scf": leScf,
    "le_strg": leStrg,
    "max_wind_speed": maxWindSpeed,
    "mean_value_li_7500": meanValueLi7500,
    "mean_value_rssi_li_7200": meanValueRssiLi7200,
    "model": model,
    "motor_failure_li_7700": motorFailureLi7700,
    "motor_spinning_li_7700": motorSpinningLi7700,
    "no_signal_li_7700": noSignalLi7700,
    "non_steady_wind_hf": nonSteadyWindHf,
    "none_def_timelag": noneDefTimelag,
    "none_flux": noneFlux,
    "none_mixing_ratio": noneMixingRatio,
    "none_molar_density": noneMolarDensity,
    "none_mole_fraction": noneMoleFraction,
    "none_spikes": noneSpikes,
    "none_strg": noneStrg,
    "none_time_lag": noneTimeLag,
    "none_v_adv": noneVAdv,
    "none_var": noneVar,
    "not_ready_li_7700": notReadyLi7700,
    "pitch": pitch,
    "pll_li_7200": pllLi7200,
    "pll_li_7500": pllLi7500,
    "pump_on_li_7700": pumpOnLi7700,
    "qc_ch4_flux": qcCh4Flux,
    "qc_co2_flux": qcCo2Flux,
    "qc_h": qcH,
    "qc_h2o_flux": qcH2OFlux,
    "qc_le": qcLe,
    "qc_none_flux": qcNoneFlux,
    "qc_tau": qcTau,
    "rand_err_ch4_flux": randErrCh4Flux,
    "rand_err_co2_flux": randErrCo2Flux,
    "rand_err_h": randErrH,
    "rand_err_h2o_flux": randErrH2OFlux,
    "rand_err_le": randErrLe,
    "rand_err_none_flux": randErrNoneFlux,
    "rand_err_tau": randErrTau,
    "re_unlocked_li_7700": reUnlockedLi7700,
    "rh": rh,
    "roll": roll,
    "skewness_kurtosis_hf": skewnessKurtosisHf,
    "skewness_kurtosis_sf": skewnessKurtosisSf,
    "sonic_temperature": sonicTemperature,
    "specific_humidity": specificHumidity,
    "spikes_hf": spikesHf,
    "sync_li_7200": syncLi7200,
    "sync_li_7500": syncLi7500,
    "t__": lastParameterValuesT,
    "t_in_li_7200": tInLi7200,
    "t_out_li_7200": tOutLi7200,
    "tau": tau,
    "tau_scf": tauScf,
    "tdew": tdew,
    "timelag_hf": timelagHf,
    "timelag_sf": timelagSf,
    "tke": tke,
    "top_heater_on_li_7700": topHeaterOnLi7700,
    "ts_mean": tsMean,
    "ts_spikes": tsSpikes,
    "ts_var": tsVar,
    "u__": u,
    "u_mean": uMean,
    "u_rot": uRot,
    "u_spikes": uSpikes,
    "u_unrot": uUnrot,
    "u_var": uVar,
    "un_ch4_flux": unCh4Flux,
    "un_co2_flux": unCo2Flux,
    "un_h": unH,
    "un_h2o_flux": unH2OFlux,
    "un_le": unLe,
    "un_none_flux": unNoneFlux,
    "un_none_scf": unNoneScf,
    "un_tau": unTau,
    "used_records": usedRecords,
    "v_mean": vMean,
    "v_rot": vRot,
    "v_spikes": vSpikes,
    "v_unrot": vUnrot,
    "v_var": vVar,
    "vin_sf_mean": vinSfMean,
    "vpd": vpd,
    "w_ch4_cov": wCh4Cov,
    "w_co2_cov": wCo2Cov,
    "w_h2o_cov": wH2OCov,
    "w_mean": wMean,
    "w_none_cov": wNoneCov,
    "w_rot": wRot,
    "w_spikes": wSpikes,
    "w_ts_cov": wTsCov,
    "w_unrot": wUnrot,
    "w_var": wVar,
    "water_vapor_density": waterVaporDensity,
    "wind_dir": windDir,
    "wind_speed": windSpeed,
    "x_10": x10,
    "x_30": x30,
    "x_50": x50,
    "x_70": x70,
    "x_90": x90,
    "x_offset": xOffset,
    "x_peak": xPeak,
    "yaw": yaw,
    "_PulseData__z_d___l": pulseDataZDL,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
