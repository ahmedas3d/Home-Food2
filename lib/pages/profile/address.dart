import 'package:flutter/material.dart';
import 'package:home_food_delivery/utils/Colors.dart';

import '../../utils/convert.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.mainColor,
        title:  Text("${translateDataBase("العنوان", " Address ")}",style: TextStyle(color: Colors.white),),
      ),
      body: const AddressList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          // Navigate to the form page to add a new address
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddAddressForm()),
          );
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}


class AddressList extends StatelessWidget {
  const AddressList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for addresses
    List<Map<String, String>> addresses = [
      {
        'title': "${translateDataBase("المنزل", " Home ")}",
        'address': "${translateDataBase("17 شارع النصر", " 17 Nasr street ")}",
        'city': "${translateDataBase("مدينة الاسماعيلية", " Ismailia City ")}",
        'governorate': "${translateDataBase("الاسماعيلية", " Ismailia ")}",
        'country': "${translateDataBase("مصر", " Egypt ")}",
      },
      {
        'title': "${translateDataBase("العمل", " Work ")}",
        'address': "${translateDataBase("مكرم عبيد", " Makram Ebeid ")}",
        'city': "${translateDataBase("مدينة نصر", " Nasr City ")}",
        'governorate': "${translateDataBase("القاهره", " Cairo ")}",
        'country': "${translateDataBase("مصر", " Egypt ")}",
      },
      {
        'title': "${translateDataBase("اخر", " Other ")}",
        'address': "${translateDataBase("19 شارع جمال عبدالناضر", " 19 Gamal Abdel Nader Street ")}",
        'city': "${translateDataBase("مدينة العبور", " Obour City ")}",
        'governorate': "${translateDataBase("القليوبية", " Qalyubia ")}",
        'country':"${translateDataBase("مصر", " Egypt ")}",
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return AddressItem(
          title: addresses[index]['title'] ?? '',
          address: addresses[index]['address'] ?? '',
          city: addresses[index]['city'] ?? '',
          governorate: addresses[index]['governorate'] ?? '',
          country: addresses[index]['country'] ?? '',
          onDelete: () {
            // Delete the address
            // Implement your delete logic here
          },
        );
      },
    );
  }
}

class AddressItem extends StatelessWidget {
  final String title;
  final String address;
  final String city;
  final String governorate;
  final String country;
  final VoidCallback onDelete;

  const AddressItem({
    required this.title,
    required this.address,
    required this.city,
    required this.governorate,
    required this.country,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(address),
            Text('$city, $governorate, $country'),
          ],
        ),
        leading: const Icon(Icons.location_on,color: Colors.blueGrey,),
        trailing: IconButton(
          color: AppColors.mainColor,
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
        title:  Text("${translateDataBase("اضافة عنوان", " Add Address ")}",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0,left: 16.0,top: 20.0,bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "${translateDataBase("اسم العنوان", " Title Name ")}",
                  border: OutlineInputBorder(),
                ),
                // Implement your logic to handle the entered title name
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "${translateDataBase("العنوان", " Address ")}",
                  border: OutlineInputBorder(),
                ),
                // Implement your logic to handle the entered address
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "${translateDataBase("المدينة", " City ")}",
                  border: OutlineInputBorder(),
                ),
                // Implement your logic to handle the entered city
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "${translateDataBase("المحافظة", " Governorate ")}",
                  border: OutlineInputBorder(),
                ),
                // Implement your logic to handle the entered governorate
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration:  InputDecoration(
                  labelText: "${translateDataBase("الدولة", " Country ")}",
                  border: OutlineInputBorder(),
                ),
                // Implement your logic to handle the entered country
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Save the address
                  // Implement your save logic here
                  // Then navigate back to the address list page
                  Navigator.pop(context);
                },
                child:  Text("${translateDataBase("اضافة", " Add ")}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
