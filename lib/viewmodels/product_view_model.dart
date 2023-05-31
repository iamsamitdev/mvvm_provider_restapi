import 'package:flutter/foundation.dart';
import 'package:mvvm_provider_restapi/models/product_model.dart';
import 'package:mvvm_provider_restapi/utils/product_api.dart';

class ProductViewModel extends ChangeNotifier {

  final ProductApi _productApi;

  ProductViewModel(this._productApi);

  List<Product> products = [];
  Product? selectedProduct;

  Future<void> fetchProducts() async {
    try {
      products = await _productApi.getProducts();
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }

  Future<void> fetchProduct(int id) async {
    try {
      selectedProduct = await _productApi.getProduct(id);
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }

Future<void> createProduct(Product product) async {
    try {
      final createdProduct = await _productApi.createProduct(product);
      products.add(createdProduct);
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      final updatedProduct = await _productApi.updateProduct(product);
      final index = products.indexWhere((p) => p.id == updatedProduct.id);
      if (index != -1) {
        products[index] = updatedProduct;
      }
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _productApi.deleteProduct(id);
      products.removeWhere((product) => product.id == id);
      notifyListeners();
    } catch (error) {
      // Handle error
    }
  }
  
}