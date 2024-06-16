import 'package:dio/dio.dart';

abstract class Failuer
{
final String errMsg;

  Failuer(this.errMsg);
}

class ServerFailure extends Failuer{
  ServerFailure(super.errMsg);


factory ServerFailure.fromDioException(DioException dioException)
 {
  switch(dioException.type){
    
    case DioExceptionType.connectionTimeout:
    return ServerFailure('Connection timeout with ApiServer');
      
    case DioExceptionType.sendTimeout:
    return ServerFailure('Send timeout with ApiServer');
      
    case DioExceptionType.receiveTimeout:
    return ServerFailure('Recive timeout with ApiServer');

    case DioExceptionType.badResponse:
    return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);
      
    case DioExceptionType.cancel:
    return ServerFailure('Request to ApiServer was cancelled');
      
     
    case DioExceptionType.unknown:
    if(dioException.message!.contains('SocketException'))
    {
      return ServerFailure('No internet connection');
    }else
    {
      return ServerFailure('Unexpected error occured');
    }

    default:
    return ServerFailure('Opps There was an error');

  
      
  }
}

factory ServerFailure.fromResponse(int statusCode, dynamic response)
{
if (statusCode == 400 || statusCode == 401 || statusCode == 403) 
{
return ServerFailure(response['error']['message']);
}
else if(statusCode ==404)
{
return ServerFailure('Your request not found, please try again later!');
}
else if(statusCode == 500){
  return ServerFailure('Internal Server Error, please try again later!');
}else
{
  return ServerFailure('Opps There was an error');
}
}
}