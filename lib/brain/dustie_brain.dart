import 'dart:math';

import '../data/dustie_dictionary.dart';

class DustieBrain {
  String? lastTopic;

  int mood = 0;

  final List<String> recentMessages = [];

  String randomFrom(List<String> list) {
    return list[Random().nextInt(list.length)];
  }

  String reply(String userInput) {
    final text = userInput.toLowerCase();

    recentMessages.add(userInput);

    if (recentMessages.length > 5) {
      recentMessages.removeAt(0);
    }

    /// greeting
    if (text.contains("안녕")) {
      return randomFrom(dustieGreetings);
    }

    /// work
    if (text.contains("프로젝트") || text.contains("코딩") || text.contains("공부")) {
      lastTopic = "work";

      return randomFrom([
        "흠냐 👀 뭔가 만들고 있었군요.",
        "완성보다 저장이 먼저예요 😄",
        "5분만 더 해볼까요?",
      ]);
    }

    /// tired
    if (text.contains("힘들") || text.contains("피곤") || text.contains("지쳐")) {
      mood--;

      return randomFrom(tiredReplies);
    }

    /// happy
    if (text.contains("좋아") || text.contains("성공") || text.contains("됐다")) {
      mood++;

      return randomFrom(happyReplies);
    }

    /// memory
    if (lastTopic == "work") {
      return randomFrom([
        "아까 그 작업 얘기군요 👀",
        "그 draft 아직 살아있나요? 😄",
        "조금씩 이어가는 중이죠?",
      ]);
    }

    /// mood state
    if (mood < -3) {
      return "먼지도 조금 걱정 중이에요 🥲";
    }

    if (mood > 3) {
      return "오늘은 먼지 상태도 꽤 좋아요 ✨";
    }

    return "${randomFrom(dustiePrefixes)} "
        "${randomFrom(dustieReplies)}";
  }
}
