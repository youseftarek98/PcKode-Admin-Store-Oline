
import 'package:admin/controller/auth/verifycodesignup-controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/view/widget/auth/custom_text_body_auth.dart';
import 'package:admin/view/widget/auth/custom_text_titel_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';


class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgoundcolor,
          elevation: 0.0,
          title: Text(
            'Verification Code',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColor.grey,
                ),
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                    child: ListView(
                      children: [
                        const CustomTextTitelAuth(text: 'Check Code'),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          text:
                              'Please Enter The Digit Code Send To ${controller.email}',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        OtpTextField(
                          fieldWidth: 50,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            controller.reSend();
                          },
                          child: const Center(
                              child: Text(
                            'Resend Verfiy code',
                            style: TextStyle(
                                color: AppColor.primaryColr, fontSize: 20),
                          )),
                        )
                      ],
                    )))));
  }
}
