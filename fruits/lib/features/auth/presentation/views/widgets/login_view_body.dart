import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/constants.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits/features/auth/presentation/views/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        /// Login Form Body
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              obscureText: true,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: AppColors.textFieldSuffixIconColor,
              ),
            ),
            const SizedBox(height: 16.0),

            /// Forget Password
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor),
              ),
            ),
            const SizedBox(height: 33.0),

            /// Login Button
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(height: 33.0),

            /// TextSpan Widget for dont have an account
            const DontHaveAnAccountWidget(),
            const SizedBox(height: 33.0),
            const OrDivider(),
            const SizedBox(height: 33.0),

            /// Social Login Buttons
            SocialLoginButton(
              icon: Assets.imagesGoogleIcon,
              label: 'تسجيل دخول بواسطة جوجل',
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
            SocialLoginButton(
              icon: Assets.imagesApplIcon,
              label: 'تسجيل دخول بواسطة أبل',
              onPressed: () {},
            ),
            const SizedBox(height: 16.0),
            SocialLoginButton(
              icon: Assets.imagesFacebookIcon,
              label: 'تسجيل دخول بواسطة فيسبوك',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
