import 'package:timeago/timeago.dart' as timeago;

class LocalizationUtil {
  static void initialize() {
    timeago.setLocaleMessages('ru', _RussianMessages());
  }
}

class _RussianMessages implements timeago.LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'через';
  @override
  String suffixAgo() => 'назад';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'только что';
  @override
  String aboutAMinute(int minutes) => 'минуту';
  @override
  String minutes(int minutes) =>
      '$minutes ${_convert(minutes, 'минуту', 'минуты', 'минут')}';
  @override
  String aboutAnHour(int minutes) => 'час';
  @override
  String hours(int hours) =>
      '$hours ${_convert(hours, 'час', 'часа', 'часов')}';
  @override
  String aDay(int hours) => 'день';
  @override
  String days(int days) => '$days ${_convert(days, 'день', 'дня', 'дней')}';
  @override
  String aboutAMonth(int days) => 'месяц';
  @override
  String months(int months) =>
      '$months ${_convert(months, 'месяц', 'месяца', 'месяцев')}';
  @override
  String aboutAYear(int year) => 'год';
  @override
  String years(int years) => '$years ${_convert(years, 'год', 'года', 'лет')}';
  @override
  String wordSeparator() => ' ';

  String _convert(int number, String one, String few, String many) {
    if (number % 10 == 1 && number % 100 != 11) {
      return one;
    } else if (number % 10 >= 2 &&
        number % 10 <= 4 &&
        (number % 100 < 10 || number % 100 >= 20)) {
      return few;
    } else {
      return many;
    }
  }
}
