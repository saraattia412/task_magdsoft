

// ignore_for_file: prefer_typing_uninitialized_variables

import '../../../../data/network/requests/login_request.dart';
import '../../../../data/network/responses/login_response.dart';

abstract class LogInStates {}

class InitialLogInStates extends LogInStates{}

class LoadingLogInRequestStates extends LogInStates{}

class SuccessLogInRequestStates extends LogInStates{
  late final RequestModel requestModel ;
  SuccessLogInRequestStates({required this.requestModel});
}

class ErrorLogInRequestStates extends LogInStates{
  late final error ;
  ErrorLogInRequestStates(this.error);
}

class LoadingLogInStates extends LogInStates{}

class SuccessLogInStates extends LogInStates{
  late final ResponsesModel responsesModel ;
  SuccessLogInStates({required this.responsesModel});
}

class ErrorLogInStates extends LogInStates{
  late final error ;
  ErrorLogInStates(this.error);
}

