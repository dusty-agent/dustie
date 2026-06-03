import 'package:flutter/material.dart';
import 'dart:html' as html;
import '../brain/dustie_brain.dart';
import '../data/dustie_dictionary.dart';
import '../theme/dustie_colors.dart';
import '../widgets/bubble.dart';
import '../widgets/button.dart';
import 'package:dustie/widgets/common_app_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final DustieBrain _brain = DustieBrain();

  final List<Map<String, dynamic>> _messages = [
    {"text": dustieGreetings.first, "isUser": false},
  ];

  bool showConfirmActions = false;
  bool showDraftActions = false;

  String generatedDraft = '';

  void sendMessage() {
    final text = _controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add({"text": text, "isUser": true});

      _messages.add({"text": _brain.reply(text), "isUser": false});

      showConfirmActions = false;
      showDraftActions = false;
    });

    _controller.clear();

    scrollToBottom();
  }

  void extractPageText() {
    setState(() {
      _messages.add({"text": "[현재 페이지 텍스트]\n대화내용 저장하기", "isUser": true});

      _messages.add({"text": "이 내용 draft로 저장해둘까요? 😊", "isUser": false});

      showConfirmActions = true;
      showDraftActions = false;
    });

    scrollToBottom();
  }

  void saveDraft() {
    String draftText = '';

    for (var message in _messages) {
      final isUser = message['isUser'];
      final text = message['text'];

      if (isUser) {
        draftText += '[나] $text\n';
      } else {
        draftText += '[더스티] $text\n';
      }
    }

    generatedDraft = draftText;

    setState(() {
      _messages.add({"text": "draft로 정리해뒀어요 😄", "isUser": false});

      showConfirmActions = false;
      showDraftActions = true;
    });

    scrollToBottom();
  }

  void cancelDraft() {
    setState(() {
      _messages.add({"text": "알겠어요! 😊", "isUser": false});

      showConfirmActions = false;
      showDraftActions = false;
    });

    scrollToBottom();
  }

  void onDownload() {
    final blob = html.Blob([generatedDraft]);

    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor =
        html.AnchorElement(href: url)
          ..setAttribute('download', 'dustie_draft.txt')
          ..click();

    html.Url.revokeObjectUrl(url);

    setState(() {
      _messages.add({"text": "txt 파일로 다운로드했어요 😄", "isUser": false});
    });

    scrollToBottom();
  }

  void onShare() {
    setState(() {
      _messages.add({"text": "share 기능 준비중이에요 😄", "isUser": false});
    });

    scrollToBottom();
  }

  void onBackup() {
    setState(() {
      _messages.add({"text": "backup 해둘게요 😄", "isUser": false});
    });

    scrollToBottom();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          /// message list
          Expanded(
            child: ListView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.all(16),

              children: [
                ..._messages.map((message) {
                  return Bubble(
                    text: message['text'],
                    isUser: message['isUser'],
                  );
                }),

                /// confirm buttons
                if (showConfirmActions)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      top: 4,
                      bottom: 12,
                    ),

                    child: Row(
                      children: [
                        /// no
                        GestureDetector(
                          onTap: cancelDraft,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: dustieColorSet['surface'],

                              borderRadius: BorderRadius.circular(20),

                              border: Border.all(
                                color: dustieColorSet['border']!,
                              ),
                            ),

                            child: Text(
                              'No',

                              style: TextStyle(
                                color: dustieColorSet['textPrimary'],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// yes
                        GestureDetector(
                          onTap: saveDraft,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),

                            decoration: BoxDecoration(
                              color: dustieColorSet['primary'],

                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: const Text(
                              'Yes',

                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                /// generated draft preview
                if (showDraftActions)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 48,
                      top: 4,
                      bottom: 12,
                      right: 16,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// preview box
                        Container(
                          width: double.infinity,

                          padding: const EdgeInsets.all(16),

                          decoration: BoxDecoration(
                            color: dustieColorSet['surface'],

                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(
                              color: dustieColorSet['border']!,
                            ),
                          ),

                          child: SelectableText(
                            generatedDraft,

                            style: TextStyle(
                              color: dustieColorSet['textPrimary'],
                              height: 1.5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// action buttons
                        Row(
                          children: [
                            /// download
                            GestureDetector(
                              onTap: onDownload,

                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: dustieColorSet['surface'],

                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(
                                    color: dustieColorSet['border']!,
                                  ),
                                ),

                                child: Text(
                                  'Download',

                                  style: TextStyle(
                                    color: dustieColorSet['textPrimary'],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            /// share
                            GestureDetector(
                              onTap: onShare,

                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: dustieColorSet['surface'],

                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(
                                    color: dustieColorSet['border']!,
                                  ),
                                ),

                                child: Text(
                                  'Share',

                                  style: TextStyle(
                                    color: dustieColorSet['textPrimary'],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            /// backup
                            GestureDetector(
                              onTap: onBackup,

                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: dustieColorSet['surface'],

                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(
                                    color: dustieColorSet['border']!,
                                  ),
                                ),

                                child: Text(
                                  'Backup',

                                  style: TextStyle(
                                    color: dustieColorSet['textPrimary'],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          /// input area
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: dustieColorSet['background'],

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// input
                  Expanded(
                    child: TextField(
                      controller: _controller,

                      decoration: InputDecoration(
                        hintText: 'Dustie에게 말 걸어보기!',

                        hintStyle: TextStyle(
                          color: dustieColorSet['textSecondary'],
                        ),

                        filled: true,

                        fillColor: dustieColorSet['surface'],

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),

                          borderSide: BorderSide(
                            color: dustieColorSet['border']!,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),

                          borderSide: BorderSide(
                            color: dustieColorSet['border']!,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),

                          borderSide: BorderSide(
                            color: dustieColorSet['primary']!,
                            width: 1.5,
                          ),
                        ),
                      ),

                      onSubmitted: (_) {
                        sendMessage();
                      },
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// send
                  DustieButton(icon: Icons.send, onTap: sendMessage),

                  const SizedBox(width: 8),

                  /// extract
                  DustieButton(
                    icon: Icons.content_paste,
                    onTap: extractPageText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
