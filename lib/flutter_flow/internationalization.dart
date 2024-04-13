import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SplashScreen
  {
    '146vqf08': {
      'en': 'S',
      'ar': 'S',
    },
    'yr4h93d0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LogInScreen
  {
    '230zzlt5': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'p1q3452w': {
      'en': 'Mobile Number',
      'ar': 'رقم الهاتف المحمول',
    },
    'ugkmqim4': {
      'en': 'Mobile Number Is Not valid',
      'ar': 'رقم الجوال غير صالح',
    },
    '6tg8u2nt': {
      'en': 'Password',
      'ar': '',
    },
    'za044c2e': {
      'en': 'Password Is Empty',
      'ar': 'كلمة المرور فارغة',
    },
    '2hh5c3n9': {
      'en': 'Sign In',
      'ar': '',
    },
    '98a35tzc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // MapPage
  {
    '8ejc2hr8': {
      'en': 'Map',
      'ar': 'الخارطة',
    },
    'ct87vsqr': {
      'en': 'Start',
      'ar': 'يبدأ',
    },
    'oe5kkwcl': {
      'en': 'LogOut',
      'ar': 'تسجيل خروج',
    },
    'lrohzr5c': {
      'en': 'Home',
      'ar': '',
    },
  },
  // GoOrBack
  {
    'lmv8tuce': {
      'en': 'Go',
      'ar': 'تسجيل خروج',
    },
    'ainho1h0': {
      'en': 'Away',
      'ar': 'بعيد',
    },
  },
  // Miscellaneous
  {
    'qj6cnogt': {
      'en': '',
      'ar': '',
    },
    '23f9jee3': {
      'en': '',
      'ar': '',
    },
    '7ddk35s2': {
      'en': '',
      'ar': '',
    },
    'a0sgcsqa': {
      'en': '',
      'ar': '',
    },
    'gt04cn1k': {
      'en': '',
      'ar': '',
    },
    'a01y3vhi': {
      'en': '',
      'ar': '',
    },
    'fuma6t58': {
      'en': '',
      'ar': '',
    },
    'yhzaw0sy': {
      'en': '',
      'ar': '',
    },
    'w7rfo5lp': {
      'en': '',
      'ar': '',
    },
    'f5xqr4sl': {
      'en': '',
      'ar': '',
    },
    '4g1i95i8': {
      'en': '',
      'ar': '',
    },
    '7y39omz1': {
      'en': '',
      'ar': '',
    },
    'ipe8xq9g': {
      'en': '',
      'ar': '',
    },
    '1z63pnks': {
      'en': '',
      'ar': '',
    },
    '2sgeqcff': {
      'en': '',
      'ar': '',
    },
    'sol70qya': {
      'en': '',
      'ar': '',
    },
    '217t7haq': {
      'en': '',
      'ar': '',
    },
    'a4vffdqg': {
      'en': '',
      'ar': '',
    },
    '0v25ag1m': {
      'en': '',
      'ar': '',
    },
    '31wr4wkf': {
      'en': '',
      'ar': '',
    },
    '7zlic7yt': {
      'en': '',
      'ar': '',
    },
    'b9v95rov': {
      'en': '',
      'ar': '',
    },
    'lrhspves': {
      'en': '',
      'ar': '',
    },
    '3ce37ta6': {
      'en': '',
      'ar': '',
    },
    'qmlmkqn0': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
