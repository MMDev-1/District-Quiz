import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/datanotifier.dart';

class ProductData extends StatelessWidget {
  const ProductData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Data>().fetchdata;
    return Scaffold(
      appBar: AppBar(
        title: const Text('District Quiz'),
      ),
      body: Center(
        child: Consumer<Data>(
          builder: ((context, value, child) {
            return value.map.isEmpty && !value.error
                ? const CircularProgressIndicator()
                : value.error
                    ? Text(' ${value.errorMessage}')
                    : ListView.builder(
                        itemCount: value.map['data'].length,
                        itemBuilder: (context, index) {
                          return DataCard(map: value.map['data'][index]);
                        });
          }),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
        Image.network(map['image'].toString()),
              Text(
                map['name'],
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(map['description'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(
                height: 5,
              ),
              Text(
                map['details']['quantity'].toString() + ' piece(s)',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black26),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                map['details']['price'].toString() + '\$',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Add to bag',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
