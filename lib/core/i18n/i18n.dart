import '../print/print.dart';
import 'strings/en_us.dart';
import 'strings/pt_br.dart';

import 'translations.dart';

class I18n {
  static Translations strings = PtBr();
  static String locale = 'pt_BR';

  static void load(String locale) {
    I18n.locale = locale;
    debugPrint(locale);
    if (locale == 'pt_BR') {
      strings = PtBr();
    }

    strings = EnUs();
  }
}
