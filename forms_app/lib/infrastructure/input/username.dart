import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, lenght }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    String? errorMessage;
    if(!isPure && isNotValid) {
      errorMessage = switch(error!) {
         UsernameError.empty => 'Required field',
         UsernameError.lenght => 'More than 6 characters'
      };
    }

    return errorMessage;
  }

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if(value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if(value.length < 6) return UsernameError.lenght;

    return null;
  }
}