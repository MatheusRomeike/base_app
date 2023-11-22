abstract class FeatureInjector {
  void inject() {
    injectExceptionHandler();
    injectRepositories();
    injectUsecases();
    injectControllers();
  }

  void injectExceptionHandler();
  void injectDatasourcesImpl();
  void injectDatasourcesMock();
  void injectRepositories();
  void injectUsecases();
  void injectControllers();
}
