import 'package:flutter/material.dart';
import 'package:high_school/Subjects/utils/app_colors.dart';
import 'package:high_school/community/utils/app_constants.dart';
import 'package:high_school/core/localization/app_localization.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Icon(Icons.arrow_back_ios_sharp),
                Spacer(),
                Text(
                  "Eol",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
             Center(
              child: Text(
                tr(AppConstants.contactTxt),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                     Row(
                      children: [
                        Expanded(
                          child: CustomContactTextFormField(
                            hintText: tr(AppConstants.firstNameTxt),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: CustomContactTextFormField(
                            hintText: tr(AppConstants.secondNameTxt),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     CustomContactTextFormField(
                      hintText: tr(AppConstants.fullNameTxt),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                     CustomContactTextFormField(
                      hintText: tr(AppConstants.messageName),
                      isMessage: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: buildSendButton())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomContactTextFormField extends StatelessWidget {
  const CustomContactTextFormField(
      {super.key, required this.hintText, this.isMessage = false});
  final String hintText;
  final bool isMessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 18,
      cursorOpacityAnimates: true,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 18),
        contentPadding: isMessage
            ? const EdgeInsets.symmetric(horizontal: 14, vertical: 98)
            : const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        fillColor: AppColors.yellow,
        filled: true,
        border: getBorderSyle(),
        enabledBorder: getBorderSyle(),
        focusedBorder: getBorderSyle(),
      ),
    );
  }
}

InputBorder getBorderSyle() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: AppColors.yellow,
      ));
}

Widget buildSendButton() {
  return GestureDetector(
    child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.yellow, borderRadius: BorderRadius.circular(14)),
        child:  Text(
          tr(AppConstants.send),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )),
  );
}
