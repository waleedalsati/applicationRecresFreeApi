import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prodectcubit_cubit.dart';

class prodect extends StatelessWidget {
  const prodect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title:Text( 'My prodect '),backgroundColor: Colors.lightGreenAccent,),
      body: BlocBuilder<ProdectcubitCubit,ProdectcubitState>(
        builder: (context, state) {
          if (state is ProdectcubitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProdectcubitSucses) {
            final products = state.data;

            return GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = products[index];
                return ProductCard(
                  name: item.data.name,
                  category: item.data.category,
                  price: item.data.price,
                  inStock: item.data.in_stock,
                );
              },
            );
          } else if (state is Prodectcubitfail) {
            return Center(child: Text('حدث خطأ: ${state.error}'));
          }
          return const Center(child: Text('لا توجد منتجات'));
        },
      ),
    );
  }
}


// Widget منفصل لبطاقة المنتج (Product Card)
class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final bool inStock;

  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.inStock,
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
          // جزء الصورة التوضيحية للمنتج
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 50,
                  color: Colors.indigo.shade400,
                ),
              ),
            ),
          ),
          // تفاصيل المنتج
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        fontSize: 14,
                      ),
                    ),
                    // مؤشر حالة التوفر في المخزن
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: inStock ? Colors.green.shade50 : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        inStock ? 'متوفر' : 'غير متوفر',
                        style: TextStyle(
                          color: inStock ? Colors.green : Colors.red,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}