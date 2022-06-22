import 'multi_validator.dart';
import 'validator.dart';

class ValidatorBuilder {
  final List<Validator> validators = [];

  ValidatorBuilder required() {
    validators.add(RequiredFieldValidator());
    return this;
  }

  ValidatorBuilder email() {
    validators.add(EmailValidator());
    return this;
  }

  Validator build() => MultiValidator(validators: validators);
}
