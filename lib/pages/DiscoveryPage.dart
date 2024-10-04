import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
                    children: [
                      const SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          isTyping = value.isNotEmpty;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 3.0, left: 30.0, right: 30.0, bottom: 3.0),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Color(0xff979C9E)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Color(0xff979C9E)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xff979C9E)),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        prefixIcon: const Padding(
                          padding:  EdgeInsets.only(left: 13.0),
                          child:  Icon(Icons.search_sharp, color: Color(0xff979C9E), size: 24,),
                        )
                      ),
                    ),
                  ),
                ),
                if (isTyping) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTyping = false;
                      });
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff090A0A),
                      ),
                    ),
                  ),
                ],
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 34, bottom: 34, left: 24, right: 24),
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xffF6F3EE),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text('Do you love cats?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xff090A0A)),),
                  )
                ],
              ),
            )
                    ],
                  ),
          )),
    );
  }
}
