
import 'apiBasehelper.dart';
ApiBaseHelper apiBaseHelper = ApiBaseHelper();
class ApiService {
 static const String baseUrl = "https://developmentalphawizz.com/goat_farm/app/v1/api/";
  static const String imageUrl = "https://developmentalphawizz.com/goat_farm/";
 //  static const String userTypeApi = baseUrl+'user_type';
  static const String register = baseUrl+'register_buyer';
  static const String login = baseUrl+'login';
  static const String updateUrl = baseUrl+'update_profile';
  static const String  getCatUrl = baseUrl+'product_categories';
  static const String  getSliderApi = baseUrl+'get_slider_images';
  static const String  getSubCatUrl = baseUrl+'product_subcategories';
  static const String  getPrivecyUrl = baseUrl+'get_settings';
}



