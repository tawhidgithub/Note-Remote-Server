
class sessionController{

  static final sessionController _session=sessionController._internal();


  String? userId;


  factory sessionController(){
    return _session;
  }
  sessionController._internal(){

  }
}




