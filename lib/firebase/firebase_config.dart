import 'package:shared_preferences/shared_preferences.dart';

class OutFittedApp{
  static const String appName = 'OutFitted';

  static SharedPreferences sharedPreferences;

  // firestore collections
  static final String collectionCustomer = 'customers';
  static final String collectionOrders = 'orders';
  static final String customerCartList = 'customerCart';
  static final String subCollectionAddress = 'customerAddress';


  static final String customerName = 'name';
  static final String customerEmail = 'email';
  static final String customerPhotoUrl = 'photoUrl';
  static final String customerUID = 'uid';
  static final String customerAvatarUrl = 'url';
}
