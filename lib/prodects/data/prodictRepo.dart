import 'package:trainingapp/prodects/data/modelProdect.dart';
import 'package:trainingapp/prodects/data/services.dart';

class prodictrepo{
  Services  servics;
  prodictrepo(this.servics);
Future<dataresponse>  getallprodect()async{

  String apiKey="pub_bb0ddf6b2eecd00056d6f83899cfd647d5226c73b576376a4a957d588a1a8bed";
 final response=await servics.getaallprodect(apiKey);
  print(response.toString());
return response;



}
  
  
}
