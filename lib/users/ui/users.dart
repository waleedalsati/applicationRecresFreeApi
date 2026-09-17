import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainingapp/users/cubit/users_cubit.dart';

// 1. يفضل بدء اسم الكلاس بحرف كبير UpperCamelCase
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  void initState() {



    context
        .read<UsersCubit>()
        .getallusers();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('عرض المستخدمين'),backgroundColor: Colors.lightGreenAccent,
      ), // ✅ تم إغلاق الـ AppBar بشكل صحيح هنا
      body: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UsersLoding) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("جاري التحميل..."),
                backgroundColor: Colors.blue,
              ),
            );
          } else if (state is UsersSucces) { // ✅ تصحيح التحقق من الحالة
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("تم التحميل بنجاح"),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is Usersfail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("فشل التحميل: ${state.message}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UsersLoding) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersSucces) {
            // افترضنا أن state.response تعيد كائن ResponseUsers يحتوي على القائمة data
            final usersList = state.users;

            if (usersList.isEmpty) {
              return const Center(child: Text('لا يوجد مستخدمون'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: usersList.length,
              itemBuilder: (context, index) { // ✅ تغيير اسم المعامل إلى index
                final user = usersList[index];
                // ✅ الحصول على المستخدم الحالي
                return UserCard(
                  id: user.id,
                  email: user.email,
                  firstName: user.first_name,
                  lastName: user.last_name,
                  avatar: user.avatar,
                );
              },
            );
          } else if (state is Usersfail) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          }

          return const Center(child: Text('اضغط لجلب البيانات'));
        },
      ),
    );
  }
}

// 2. كلاس الكارد المخصص لعرض بيانات المستخدم
class UserCard extends StatelessWidget {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserCard({
    super.key,
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // جزء الصورة الشخصية (Avatar)
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                avatar,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.indigo.shade50,
                  child: const Icon(Icons.person, size: 50, color: Colors.indigo),
                ),
              ),
            ),
          ),
          // تفاصيل المستخدم
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'ID: #$id',
                  style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}