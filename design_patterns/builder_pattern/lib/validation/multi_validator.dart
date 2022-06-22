import 'validator.dart';

class MultiValidator extends Validator {
  final List<Validator> validators;

  MultiValidator({
    required this.validators,
  });

  @override
  String? call(String? value) {
    for (var validator in validators) {
      final result = validator.call(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
