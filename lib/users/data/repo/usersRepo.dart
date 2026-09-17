import 'package:trainingapp/users/data/model/UsersResponse.dart';

import '../../../prodects/data/services.dart';

class  userRepo{

  Services  services;

  userRepo(this.services);
  Future<responseUsers>getallUsers(){

    String apiKey="pub_bb0ddf6b2eecd00056d6f83899cfd647d5226c73b576376a4a957d588a1a8bed";
   final response1= services.getallusers(apiKey);
   return response1;

  }






}