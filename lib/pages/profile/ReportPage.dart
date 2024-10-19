import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 37),
                      const Center(
                        child: Column(
                          children: [
                            Text(
                              'With you, we become better!',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'If you encounter any issues using the app or find any errors, please describe them, and we will do our best to assist you as quickly as possible.',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 222,
                        child: Stack(
                          children: [
                            TextField(
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
                                  borderRadius: BorderRadius.circular(24)
                                ),
                                hintText: 'Describe the problem',
                                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.secondary)
                              ),
                            ),
                            Positioned(
                              left: 8,
                              bottom: 16,
                              child: GestureDetector(
                                onTap: () {
                                  // Add attachment logic here
                                },
                                child: Icon(
                                  Icons.attach_file,
                                  color: Theme.of(context).colorScheme.secondary,
                                  size: 28,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: GestureDetector(
                onTap: () {
                  // Add your onTap logic here
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Center(
                    child: Text(
                      'Send',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0),
        child: SvgPicture.asset('assets/create poll/back_button.svg'),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    title: const Text(
      'Report a problem',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
