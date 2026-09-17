import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/prodects/cubit/prodectcubit_cubit.dart';
import 'package:trainingapp/prodects/data/prodictRepo.dart';
import 'package:trainingapp/prodects/data/services.dart';
import 'package:trainingapp/prodects/ui/prodects.dart';
import 'package:trainingapp/users/cubit/users_cubit.dart';
import 'package:trainingapp/users/data/repo/usersRepo.dart';
import 'package:trainingapp/users/ui/users.dart';

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
    final repo1 =userRepo(services);

    return  MultiBlocProvider(providers: [

      BlocProvider<ProdectcubitCubit>(
        create: (context) => ProdectcubitCubit(repo)..getallprodect11(),
      ),
      BlocProvider<UsersCubit>(
          create: (context) => UsersCubit(repo1)..getallusers()),

    ],

   child:MaterialApp(home:  HomeScreen (),
    ));
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton.icon(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('جاري الانتقال لصفحة عرض صفحة المنتحات...')),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>BlocProvider.value(value: context.read<ProdectcubitCubit>(),
                      child:

                      prodect( ),

                    ))
                );
              },
              icon: const Icon(Icons.people),
              label: const Text(
                'عرض كافة المنتجات',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),

            const SizedBox(height: 20), // مسافة بين الزرين

            // الزر الثاني: إضافة أو عرض تفاصيل مستخدم
            OutlinedButton.icon(
              onPressed: () {
                // هنا يتم الانتقال لصفحة تفاصيل أو إضافة مستخدم
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('جاري فتح صفحة إعدادات/إضافة المستخدم...')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>  UsersScreen(),
                    ),

                  );
              },
              icon: const Icon(Icons.person_add),
              label: const Text(
                'عرض المستخدمين ',
                style: TextStyle(fontSize: 18),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
