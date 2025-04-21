class AppStrings {
  AppStrings._();

  static const String appName = "MilkRide";

  // signin
  static const String signInResponseSuccess = "Otp sent successfully";
  static const String signInResponseError = "error";
  static const String signInTitle = "Login/Sign up";
  static const String signInSubTitle = "Please enter your registered details.";
  static const String mobileNum = "Mobile Number";

  // resend
  static const String resendResponseSuccess = "OTP sent successfully.";
  static const String resendResponseError = "error";

  // register
  static const String registerAccountCreatedSuccess =
      "Customer created successfully";
  static const String registerAccountCreatedAlready =
      "Customer already exists with this mobile number.";
  static const String selectedAreaIssue =
      "Selected area does not have an associated hub.";

  // otp-check
  static const String loginSuccess = "Login successfully";
  static const String invalidOtp = "Invalid OTP";
  static const String notRegistered = "Please signup first";
  static const String otpShared = "We have shared an OTP on ";

  //
  static const String otpLenth = "Otp length must be 4 digit";
  static const String mobileNoLenth = "mobile number must be 10 digit.";

  // register page
  static const String registerAppbarText = "Signup Process";
  static const String success = "success";

  // address detail page
  static const String addessTitle = "Address Details";
  static const String addessHouseHint = "C - 202";
  static const String addessHouselabel = "House Number";
  static const String addessFloorHint = "2nd floor";
  static const String addessFloorlabel = "Floor (optional)";
  static const String addessSocietyHint = "Search location here";
  static const String addessSocietylabel = "Society Name";
  static const String addessLandmarkHint = "near hdfc bank";
  static const String addessLandmarklabel = "Landmark";
  static const String addessCityHint = "Select your city";
  static const String addessCitylabel = "Region/City";
  static const String addessAreaHint = "Select your Area";
  static const String addessArealabel = "Select area";
  static const String addessPinCodeHint = "Please enter your pincode";
  static const String addessPinCodelabel = "Pin Code";
  static const String addessPickCityFirst = "Select city first";
  static const String addessAreaBottomSheetTitle = "Please select your Area";
  static const String addessCityBottomSheetTitle = "Please select your city";

  // personal detail page
  static const String personDetailTitle = "Personal Details";
  static const String personNameLable = "Name / Business Name : ";
  static const String personNameHint = "what's your good name ?";
  static const String personEmailLable = "Email Address (Optional)";
  static const String personEmailHint = "xyz@gmail.com";
  static const String personGender = "Gender";
  static const String personSelectGender = "Please select a gender";
  static const String personGenderMale = "Male";
  static const String personGenderFemale = "Female";
  static const String personGenderOther = "Other";

  // refer page
  static const String referBottomSheetTitle = "How did you find us? (optional)";
  static const String referCodeHint = "Gekkj#";
  static const String referCodeLable = "Referral Code (optional)";
  static const String referAgentCodeHint = "Agent code here!";
  static const String referAgentCodeLable = "Agent Code (optional)";
  static const String referSourceHint = "Select source";

  // home
  static const String homeSuccess = "Home Page.";
  static const String homeSnacSuccess = "Welcome to MilkRide";
  static const String homeFailAuth = "Unauthorized";
  static const String homeFailAuthSanc =
      "Some Device Related Data Not Properly Fetch or Auth Token Unexpectedly Deleted, logout now and try again.";

  // Drawer part
  static const String profilePrepaid = "Prepaid";
  static const String profilePostpaid = "Postpaid";
  static const String profileTileMyProfile = "My Profile";
  static const String profileTilePref = "My Preference";
  static const String profileTileCart = "My Cart";
  static const String profileTileSubmission = "My Submission";
  static const String profileTileOrder = "My Order";
  static const String profileTileInvoice = "Invoice History";
  static const String profileTileHelp = "Help";
  static const String appVersion = "Version : 1.0.0";

  // category
  static const String categoryTitle = "Categories";
  static const String viewAll = "View All";
  static const String categoryPageTitle = "View All Categories";
  static const String allCategorySuccess = "Categories list.";
  static const String categoryProductSuccess = "Category products list.";

  // category product
  static const String categoryProctTitle = "Category Products";
  static const String prodDetailTitle = "Product Detail";

  // new arival
  static const String newArrivalTitle = "New Arrival";

  // Best Seller
  static const String bestSellerTitle = "Best Sellers";

  // Seasonal
  static const String seasonalTitle = "Seasonal";

  // Profile
  static const String profileTitle = "My Profile";
  static const String profileLogout = "Log Out";
  static const String profileVerify = "verified by";
  static const String profileEmail = "Email Address";
  static const String profileEmailNotFound = "Email not found";
  static const String profileMobile = "Mobile Number";
  static const String profileAddress = "Registered Address";
  static const String profileHub = "Hub Name";
  static const String profilereferCode = "Refferal Code";
  static const String profilereferCodeNotFound = "Refferal code not found.";
  static const String profileArea = "Area Name";
  static const String profileWallet = "Wallet Balance";
  static const String profileAmount = "Reserved Amount";
  static const String profileDelivery = "Delivery Boy";
  static const String profileClipBoard = "Referral Code Copied!";
  static const String profileClipBoardTitle = "Copied!";

  // error part
  static const String unExpectedError = "Something went wrong.";
  static const String error = "Please check your internet connection.";

  // success cart
  static const String cartPageTitle = "My Cart";
  static const String qtyUpdateSuccess =
      "Cart package quantity updated successfully.";
  static const String cartItemRemoveSuccess = "Remove cart item successfully";
  static const String cartUpdateSuccess = "Your cart updated successfully";
  static const String subscriptionSuccess =
      "Subscription created successfully.";
  static const String subscriptionFail = "Subscription failed.";
  static const String cartUpdateFail = "Error occured in your cart update.";
  static const String cartItemRemoveFail = "Error occured in remove cart item.";
  static const String qtyUpdateFail =
      "Error occured in cart package quantity update.";

  // cart page
  static const String orderSectionTitle = "Order Details";
  static const String orderSubTotal = "Sub Total";
  static const String orderDeliveryCharges = "Delivery Charges";
  static const String orderAmountTotal = "Total amount";
  static const String orderDeliveryAddress = "Delivery Address";
  static const String orderPayableAmount = "Payable Amount";
  static const String orderPlaceOrder = "Place Order";
  static const String orderUpdate = "Update Quantity";

  // subscribe page
  static const String subscribePageTitle = "Subscription";

  // button part
  static const String otpButtonText = "Enter OTP";
  static const String resendOtpButtonText = "Resend Otp";
  static const String otpVerifyButtonText = "Verify OTP";
  static const String prevButtonText = "Prev";
  static const String nextButtonText = "Next";
  static const String submit = "Submit";
  static const String login = "Login";

  // core
  static const String appPointId = "dairydash";

  // product option bottom sheet
  static const String chooseDeliveryType = "Choose Delivery Type";
  static const String purchaseType = "Purchased for";
  static const String packNotExist = "Package not available";
  static const String addToCart = "Add to cart";
  static const String quantity = "Quantity :";
  static const String morning = "morning";
  static const String evening = "evening";
  static const String itemTotal = "Item Total";
  static const String option = "Option";
  static const String mustTry = "Must Try";
  static const String buyOnce = "Buy Once";
  static const String subscribe = "Subscribe";

  // order
  static const String orderSuccess = "Order placed successfully.";
  static const String orderCancel = "Order package cancelled";
  static const String orderFail = "Order Failed.";
  static const String orderPageTitle = "My Order";
  static const String orderDetail = "Order Details";
  static const String noOrderFound = "No Order Founds.";
  static const String orderFound = "Orders page.";

  // subscription
  static const String deliveryType = "Delivery Type";
  static const String deliverySchedule = "Delivery Schedule";
  static const String chooseDate = "Choose Date";
  static const String startDate = "Start Date";
  static const String endDate = "End Date";
  static const String dayWise = "day_wise";
  static const String dayWiseCap = "Day wise";
  static const String everyDay = "every_day";
  static const String everyDayCap = "Every Day";
  static const String every3Day = "every_3_day";
  static const String every3DayCap = "Every 3 Day";
  static const String alternateDay = "alternate_day";
  static const String alternateDayCap = "Alternate Day";

  static const String deliverOn = "🛵 Deliver on";
  static const String deliverd = "delivered";
  static const String selectReason = "Select Reason";
  static const String reason = "Reason";
  static const String reasonSelectTap = "Tap to select reason";
  static const String reasonSelect = "Please select a reason";
  static const String cancel = "Cancel";
  static const String delete = "Delete";
  static const String subcription = "subcription";

  static const String continueShopping = "Continue Shopping";
  static const String thankYou = "Thank You !!!";
  static const String atLeastOne = "Please select at least one day quantity.";
  static const String selectSchedule = "Please select schedule type.";
  static const String selectBothDate = "Please select both start and end date.";

  // list of days
  static const List<String> weekdays = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
}
