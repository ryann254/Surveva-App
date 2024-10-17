import 'package:flutter/material.dart';
import 'package:surveva_app/pages/LaunchPage.dart';

Dialog confirmProfileChangesModal(BuildContext context, Function() onDiscard) {
  return Dialog(
    backgroundColor: const Color(0xffF5F5F5).withOpacity(0.7),
    child: SizedBox(
      height: 240,
      width: 350,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Discard changes?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 241,
                    child: Text(
                      'You will lose any chanhes you have made',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onDiscard();
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3))),
              ),
              child: const Center(
                child: Text(
                  'Discard changes',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0066CC)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3))),
              ),
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0066CC)),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Dialog confirmLogoutModal(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: SizedBox(
      height: 275,
      width: 330,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Logout',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LaunchPage()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
                    'Cancel',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Dialog languagePreferencesModal(BuildContext context, List<String> languages,
    Function(String) selectLanguage, List<String> selectedLanguages) {
  return Dialog(
    insetPadding: const EdgeInsets.only(top: 9),
    alignment: Alignment.bottomCenter,
    child: StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.90,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: 48,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xffCDCFD0),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Center(
                  child: Text(
                    'Language Preferences',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                searchWidget(context),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectLanguage(languages[index]);
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: Text(languages[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                ),
                                selectedLanguages.contains(languages[index])
                                    ? Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          color:
                                              Theme.of(context).colorScheme.primary,
                                        ),
                                      )
                                    : Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24),
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onTertiary),
                                        ),
                                      )
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Theme.of(context).colorScheme.onPrimary,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget searchWidget(BuildContext context) {
  return Row(
    children: [
      Expanded(
        child: SizedBox(
          height: 44,
          child: TextField(
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    top: 3.0, left: 30.0, right: 30.0, bottom: 3.0),
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: Theme.of(context).colorScheme.onTertiary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Icon(
                    Icons.search_sharp,
                    color: Theme.of(context).colorScheme.onTertiary,
                    size: 24,
                  ),
                )),
          ),
        ),
      ),
    ],
  );
}

Column categoryWidget(BuildContext context, List<String> selectedCategories,
    Function(String) addCategory, List<String> categories) {
  return Column(
    children: [
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
                color: Theme.of(context).colorScheme.secondary),
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
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            '${selectedCategories.length}/3',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
      const SizedBox(
        height: 24,
      ),
      selectedCategoriesWidget(
          context, selectedCategories, addCategory, categories),
    ],
  );
}

Wrap selectedCategoriesWidget(
    BuildContext context,
    List<String> selectedCategories,
    Function(String) addCategory,
    List<String> categories) {
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
              border: Border.all(color: Theme.of(context).colorScheme.tertiary),
              color: selectedCategories.contains(category)
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(
              category,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: selectedCategories.contains(category)
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSurface),
            ),
          ),
        );
      }).toList());
}
