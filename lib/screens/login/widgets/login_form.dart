import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health/screens/signup/signup.dart';
import 'package:health/utils/constants/sizes.dart';
import 'package:health/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            //email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.eye_slash),
                labelText: TTexts.password,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            const SizedBox(height: TSizes.spaceBtwSections),

            //Sign in button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, //=> Get.to(() => const NavigationMenu()),
                    child: const Text(TTexts.signIn))),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Create Accout Button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen(),
                        transition: Transition.downToUp,
                        duration: Duration(milliseconds: 750)),
                    child: const Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
