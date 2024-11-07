part of 'app_pages.dart';

abstract class Routes{
  Routes._();
  static const SPLASH = _paths.SPLASH;
  static const UNKONW_404 = _paths.UNKNOW_404;
  static const HOME = _paths.HOME;
  static const INCOME=_paths.INCOME;
  static const SPACESACCOUNT=_paths.SPACESAccount;
  static const Transaction=_paths.Transaction;
  static const AddAccount=_paths.AddAccount;
  static const Space=_paths.AddSpaces;
  static const Login=_paths.Login;
  static const Signup=_paths.Signup;
  static const Expense=_paths.Expense;
}

abstract class _paths{
  static const SPLASH = '/splash';
  static const UNKNOW_404 = '/404';
  static const HOME = '/home';
  static const INCOME = '/add';
  static const SPACESAccount = '/space';
  static const Transaction = '/transaction';
  static const AddAccount = '/account';
  static const AddSpaces = '/addSpace';
  static const Login = '/login';
  static const Signup = '/signup';
  static const Expense = '/expense';
}