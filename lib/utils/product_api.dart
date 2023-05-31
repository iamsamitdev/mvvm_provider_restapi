import 'package:mvvm_provider_restapi/models/product_model.dart';
import 'package:mvvm_provider_restapi/utils/api_client.dart';

class ProductApi {
  final ApiClient _apiClient = ApiClient();

  // ProductApi(this._apiClient);

  Future<List<Product>> getProducts() async {
    try {
      final response = await _apiClient.get('/products');
      final List<dynamic> data = response.data;
      final products = data.map((json) => Product.fromJson(json)).toList();
      return products;
    } catch (error) {
      throw Exception('Failed to get products');
    }
  }

  Future<Product> getProduct(int id) async {
    try {
      final response = await _apiClient.get('/products/$id');
      final json = response.data;
      final product = Product.fromJson(json);
      return product;
    } catch (error) {
      throw Exception('Failed to get product');
    }
  }

  Future<Product> createProduct(Product product) async {
    try {
      final response = await _apiClient.post('/products', product.toJson());
      final json = response.data;
      final createdProduct = Product.fromJson(json);
      return createdProduct;
    } catch (error) {
      throw Exception('Failed to create product');
    }
  }

  Future<Product> updateProduct(Product product) async {
    try {
      final response =
          await _apiClient.put('/products/${product.id}', product.toJson());
      final json = response.data;
      final updatedProduct = Product.fromJson(json);
      return updatedProduct;
    } catch (error) {
      throw Exception('Failed to update product');
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      await _apiClient.delete('/products/$id');
    } catch (error) {
      throw Exception('Failed to delete product');
    }
  }
}
