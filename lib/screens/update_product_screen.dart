import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.productId});
  final String productId;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: const InputDecoration(
                hintText: 'Name', labelText: 'Product Name'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Unit Price', labelText: 'Unit Price'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total Price', labelText: 'Total Price'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTEController,
            decoration: const InputDecoration(
                hintText: 'Image', labelText: 'Product Image'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTEController,
            decoration: const InputDecoration(
                hintText: 'Product code', labelText: 'Product Code'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Product Code';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Quantity'),
            validator: (String? value){
              if(value==null||value.isEmpty){
                return 'Enter a valid Value';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          _inProgress?Center(
            child: RefreshProgressIndicator(),
          ):
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _onTapAddProductButton,
            child: const Text('UPDATE'),
          )
        ],
      ),
    );
  }

  void _onTapAddProductButton() {
    if(_formKey.currentState!.validate()){
      updateProduct();
    }
  }
  Future<void> updateProduct() async{
    _inProgress = true;
    setState(() {});
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.productId}');
    Map<String, dynamic> requestBody = {
      "Img": _imageTEController.text,
      "ProductCode": _codeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty":_quantityTEController.text,
      "TotalPrice":_totalPriceTEController.text,
      "UnitPrice":_unitPriceTEController.text
    };
    Response response= await post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200)
    {
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product Updated Successfully!!!')));
      Navigator.of(context).pop(true);
    }
    _inProgress= false;
    setState(() {});
  }
  void _clearTextField(){
    _productNameTEController.clear();
    _quantityTEController.clear();
    _totalPriceTEController.clear();
    _unitPriceTEController.clear();
    _imageTEController.clear();
    _codeTEController.clear();
  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _quantityTEController.dispose();
    _totalPriceTEController.dispose();
    _unitPriceTEController.dispose();
    _imageTEController.dispose();
    _codeTEController.dispose();
    super.dispose();
  }
}