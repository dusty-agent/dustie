import 'package:dustie/theme/dustie_colors.dart';
import 'package:flutter/material.dart';

class AboutDustiePage extends StatelessWidget {
  const AboutDustiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dustieColorSet['accent'],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(''),
        backgroundColor: dustieColorSet['accent'],
        foregroundColor: dustieColorSet['textPrimary'],
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),

              child: Column(
                children: [
                  /// logo
                  Image.asset('assets/images/dustie-person.png', width: 140),

                  /// title
                  const Text(
                    'Dustie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'A quiet companion for unfinished thoughts.',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    '"흠냐... 궁금한데요 😄"',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),

                  const SizedBox(height: 20),

                  /// about card
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(24),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 12,
                        ),
                      ],
                    ),

                    child: const Column(
                      children: [
                        Text(
                          'Dustie does not try to be smart. \n Dustie simply stays with unfinished thoughts.',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.7),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Instead of trying to be a smart AI assistant,\n'
                          'Dustie helps unfinished thoughts,\n'
                          'drafts and ideas stay alive.',
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1.7),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5),

                  /// version card
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(24),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 12,
                        ),
                      ],
                    ),

                    child: const Column(
                      children: [
                        Text(
                          'Current Version : v0.1',
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 5),

                        Text('✓ Conversation'),
                        Text('✓ Draft Generation'),
                        Text('✓ TXT Export'),

                        SizedBox(height: 12),

                        Divider(),

                        SizedBox(height: 12),

                        Text(
                          'Coming Next',
                          style: TextStyle(color: Colors.grey),
                        ),

                        SizedBox(height: 5),

                        Text('□ Better Memory'),
                        Text('□ Dust Dictionary'),
                        Text('□ Dustpedia'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Made with ☁️ by Dustie',
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
