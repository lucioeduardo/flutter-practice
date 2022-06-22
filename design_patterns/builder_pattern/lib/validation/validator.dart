abstract class Validator {
  String? call(String? value);
}

class EmailValidator extends Validator {
  @override
  String? call(String? value) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    final isValid = regex.hasMatch(value ?? '');
    return isValid ? null : 'Email inválido';
  }
}

class RequiredFieldValidator extends Validator {
  @override
  String? call(String? value) {
    return (value?.isEmpty ?? true) ? 'Campo obrigatório' : null;
  }
}
