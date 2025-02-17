class WeatherModal {
  late LocationModal locationModal;
  late CurrentModal currentModal;
  late ForcatModal forcatModal;

  WeatherModal(this.locationModal, this.currentModal, this.forcatModal);

  factory WeatherModal.fromJson(Map m1) {
    return WeatherModal(
        LocationModal.fromJson(m1['location']),
        CurrentModal.fromJson(m1['current']),
        ForcatModal.fromJson(m1['forecast']));
  }
}

class LocationModal {
  late String name, region, country, localtime;

  LocationModal(this.name, this.region, this.country, this.localtime);

  factory LocationModal.fromJson(Map m1) {
    return LocationModal(
        m1['name'], m1['region'], m1['country'], m1['localtime']);
  }
}

class CurrentModal {
  late double temp_c, temp_f, wind_mph, wind_kph, pressure_in, pressure_mb, uv;
  late int is_day, humidity, cloud;
  late Condition condition;

  CurrentModal(
      this.temp_c,
      this.temp_f,
      this.wind_mph,
      this.wind_kph,
      this.pressure_in,
      this.uv,
      this.is_day,
      this.humidity,
      this.cloud,
      this.pressure_mb,
      this.condition);

  factory CurrentModal.fromJson(Map m1) {
    return CurrentModal(
        m1['temp_c'].toDouble(),
        m1['temp_f'].toDouble(),
        m1['wind_mph'].toDouble(),
        m1['wind_kph'].toDouble(),
        m1['pressure_in'].toDouble(),
        m1['uv'].toDouble(),
        m1['is_day'],
        m1['humidity'],
        m1['cloud'],
        m1['pressure_mb'].toDouble(),
        Condition.fromJson(m1['condition']));
  }
}

class Condition {
  late String text, icon;

  Condition(this.text, this.icon);

  factory Condition.fromJson(Map m1) {
    return Condition(m1['text'], m1['icon']);
  }
}

class ForcatModal {
  late List<Forecastday> forcastday = [];

  ForcatModal(this.forcastday);

  factory ForcatModal.fromJson(Map m1) {
    return ForcatModal((m1['forecastday'] as List)
        .map(
          (e) => Forecastday.fromJson(e),
    )
        .toList() ?? []);
  }
}

class Forecastday {
  late String date;
  late DayModal day;
  late AstroModal astro;
  late List<HourModal> hour = [];

  Forecastday(this.date, this.day, this.hour,this.astro);

  factory Forecastday.fromJson(Map m1) {
    return Forecastday(
      m1['date'],
      DayModal.fromJson(m1['day']),
      (m1['hour'] as List)
          .map(
            (e) => HourModal.fromJson(e),
      )
          .toList(),
      AstroModal.fromJson(m1['astro']),
    );
  }
}

class AstroModal
{
  late String sunrise,sunset;

  AstroModal(this.sunrise,this.sunset);

  factory AstroModal.fromJson(Map m1)
  {
    return AstroModal(m1['sunrise'], m1['sunset']);
  }
}

class DayModal {
  late double maxtemp_c, mintemp_c;
  late DayConditionModal dayConditionModal;
  late int daily_chance_of_rain;

  DayModal(this.maxtemp_c, this.mintemp_c, this.dayConditionModal,this.daily_chance_of_rain);

  factory DayModal.fromJson(Map m1) {
    return DayModal(m1['maxtemp_c'].toDouble(), m1['mintemp_c'].toDouble(),
        DayConditionModal.fromJson(m1['condition']),m1['daily_chance_of_rain']);
  }
}

class DayConditionModal {
  late String text, icon;

  DayConditionModal(this.text, this.icon);

  factory DayConditionModal.fromJson(Map m1) {
    return DayConditionModal(m1['text'], m1['icon']);
  }
}

class HourModal {
  late String time;
  late double temp_c;
  late int is_day;
  late HourConditionModal hourConditionModal;

  HourModal(this.time, this.temp_c, this.is_day, this.hourConditionModal);

  factory HourModal.fromJson(Map m1) {
    return HourModal(m1['time'], m1['temp_c'].toDouble(), m1['is_day'],
        HourConditionModal.fromJson(m1['condition']));
  }
}

class HourConditionModal {
  late String text, icon;

  HourConditionModal(this.text, this.icon);

  factory HourConditionModal.fromJson(Map m1) {
    return HourConditionModal(m1['text'], m1['icon']);
  }
}