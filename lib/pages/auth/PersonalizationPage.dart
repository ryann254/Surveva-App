import 'dart:convert';
import 'dart:developer';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:surveva_app/functions/auth/register.dart';
import 'package:surveva_app/functions/category/getCategories.dart';
import 'package:surveva_app/models/category.model.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveva_app/providers/signUpProvider.dart';
import 'package:surveva_app/widgets/profileWidgets.dart';
import 'package:surveva_app/models/error.model.dart';
import 'package:surveva_app/config/globals.dart' as globals;
import 'package:surveva_app/config/secrets.dart' as secrets;

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage>
    with SingleTickerProviderStateMixin {
  // TODO: Get categories from API
  List<Category> categories = [];
  List<Category> selectedCategories = [];

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

  late SignUpProvider _signUpProvider;
  String? languageError;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late ScrollController _scrollController;
  bool _showScrollIcon = true;
  String country = '';
  String continent = '';

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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    });
    fetchAndStoreCategories();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
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

  Future<void> fetchAndStoreCategories() async {
    final categories = await getCategories();
    setState(() {
      this.categories = categories;
    });
  }

  void addCategory(Category category) {
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
    _signUpProvider.setCategories(selectedCategories);
  }

  void addLanguage(String? value) {
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
      _signUpProvider.setLanguage(selectedLanguages[0]);
    }
  }

  bool isCustomizationComplete() {
    return selectedCategories.length == 3 && selectedLanguages.isNotEmpty;
  }

  Future<void> askForNotificationPermission() async {
    try {
      PermissionStatus status = await Permission.notification.request();
      if (status.isGranted) {
        print('Notification permission granted');
      } else if (status.isDenied) {
        print('Notification permission denied');
      } else if (status.isPermanentlyDenied) {
        print('Notification permission permanently denied');
        // Todo: Discuss with Faisal if we need to open the app settings
        // await openAppSettings();
      }
    } catch (e) {
      print('Error requesting notification permission: $e');
      // Handle the error, maybe show a dialog to the user
    }
  }

  Future<String?> getPublicIPAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org'));
      if (response.statusCode == 200) {
        return response.body.trim();
      }
    } catch (e) {
      log('Error getting public IP address: $e');
    }
    return null;
  }

  Future<void> getCountryAndContinent() async {
    String? ipAddress = await getPublicIPAddress();
    if (ipAddress != null) {
      final Uri uri = Uri.https(globals.ipGeoLocationUrl, '/ipgeo', {'apiKey': secrets.ipGeoLocationApiKey, 'ip': ipAddress});
      final response = await http.get(uri);

      final data = jsonDecode(response.body);
      country = data['country_name'];
      continent = data['continent_name'];
    } else {
      log('Could not determine IP address');
    }
  }

  String getPlatform() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else {
      return 'Unknown';
    }
  }

  Future<void> sendSignUpRequest() async {
    await getCountryAndContinent();
    try {
      await register(
          name: _signUpProvider.name,
          dob: _signUpProvider.dob,
          email: _signUpProvider.email,
          password: _signUpProvider.password,
          country: country,
          continent: continent,
          language: _signUpProvider.language,
          gender: _signUpProvider.gender,
          platform: getPlatform(),
          // TODO: Map out the category ids
          categories: []);
      setState(() {
        selectedCategories = [];
        selectedLanguages = [];
      });
      log('Account created successfully');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DiscoveryPage()));
    } catch (err) {
      Error errorInstance = err as Error;
      languageError = errorInstance.message;
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      categoryWidget(
                          context, selectedCategories, addCategory, categories),
                      const SizedBox(
                        height: 48,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Language preferences',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          )),
                      const SizedBox(
                        height: 24,
                      ),
                      languagePreferencesWidget(addLanguage),
                      const SizedBox(
                        height: 12,
                      ),
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
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                        child: Text(
                                          language,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary),
                                        )),
                                  ))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 85,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (isCustomizationComplete()) {
                            await sendSignUpRequest();
                            await askForNotificationPermission();
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isCustomizationComplete()
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).colorScheme.tertiary,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    color: isCustomizationComplete()
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onPrimary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 16,
                      )
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
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  DropdownButtonFormField<String> languagePreferencesWidget(
      Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        onChanged: onChanged);
  }
}
