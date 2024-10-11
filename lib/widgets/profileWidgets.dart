import 'package:flutter/material.dart';

Dialog confirmProfileChangesModal(BuildContext context, Function() onDiscard) {
  return Dialog(
    backgroundColor: const Color(0xffF5F5F5).withOpacity(0.7),
    child: SizedBox(
      height: 240,
      width: 350,
      child: Column(
        children: [
          const Padding(
            padding:  EdgeInsets.all(16.0),
            child: Column(children: [
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                )),
            ],),
          ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  onDiscard();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.3))),
                  ),
                  child: const Center(
                    child: Text('Discard changes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff0066CC)),),
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
                    border: Border(top: BorderSide(color: Theme.of(context).colorScheme.secondary.withOpacity(0.3))),
                  ),
                  child: const Center(
                    child: Text('Cancel', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff0066CC)),),
                  ),
                ),
              )
        ],
      ),
    ),
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
