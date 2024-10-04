import 'package:flutter/material.dart';
import 'package:surveva_app/pages/DiscoveryPage.dart';

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> with SingleTickerProviderStateMixin {
  // TODO: Get categories from API
  List<String> categories = [
    'Education & Academia',
    'Wellness & Lifestyle',
    'Business & Economic',
    'Science & Technology',
    'Global Affairs & Politics',
    'Society & Culture',
    'Philosophy & Ethical Issues',
    'Literature & Art',
    'Personal Development & Hobbies',
    'Media & Entertainment'
  ];
  List<String> selectedCategories = [];

  // TODO: Get languages from API
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
    'Japanese',
    'Korean',
    'Arabic',
    'Hindi',
    'Bengali',
    'Punjabi',
    'Urdu',
    'Indonesian',
    'Malay',
    'Thai',
    'Vietnamese',
    'Filipino',
    'Dutch',
    'Swedish',
    'Norwegian',
    'Danish',
    'Finnish',
    'Estonian',
    'Latvian',
    'Lithuanian',
    'Polish',
    'Czech',
    'Slovak',
    'Slovenian',
    'Croatian',
    'Bosnian',
    'Macedonian',
    'Romanian',
    'Bulgarian',
    'Serbian',
    'Montenegrin',
    'Albanian',
    'Maltese'
  ];
  List<String> selectedLanguages = [];

  String? languageError;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late ScrollController _scrollController;
  bool _showScrollIcon = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _showScrollIcon = false;
      });
    } else if (!_showScrollIcon) {
      setState(() {
        _showScrollIcon = true;
      });
    }
  }

  addCategory(String category) {
    if (selectedCategories.contains(category)) {
      setState(() {
        selectedCategories.remove(category);
      });
    } else {
      if (selectedCategories.length < 3) {
        setState(() {
          selectedCategories.add(category);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Personalization',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'Customize your Surveva feed',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 330,
                          child: Text(
                            'Choose 1 to 3 preferred categories that align with your interests. You can change it at any time.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.5)),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Selected categories',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${selectedCategories.length}/3',
                            style:
                                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      selectedCategoriesWidget(),
                      const SizedBox(
                        height: 48,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Language preferences',
                            style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      languagePreferencesWidget(),
                      const SizedBox(height: 12,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          spacing: 12,
                          children: selectedLanguages
                              .map((language) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedLanguages.remove(language);
                                      });
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(24),
                                            border:
                                                Border.all(color: const Color(0xff317C7D)),
                                            color: const Color(0xff317C7D)),
                                        child: Text(
                                          language,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )),
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 85,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoveryPage()));
                        },
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: selectedCategories.length == 3 && selectedLanguages.length == 3 ? const Color(0xff317C7D) : const Color(0xffF2F4F5),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: const Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                      const SizedBox(height: 16,)
                    ],
                  ),
                ),
              ),
            ),
            if (_showScrollIcon)
              Positioned(
                left: 0,
                right: 0,
                bottom: 16,
                child: SlideTransition(
                  position: _offsetAnimation,
                  child: const Icon(
                    Icons.arrow_downward_rounded,
                    size: 30,
                    color: Color(0xff317C7D),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> languagePreferencesWidget() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF7F9FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xffF7F9FA)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        errorText: languageError,
      ),
      hint: const Text('Choose'),
      value: null,
      items: languages.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? value) {
        if (value != null) {
          setState(() {
            if (selectedLanguages.contains(value)) {
              selectedLanguages.remove(value);
              languageError = null;
            } else if (selectedLanguages.length < 3) {
              selectedLanguages.add(value);
              languageError = null;
            } else {
              languageError = "Max 3 languages. Tap below to remove one.";
            }
          });
        }
      },
    );
  }

  Wrap selectedCategoriesWidget() {
    return Wrap(
        spacing: 8,
        runSpacing: 8,
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              addCategory(category);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                    color: selectedCategories.contains(category)
                        ? const Color(0xff317C7D)
                        : const Color(0xffE3E5E5)),
                color: selectedCategories.contains(category)
                    ? const Color(0xff317C7D)
                    : Colors.white,
              ),
              child: Text(
                category,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: selectedCategories.contains(category)
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          );
        }).toList());
  }
}
