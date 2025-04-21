import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:milkride/core/constant/app_colors.dart';
import 'package:milkride/core/constant/app_strings.dart';
import 'package:milkride/core/routes/routes_name.dart';
import 'package:milkride/feature/auth/domain/entity/register_region.dart';
import 'package:milkride/feature/auth/domain/entity/register_source.dart';
import 'package:milkride/feature/auth/domain/usecase/register_usecase.dart';
import 'package:milkride/feature/auth/domain/usecase/signup_data_usecase.dart';
import 'package:milkride/feature/auth/presentaion/cubit/auth/auth_cubit.dart';
import 'package:milkride/feature/auth/presentaion/cubit/signup/sigup_data_cubit.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/address_detail_page.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/personal_detail_page.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/refer_page.dart';
import 'package:milkride/feature/auth/presentaion/screen/register/widgets/register_appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RegisterScreen extends StatefulWidget {
  final SignupParam signupParam;
  const RegisterScreen({super.key, required this.signupParam});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController houseNoController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController societyController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController refercodeController = TextEditingController();
  final TextEditingController agentcodeController = TextEditingController();
  final PageController _pageController = PageController();
  Source source = Source();
  Region city = Region();
  Region area = Region();
  String gender = "";
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    context
        .read<SignupDataCubit>()
        .getSignupDetail(signupParam: widget.signupParam);
  }

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
      });
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<SignupDataCubit, SigupDataState>(builder: (context, state) {
      if (state is SignupDataLoaded) {
        return Column(children: [
          RegisterAppBar(
              title: AppStrings.registerAppbarText,
              onPressed: () {
                Get.offAllNamed(RoutesName.login);
              }),
          Expanded(
              child: ListView(children: [
            Center(
                child: GestureDetector(
                    onTap: _prevPage,
                    child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 3,
                        effect: WormEffect(
                            activeDotColor: AppColors.activeIconColor,
                            dotColor: AppColors.inactiveIconColor,
                            dotHeight: 8.h,
                            spacing: 10.w,
                            dotWidth: 0.25.sw),
                        onDotClicked: (index) {
                          if (index < _currentPage) {
                            setState(() {
                              _currentPage = index;
                            });
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 50),
                                curve: Curves.ease);
                          }
                        }))).paddingOnly(bottom: 20.h),
            SizedBox(
                height: 0.8.sh,
                child: Form(
                    child: PageView(
                        controller: _pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                      PersonDetailPage(
                          onPrev: _prevPage,
                          selectedGender: gender,
                          emailController: emailController,
                          nameController: nameController,
                          onNext: _nextPage,
                          onGenderSelected: (selectedGender) {
                            setState(() {
                              gender = selectedGender;
                            });
                          }),
                      AddressDetailPage(
                          onCityChanged: (newCity) {
                            setState(() {
                              city = newCity;
                              area = Region();
                            });
                          },
                          onAreaChanged: (newArea) {
                            setState(() {
                              area = newArea;
                            });
                          },
                          signupDataResponse: state.signupDataResponse,
                          houseNoController: houseNoController,
                          floorController: floorController,
                          societyController: societyController,
                          city: city,
                          area: area,
                          onNext: _nextPage,
                          pincodeController: pincodeController,
                          landmarkController: landmarkController),
                      ReferPage(
                          onSubmit: () {
                            context.read<AuthCubit>().registerUser(
                                registerParam: RegisterParam(
                                    mobileNumber:widget.signupParam.mobileNumber,
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    sourceId: source.id.toString(),
                                    areaId: area.id.toString(),
                                    houseNo: houseNoController.text.trim(),
                                    floor: floorController.text.trim(),
                                    society: societyController.text.trim(),
                                    landmark: landmarkController.text.trim(),
                                    latitude: "12.954585400000001",
                                    longitude: "75.3810601",
                                    pincode: pincodeController.text.trim(),
                                    regionId: city.id.toString(),
                                    userId: widget.signupParam.userId,
                                    customerReferrerCode:refercodeController.text.trim(),
                                    agentCode: agentcodeController.text.trim(),
                                    deliveryType: "morning",
                                    gender: gender));
                          },
                          sources: state.signupDataResponse.data!.sources!,
                          agentcodeController: agentcodeController,
                          refercodeController: refercodeController,
                          onFindUsSelected: (newSource) {
                            source = newSource;
                            setState(() {});
                          })
                    ]))),
          ]).paddingSymmetric(horizontal: 20.w))
        ]);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }));
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    houseNoController.dispose();
    floorController.dispose();
    societyController.dispose();
    landmarkController.dispose();
    pincodeController.dispose();
    refercodeController.dispose();
    agentcodeController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
