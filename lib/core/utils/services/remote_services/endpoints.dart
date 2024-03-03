class EndPoints {
  static const baseUrl = "https://api.vitaparapharma.com/";

  static const userLogin = 'api/v1/auth/login';
  static const userRegister = 'api/v1/auth/register';
  static const getAllProducts = 'api/v1/public/product/main/category/';
  static const getAllProductsAuth = 'api/v1/public/product/main/category/';
  static const getProductsByCatId = 'api/v1/public/product/category/';
  static const getProductDetails = 'api/v1/user/product/';
  static const getProductsByCatIdAuth = 'api/v1/user/product/category/';
  static const getAllCategories = 'api/v1/public/category/';
  static const getAllMainCategories = 'api/v1/public/main/category/all';
  static const getCategoriesByMainId = 'api/v1/public/main/category/';
  static const wishListAdd = 'api/v1/user/wishlist/add/';
  static const wishListRemove = 'api/v1/user/wishlist/remove/';
  static const getWishList = 'api/v1/user/wishlist/my';
  static const cartAdd = 'api/v1/user/cart/update';
  static const cartRemove = 'api/v1/user/cart/remove/';
  static const getCart = 'api/v1/user/cart/my';
  static const getAllBlogs = 'api/v1/user/post/all';
  static const getAllPublicBlogs = 'api/v1/public/post/all';
  static const dislike = 'api/v1/user/dislike/';
  static const like = 'api/v1/user/like/';
  static const unLike = 'api/v1/user/unlike/';
  static const getProductReviews = 'api/v1/public/review/product/';
  static const addReview = 'api/v1/user/review/new';
  static const removeReview = 'api/v1/user/review/delete/';
  static const getNotification = 'api/v1/profile/notifications';
  static const getMyAllOrders = 'api/v1/user/order/';
  static const createOrderByCart = 'api/v1/user/order/cart/on/';
  static const getMyAddresses = 'api/v1/user/address/all';
  static const addNewAddress = 'api/v1/user/address/new';
  static const deleteAddress = 'api/v1/user/address/delete/';
  static const getCountries = 'api/v1/public/country/all';
  static const getAdvertise = 'api/v1/public/advertisement/active';
}