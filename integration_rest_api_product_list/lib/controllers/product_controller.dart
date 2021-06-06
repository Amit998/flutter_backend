import 'package:get/state_manager.dart';
import 'package:integration_rest_api_product_list/models/product_list.dart';
import 'package:integration_rest_api_product_list/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  var productList = List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);

    try {
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {} finally {
      isLoading(false);
    }
  }
}
