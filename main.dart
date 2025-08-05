import 'dart:convert';
import 'package:http/http.dart' as http;

//model Product
class Product {
  //property
  int? id;
  String? title;
  double? price;
  Map<String, dynamic>? rating;

  //constructor
  Product({this.id, this.title, this.price, this.rating});

  //method
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble();
    rating = json['rating'];
  }
}

//service / fungsi untuk getProduct
Future<List<Product>> getProduct() async {
  var url = Uri.parse('https://fakestoreapi.com/products');

  final response = await http.get(url);

  final List body = json.decode(response.body);

  return body.map((e) => Product.fromJson(e)).toList();
}

void main() async {
  List<Product> products = await getProduct();

 
  for (var product in products) {
    print(product.id);
    print(product.title);
    print(product.price);
     print(product.rating?['rate']);
     print(product.rating?['count']);
    print('=========');
  }
}
