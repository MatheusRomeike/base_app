import '../translations.dart';

class PtBr implements Translations {
  @override
  String get loginSuccess => 'Login efetuado com sucesso.';

  @override
  String get unauthorized => 'Não autorizado. Faça login novamente.';

  @override
  String get appName => 'App de Exemplo';

  @override
  String get resourceNotFound => 'Recurso não encontrado.';

  @override
  String get loading => 'Carregando...';
}
