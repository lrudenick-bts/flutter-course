import 'package:formz/formz.dart';

// Define input validation errors
enum EmailError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailError> {
  static final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Email.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    String? errorMessage;
    if(!isPure && isNotValid) {
      errorMessage = switch(error!) {
         EmailError.empty => 'Required field',
         EmailError.format => 'Invalid email format'
      };
    }

    return errorMessage;
  }

  // Override validator to handle validating a given input value.
  @override
  EmailError? validator(String value) {

    if (value.isEmpty) return EmailError.empty;
    if (value.trim().isEmpty) return EmailError.empty;

    if (!emailRegExp.hasMatch(value)) return EmailError.format;
    return null;
  }
}