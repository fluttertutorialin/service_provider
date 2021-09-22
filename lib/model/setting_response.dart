class SettingResponse {
  String? appName;
  String? enableStripe;
  String? defaultTax;
  String? defaultCurrency;
  String? fcmKey;
  String? enablePaypal;
  String? defaultTheme;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? secondDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;
  String? googleMapsKey;
  String? mobileLanguage;
  String? appVersion;
  String? enableVersion;
  String? currencyRight;
  int? defaultCurrencyDecimalDigits;
  String? enableRazorpay;
  String? homeSection_1;
  String? homeSection_2;
  String? homeSection_3;
  String? homeSection_4;
  String? homeSection_5;
  String? homeSection_6;
  String? homeSection_7;
  String? homeSection_8;
  String? homeSection_9;
  String? homeSection_10;
  String? homeSection_11;
  String? homeSection_12;

  SettingResponse({
    this.appName,
    this.enableStripe,
    this.defaultTax,
    this.defaultCurrency,
    this.fcmKey,
    this.enablePaypal,
    this.defaultTheme,
    this.mainColor,
    this.mainDarkColor,
    this.secondColor,
    this.secondDarkColor,
    this.accentColor,
    this.accentDarkColor,
    this.scaffoldDarkColor,
    this.scaffoldColor,
    this.googleMapsKey,
    this.mobileLanguage,
    this.appVersion,
    this.enableVersion,
    this.currencyRight,
    this.defaultCurrencyDecimalDigits,
    this.enableRazorpay,
    this.homeSection_1,
    this.homeSection_2,
    this.homeSection_3,
    this.homeSection_4,
    this.homeSection_5,
    this.homeSection_6,
    this.homeSection_7,
    this.homeSection_8,
    this.homeSection_9,
    this.homeSection_10,
    this.homeSection_11,
    this.homeSection_12,
  });

  SettingResponse.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    enableStripe = json['enable_stripe'];
    defaultTax = json['default_tax'];
    defaultCurrency = json['default_currency'];
    fcmKey = json['fcm_key'];
    enablePaypal = json['enable_paypal'];
    defaultTheme = json['default_theme'];
    mainColor = json['main_color'];
    mainDarkColor = json['main_dark_color'];
    secondColor = json['second_color'];
    secondDarkColor = json['second_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldDarkColor = json['scaffold_dark_color'];
    scaffoldColor = json['scaffold_color'];
    googleMapsKey = json['google_maps_key'];
    mobileLanguage = json['mobile_language'];
    appVersion = json['app_version'];
    enableVersion = json['enable_version'];
    currencyRight = json['currency_right'];
    defaultCurrencyDecimalDigits = json['default_currency_decimal_digits'];
    enableRazorpay = json['enable_razorpay'];
    homeSection_1 = json['home_section_1'];
    homeSection_2 = json['home_section_2'];
    homeSection_3 = json['home_section_3'];
    homeSection_4 = json['home_section_4'];
    homeSection_5 = json['home_section_5'];
    homeSection_6 = json['home_section_6'];
    homeSection_7 = json['home_section_7'];
    homeSection_8 = json['home_section_8'];
    homeSection_9 = json['home_section_9'];
    homeSection_10 = json['home_section_10'];
    homeSection_11 = json['home_section_11'];
    homeSection_12 = json['home_section_12'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['enable_stripe'] = enableStripe;
    data['default_tax'] = defaultTax;
    data['default_currency'] = defaultCurrency;
    data['fcm_key'] = fcmKey;
    data['enable_paypal'] = enablePaypal;
    data['default_theme'] = defaultTheme;
    data['main_color'] = mainColor;
    data['main_dark_color'] = mainDarkColor;
    data['second_color'] = secondColor;
    data['second_dark_color'] = secondDarkColor;
    data['accent_color'] = accentColor;
    data['accent_dark_color'] = accentDarkColor;
    data['scaffold_dark_color'] = scaffoldDarkColor;
    data['scaffold_color'] = scaffoldColor;
    data['google_maps_key'] = googleMapsKey;
    data['mobile_language'] = mobileLanguage;
    data['app_version'] = appVersion;
    data['enable_version'] = enableVersion;
    data['currency_right'] = currencyRight;
    data['default_currency_decimal_digits'] = defaultCurrencyDecimalDigits;
    data['enable_razorpay'] = enableRazorpay;
    data['home_section_1'] = homeSection_1;
    data['home_section_2'] = homeSection_2;
    data['home_section_3'] = homeSection_3;
    data['home_section_4'] = homeSection_4;
    data['home_section_5'] = homeSection_5;
    data['home_section_6'] = homeSection_6;
    data['home_section_7'] = homeSection_7;
    data['home_section_8'] = homeSection_8;
    data['home_section_9'] = homeSection_9;
    data['home_section_10'] = homeSection_10;
    data['home_section_11'] = homeSection_11;
    data['home_section_12'] = homeSection_12;
    return data;
  }
}
