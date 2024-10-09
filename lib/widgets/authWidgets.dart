import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

// Sign Up Page Widgets
SizedBox passwordWidget(
    bool obscurePassword, Function isObscurePassword, BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      obscureText: obscurePassword,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                isObscurePassword();
              },
              icon: obscurePassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility))),
    ),
  );
}

SizedBox emailWidget({Function? validateEmail, required BuildContext context}) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      onChanged: (value) {
        validateEmail?.call();
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
        hintText: 'E-Mail',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    ),
  );
}

Row genderWidget(String gender, Function isGender, BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            isGender('Male');
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: gender == 'Male'
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
              border: Border.all(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24)),
            ),
            child: Center(
              child: Text(
                'Male',
                style: TextStyle(
                    color: gender == 'Male'
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onTertiary),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            isGender('Female');
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: gender == 'Female'
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
              border: Border.all(color: Theme.of(context).colorScheme.tertiary),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: Center(
              child: Text(
                'Female',
                style: TextStyle(
                    color: gender == 'Female'
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onTertiary),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

SizedBox confirmPasswordWidget(bool obscureConfirmPassword,
    Function isObscureConfirmPassword, BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      obscureText: obscureConfirmPassword,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          hintText: 'Confirm Password',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                isObscureConfirmPassword();
              },
              icon: obscureConfirmPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility))),
    ),
  );
}

SizedBox dobWidget(BuildContext context, Function isDob, String dob) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: GestureDetector(
      onTap: () async {
        final date = await showDatePickerDialog(
          context: context,
          initialDate: DateTime.now(),
          minDate: DateTime(1950),
          maxDate: DateTime.now(),
          daysOfTheWeekTextStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          leadingDateTextStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          enabledCellsTextStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          currentDateTextStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          disabledCellsTextStyle:
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        );

        if (date != null) {
          isDob(date.toString());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dob.isNotEmpty ? dob.substring(0, 10) : 'Date of Birth',
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.tertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

SizedBox nameWidget(BuildContext context) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
        hintText: 'Name',
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    ),
  );
}

SizedBox commentWidget(
    BuildContext context,
    List<Map<String, dynamic>> comments,
    TextEditingController commentController,
    Function addComment) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      controller: commentController,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          hintText: 'Add a comment',
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                if (commentController.text.isNotEmpty) {
                  addComment(commentController.text);
                  commentController.clear();
                }
              },
              icon: Icon(
                Icons.send,
                color: Theme.of(context).primaryColor,
              ))),
    ),
  );
}
