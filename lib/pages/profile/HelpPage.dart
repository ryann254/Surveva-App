import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  List<Map<String, dynamic>> faqs = [
    {
      'question': 'What is Surveva, and how does it work?',
      'answer': 'Surveva is a community-driven platform that allows users to create and participate in polls. It eliminates geographical barriers by connecting users worldwide, providing insights from diverse perspectives. When you answer polls from others, your own poll is shown to different users globally, ensuring balanced engagement.'
    },
    {
      'question': 'How does Surveva\'s reciprocal system work?',
      'answer': 'Surveva’s reciprocal system ensures fairness and equal engagement. If you answer 10 polls from other users, your question will be shown to 10 different users. This system promotes genuine, meaningful responses without the need for self-answering or paid engagement.'
    },
    {
      'question': 'How do I customize my feed on Surveva?',
      'answer': 'You can customize your Surveva experience by selecting up to 3 preferred categories and choosing your preferred language during sign-up or in your account settings. This ensures you see and engage with polls that match your interests and language preferences.'
    },
    {
      'question': 'Can I see who voted on my poll?',
      'answer': 'No, all votes on Surveva are anonymous. While you can access aggregated analytics, individual responses remain confidential to ensure user privacy and security.'
    },
    {
      'question': 'How does Surveva handle inappropriate content?',
      'answer': 'If you encounter inappropriate content on Surveva, you can report it using the in-app report function. The Surveva team will review the content and take appropriate action to maintain a safe and respectful community environment.'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 37,
            ),
            Center(
              child: Column(
                children: [
                  const Text('Have questions? Write to us!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('We will respond within 24 hours.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary)),
                ],
              ),
            ),
            const SizedBox(height: 24,),
            GestureDetector(
                  onTap: () {

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
                            'Contact',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
                const SizedBox(height: 48,),
                const Text('FAQ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                const SizedBox(height: 12,),
                Expanded(
                  child: ListView.builder(
                    itemCount: faqs.length,
                    itemBuilder: (context, index) => ExpansionTile(
                      collapsedTextColor: Theme.of(context).colorScheme.onSurface,
                      textColor: Theme.of(context).colorScheme.primary,
                      tilePadding: EdgeInsets.zero,
                      title: Text(
                        faqs[index]['question'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(faqs[index]['answer'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24,)
          ],
        ),
      )),
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
        FocusScope.of(context).unfocus(); // Remove focus from any text field
        Navigator.pop(context);
      },
    ),
    title: const Text(
      'Help',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
