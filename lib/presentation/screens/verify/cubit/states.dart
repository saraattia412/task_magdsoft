// ignore_for_file: prefer_typing_uninitialized_variables



abstract class OtpStates {}

class InitialOtpStates extends OtpStates{}


class LoadingOtpStates extends OtpStates{}

class SuccessOtpStates extends OtpStates{

}

class ErrorOtpStates extends OtpStates{
  late final error ;
  ErrorOtpStates(this.error);
}
