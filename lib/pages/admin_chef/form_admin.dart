import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../utils/Colors.dart';
import '../../utils/convert.dart';


class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _imagePath = ''; // Define _imagePath variable here


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Center(child: Text("${translateDataBase("اضافة أكله", " Add food ")}",style: TextStyle(color: Colors.white),)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child:  Text(
                    "${translateDataBase("اسم الوجبة", " Food Name ")}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _productNameController,
                  decoration:  InputDecoration(
                    hintText: "${translateDataBase("أدخل اسم الوجبة", " Enter Food Name ")}",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "${translateDataBase("رجاء أدخل اسم الوجبة", " Please enter Food Name ")}";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child:  Text(
                    "${translateDataBase("الوصف", " Description ")}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration:  InputDecoration(
                    hintText: "${translateDataBase("أدخل وصف الوجبة", " Enter food description ")}",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "${translateDataBase("رجاء أدخل وصف الوجبة", " Please enter food description ")}";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child:  Text(
                    "${translateDataBase("وقت تحضير الوجبة", " Cooking time ")}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration:  InputDecoration(
                    hintText: "${translateDataBase("ادخل وقت تحضير الوجبة", " Enter your Cooking time ")}",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "${translateDataBase("رجاء ادخل وقت تحضير الوجبة", " Please enter your Cooking time ")}";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child:  Text(
                    "${translateDataBase("أضف الصور", " Add Pictures ")}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10,),
                Stack(
                  children: [
                    _imagePath.isNotEmpty
                        ? Image.file(
                      File(_imagePath),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    )
                        : Container(),
                    if (_imagePath.isNotEmpty) // إذا كان هناك صورة، قم بإظهار زر الحذف
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red,), // لون الأيقونة الأحمر
                          onPressed: () {
                            setState(() {
                              _imagePath = ''; // مسح مسار الصورة
                            });
                          },
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () async {
                    // استخدام ImagePicker لاختيار الصورة من المعرض
                    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
                    // إذا تم اختيار الصورة، يمكنك القيام بما تشاء بها هنا، مثلاً عرضها في تطبيقك
                    if (pickedFile != null) {
                      // يمكنك تخزين المسار أو استخدامها مباشرة
                      String imagePath = pickedFile.path;
                      setState(() {
                        _imagePath = imagePath; // تعيين المسار للمتغير _imagePath
                      });
                      // يمكنك أيضًا عرض الصورة في تطبيقك
                      // يجب أن تحتوي هذه العملية على وظيفة setState() إذا كنت تريد إعادة تجديد واجهة المستخدم لعرض الصورة
                    }
                  },
                  child:  Text("${translateDataBase("أضف", " Add ")}"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _nameController.clear();
            _nationalIdController.clear();
            _addressController.clear();
            _productNameController.clear();
            _descriptionController.clear();
            // Add more controllers if you have additional text fields
          }
        },
        label: const Text('Submit',style: TextStyle(color: Colors.white),),
        icon: const Icon(Icons.add,color: Colors.white,),
        backgroundColor: AppColors.mainColor,
      ),
    );
  }
}
