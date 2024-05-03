import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.schoolNum,
              prefixIcon: Icon(Iconsax.book),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          //Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //Signup Button

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, //=> Get.to(() => const VerifyEmailScreen()),
                child: const Text(TTexts.createAccount)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
