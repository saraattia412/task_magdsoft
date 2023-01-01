// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:task_magdsoft/data/models/help_model.dart';

abstract class HelpStates{}

class InitialHelpStates extends HelpStates{}

class LoadingHelpStates extends HelpStates{}

class SuccessHelpStates extends HelpStates{
  late final HelpModel helpModel;
  SuccessHelpStates({required this.helpModel});
}

class ErrorHelpStates extends HelpStates{
  late final error;
  ErrorHelpStates({required this.error});
}

class ChangeState extends HelpStates{}