import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/prodects/cubit/prodectcubit_cubit.dart';
import 'package:trainingapp/prodects/data/prodictRepo.dart';
import 'package:trainingapp/prodects/data/services.dart';
import 'package:trainingapp/prodects/ui/prodects.dart';

void main() {
  runApp( MyApptraining());
}

class MyApptraining extends StatelessWidget {
  const MyApptraining({super.key});


  @override
  Widget build(BuildContext context) {
    final dio = CreateandSetup();
    // 2. إنشاء كائن الخدمات Services
    final services = Services(dio);
    // 3. إنشاء كائن الـ Repository مع إعطائه الـ Services
    final repo = prodictrepo(services);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(providers: [

      BlocProvider<ProdectcubitCubit>(
        create: (context) => ProdectcubitCubit(repo)..getallprodect11(),
      ),
    ],

   child: prodect (),
    ));
  }
}
