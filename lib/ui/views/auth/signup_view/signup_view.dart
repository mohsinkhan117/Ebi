import 'package:ebi/app_shell.dart';
import 'package:ebi/core/helper_functions/helper_function.dart';
import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/theme/sizes.dart';
import 'package:ebi/core/utils/device_utils.dart';
import 'package:ebi/ui/views/auth/signin_view/signin_view.dart';
import 'package:ebi/ui/views/auth/signup_view/signup_view_model.dart';
import 'package:ebi/ui/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  static const String routeName = '/signUp_view';
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => SignupView(),
      settings: RouteSettings(name: routeName),
    );
  }

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Center(
          child: Consumer<SignupViewModel>(
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
                      'Create an account',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      textAlign: TextAlign.center,
                      'Enter your email/Phone number to sign up',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: AppSizes.defaultSpace),
                    MyTextFormField(controller: model.signUpController),

                    MyButton(
                      textChild: 'Continue',
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => AppShell()),
                          (route) => false,
                        );
                      },
                    ),

                    SizedBox(height: AppSizes.defaultSpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account,'),
                        TextButton(
                          onPressed: () {
                            HelperFunctions.navigateToScreen(
                              context,
                              SignInView(),
                            );
                          },
                          child: Text(
                            'Sign in',
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
