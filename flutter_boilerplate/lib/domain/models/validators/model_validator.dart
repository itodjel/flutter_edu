//Base model validator with default implementations of some common methods
abstract class ModelValidator<T> {
  //Primarily used when you want to disable submit button
  bool validate(T model) => true;
}
