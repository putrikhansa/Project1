import 'package:flutter/material.dart';
import 'package:project1/models/product_dummy_model.dart';
import 'package:project1/services/product_dummy_service.dart';
import 'product_detail_dummy_screen.dart';

class ProductListDummyScreen extends StatefulWidget {
  const ProductListDummyScreen({Key? key}) : super(key: key);

  @override
  State<ProductListDummyScreen> createState() => _ProductListDummyScreenState();
}

class _ProductListDummyScreenState extends State<ProductListDummyScreen> {
  List<ProductDummy> products = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await ProductService.getProducts();
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Gagal memuat produk: $e";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Produk"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(child: Text(errorMessage!))
              : RefreshIndicator(
                  onRefresh: _loadProducts,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final p = products[index];
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            p.thumbnail,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(p.title),
                          subtitle: Text('Rp ${p.price} - ${p.brand}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetailDummyScreen(product: p),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
