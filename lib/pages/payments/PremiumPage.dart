import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  String selectedPackage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: appBar(context),
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: SvgPicture.asset(
              'assets/payments/premium_background.svg',
              width: 635,
              height: 635,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get more responses',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                premiumPackage(context, '40', '\$0.99'),
                premiumPackage(context, '70', '\$1.99'),
                premiumPackage(context, '100', '\$2.99'),
                const SizedBox(
                  height: 44,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        color: Color(0xff97BDBE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text:
                              'Payment for the selected plan is charged each time you decide to purchase Premium. The fee is non-refundable. By clicking the "Proceed" button, you agree to our ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Terms of service',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: '.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget premiumPackage(BuildContext context, String total, String price) {
    return ClipRect(
        child: BackdropFilter(
      filter: selectedPackage == total
          ? ImageFilter.blur(sigmaX: 4, sigmaY: 4)
          : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPackage = total;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Color(0xff509090), width: 1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total of $total',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                price,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              selectedPackage == total
                  ? Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 1),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    )
            ],
          ),
        ),
      ),
    ));
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    leading: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset('assets/create poll/back_button.svg'),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      'Premium',
      style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
