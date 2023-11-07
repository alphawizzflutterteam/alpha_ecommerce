// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message,this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}


class FetchDataException extends AppException{

  FetchDataException([String? message]): super(message,'Error occured during communicating with server.');
}


class BadRequestException extends AppException{

  BadRequestException([String? message]): super(message,'Invalid Request.');
}

class UnAuthorizedException extends AppException{

  UnAuthorizedException([String? message]): super(message,'UnAuthorized Request.');
}

class InvalidInputException extends AppException{

  InvalidInputException([String? message]): super(message,'Invalid Input.');
}