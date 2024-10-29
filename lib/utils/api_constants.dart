class APIConstants {
  static String live = "https://finegoldbullion.ca/";
  static String demo = "https://sas-fabric.com/fine/wp-json/custom/v1/";

  static String currentServer = live;

  static String fileBaseUrl = "${currentServer}wp-json/custom/v1/";
  static String apiBaseUrl = "${currentServer}wp-json/custom/v1/";
  static String noImage = "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg";

  //Urls for APIs
  static const getProducts = "products";
  static const getLivePrices = "live_prices";

}
