import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

// Sign Up Page Widgets
SizedBox passwordWidget(bool obscurePassword, Function isObscurePassword) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      obscureText: obscurePassword,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          hintText: 'Password',
          hintStyle: TextStyle(
            color: const Color(0xff979C9E).withOpacity(0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xff979C9E).withOpacity(0.4)),
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff090A0A)),
            borderRadius: BorderRadius.circular(24),
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

SizedBox emailWidget() {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
        hintText: 'E-Mail',
        hintStyle: TextStyle(
          color: const Color(0xff979C9E).withOpacity(0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xff979C9E).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff090A0A)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
}

Row genderWidget(String gender, Function isGender) {
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
              color: gender == 'Male' ? const Color(0xff317C7D) : Colors.white,
              border: gender == 'Male'
                  ? Border.all(color: const Color(0xff317C7D))
                  : Border.all(color: const Color(0xff979C9E).withOpacity(0.4)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24)),
            ),
            child: Center(
              child: Text(
                'Male',
                style: TextStyle(
                    color: gender == 'Male'
                        ? Colors.white
                        : const Color(0xff979C9E).withOpacity(0.8)),
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
              color:
                  gender == 'Female' ? const Color(0xff317C7D) : Colors.white,
              border: gender == 'Female'
                  ? Border.all(color: const Color(0xff317C7D))
                  : Border.all(color: const Color(0xff979C9E).withOpacity(0.4)),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: Center(
              child: Text(
                'Female',
                style: TextStyle(
                    color: gender == 'Female'
                        ? Colors.white
                        : const Color(0xff979C9E).withOpacity(0.8)),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

SizedBox confirmPasswordWidget(
    bool obscureConfirmPassword, Function isObscureConfirmPassword) {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      obscureText: obscureConfirmPassword,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
          hintText: 'Confirm Password',
          hintStyle: TextStyle(
            color: const Color(0xff979C9E).withOpacity(0.8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xff979C9E).withOpacity(0.4)),
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff090A0A)),
            borderRadius: BorderRadius.circular(24),
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
          daysOfTheWeekTextStyle: const TextStyle(
            color: Color(0xff090A0A),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          leadingDateTextStyle: const TextStyle(
            color: Color(0xff090A0A),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          enabledCellsTextStyle: const TextStyle(
            color: Color(0xff090A0A),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          currentDateTextStyle: const TextStyle(
            color: Color(0xff090A0A),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          disabledCellsTextStyle: TextStyle(
            color: const Color(0xff090A0A).withOpacity(0.4),
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        );

        if (date != null) {
          isDob(date.toString());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff979C9E).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dob.isNotEmpty ? dob.substring(0, 10) : 'Date of Birth',
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xff979C9E).withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

SizedBox nameWidget() {
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
        hintText: 'Name',
        hintStyle: TextStyle(
          color: const Color(0xff979C9E).withOpacity(0.8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xff979C9E).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff090A0A)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
}
