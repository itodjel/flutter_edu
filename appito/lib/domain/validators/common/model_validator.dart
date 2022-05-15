//Base model validator with default implementations of some common methods
abstract class ModelValidator<T> {
  //Primarily used when you want to disable submit button
  bool validate(T model) => true;
  List<String> messages(T model) => [];
  String message(T model, [String messagePrefix = '- ']) => messagePrefix + messages(model).join('\n$messagePrefix');
}
