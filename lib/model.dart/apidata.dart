class KalyanApi {
  String? responseCode;
  String? responseMessage;
  List<ProductOfMonthListing>? productOfMonthListing;
  List<LastMonthWinner>? lastMonthWinner;
  Brand? brand;
  List<BrandListing>? brandListing;

  KalyanApi(
      {this.responseCode,
      this.responseMessage,
      this.productOfMonthListing,
      this.lastMonthWinner,
      this.brand,
      this.brandListing});

  KalyanApi.fromJson(Map<String, dynamic> json) {
    this.responseCode = json["responseCode"];
    this.responseMessage = json["responseMessage"];
    this.productOfMonthListing = json["product_of_month_listing"] == null
        ? null
        : (json["product_of_month_listing"] as List)
            .map((e) => ProductOfMonthListing.fromJson(e))
            .toList();
    this.lastMonthWinner = json["last_month_winner"] == null
        ? null
        : (json["last_month_winner"] as List)
            .map((e) => LastMonthWinner.fromJson(e))
            .toList();
    this.brand = json["brand"] == null ? null : Brand.fromJson(json["brand"]);
    this.brandListing = json["brand_listing"] == null
        ? null
        : (json["brand_listing"] as List)
            .map((e) => BrandListing.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["responseCode"] = this.responseCode;
    data["responseMessage"] = this.responseMessage;
    if (this.productOfMonthListing != null)
      data["product_of_month_listing"] =
          this.productOfMonthListing?.map((e) => e.toJson()).toList();
    if (this.lastMonthWinner != null)
      data["last_month_winner"] =
          this.lastMonthWinner?.map((e) => e.toJson()).toList();
    if (this.brand != null) data["brand"] = this.brand?.toJson();
    if (this.brandListing != null)
      data["brand_listing"] =
          this.brandListing?.map((e) => e.toJson()).toList();
    return data;
  }
}

class BrandListing {
  String? brandId;
  String? brandName;
  String? brandImagePath;
  String? brandDescription;

  BrandListing(
      {this.brandId,
      this.brandName,
      this.brandImagePath,
      this.brandDescription});

  BrandListing.fromJson(Map<String, dynamic> json) {
    this.brandId = json["brand_id"];
    this.brandName = json["brand_name"];
    this.brandImagePath = json["brand_image_path"];
    this.brandDescription = json["brand_description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["brand_id"] = this.brandId;
    data["brand_name"] = this.brandName;
    data["brand_image_path"] = this.brandImagePath;
    data["brand_description"] = this.brandDescription;
    return data;
  }
}

class Brand {
  String? brandId;
  String? brandName;
  String? brandImagePath;

  Brand({this.brandId, this.brandName, this.brandImagePath});

  Brand.fromJson(Map<String, dynamic> json) {
    this.brandId = json["brand_id"];
    this.brandName = json["brand_name"];
    this.brandImagePath = json["brand_image_path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["brand_id"] = this.brandId;
    data["brand_name"] = this.brandName;
    data["brand_image_path"] = this.brandImagePath;
    return data;
  }
}

class LastMonthWinner {
  String? userImage;
  String? userName;
  dynamic? userCity;

  LastMonthWinner({this.userImage, this.userName, this.userCity});

  LastMonthWinner.fromJson(Map<String, dynamic> json) {
    this.userImage = json["user_image"];
    this.userName = json["user_name"];
    this.userCity = json["user_city"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user_image"] = this.userImage;
    data["user_name"] = this.userName;
    data["user_city"] = this.userCity;
    return data;
  }
}

class ProductOfMonthListing {
  String? title;
  String? productName;
  String? productImage;
  String? brandName;
  String? brandLogoPath;
  String? productId;
  String? fromDate;
  String? toDate;
  String? contestFlag;
  String? cityName;
  String? isCurrentPom;
  String? redirectUrl;
  String? aboutUs;
  String? isFav;
  String? type;

  ProductOfMonthListing(
      {this.title,
      this.productName,
      this.productImage,
      this.brandName,
      this.brandLogoPath,
      this.productId,
      this.fromDate,
      this.toDate,
      this.contestFlag,
      this.cityName,
      this.isCurrentPom,
      this.redirectUrl,
      this.aboutUs,
      this.isFav,
      this.type});

  ProductOfMonthListing.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.productName = json["product_name"];
    this.productImage = json["product_image"];
    this.brandName = json["brand_name"];
    this.brandLogoPath = json["brand_logo_path"];
    this.productId = json["product_id"];
    this.fromDate = json["from_date"];
    this.toDate = json["to_date"];
    this.contestFlag = json["contest_flag"];
    this.cityName = json["city_name"];
    this.isCurrentPom = json["is_current_pom"];
    this.redirectUrl = json["redirect_url"];
    this.aboutUs = json["about_us"];
    this.isFav = json["is_fav"];
    this.type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["product_name"] = this.productName;
    data["product_image"] = this.productImage;
    data["brand_name"] = this.brandName;
    data["brand_logo_path"] = this.brandLogoPath;
    data["product_id"] = this.productId;
    data["from_date"] = this.fromDate;
    data["to_date"] = this.toDate;
    data["contest_flag"] = this.contestFlag;
    data["city_name"] = this.cityName;
    data["is_current_pom"] = this.isCurrentPom;
    data["redirect_url"] = this.redirectUrl;
    data["about_us"] = this.aboutUs;
    data["is_fav"] = this.isFav;
    data["type"] = this.type;
    return data;
  }
}
