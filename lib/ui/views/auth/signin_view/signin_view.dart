import 'package:ebi/core/helper_functions/helper_function.dart';
import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/theme/sizes.dart';
import 'package:ebi/core/utils/device_utils.dart';
import 'package:ebi/ui/views/auth/signin_view/signin_view_model.dart';
import 'package:ebi/ui/views/auth/signup_view/signup_view.dart';
import 'package:ebi/ui/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatelessWidget {
  static const String routeName = '/signIn_view';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => SignInView(),

      settings: RouteSettings(name: routeName),
    );
  }

  SignInView({super.key});
  final sizedBox = SizedBox(height: AppSizes.spaceBtwItems);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Center(
          child: Consumer<SigninViewModel>(
            builder: (context, model, child) {
              return Form(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: DeviceUtils.getScreenHeight(context) * 0.27,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Sign in with Sallah account',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      textAlign: TextAlign.center,
                      'Enter your phone and email to sign in',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    sizedBox,
                    MyTextFormField(controller: model.signInController),

                    MyButton(textChild: 'Continue', onTap: () {}),
                    sizedBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account,"),
                        TextButton(
                          onPressed: () {
                            HelperFunctions.navigateToScreen(
                              context,
                              SignupView(),
                            );
                          },
                          child: Text(
                            'Create one',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: DeviceUtils.getScreenHeight(context) * 0.27,
                    ),
                    PrivacyPolicyText(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ================= Text Form Field ============
class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const MyTextFormField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        controller: controller,
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid phone number or email';
              }
              return null;
            },
        decoration: InputDecoration(
          hintText: 'email@domain.com',

          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderPrimary),
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMd),
          ),
        ),
      ),
    );
  }
}

// ============= privacy Policy Text ===================
class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'By clicking on continue, you agree to our ',
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.darkGrey),
          ),
          TextSpan(text: ' Terms of Service '),
          TextSpan(
            text: ' and ',
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.darkGrey),
          ),
          TextSpan(text: 'Privacy Policy'),
        ],
      ),
    );
  }
}
