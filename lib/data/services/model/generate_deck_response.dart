import 'dart:convert' as convert;

class GenerateDeckResponse {
  bool success;
  String deckId;
  int remaining;
  bool shuffled;

  GenerateDeckResponse({
    required this.success,
    required this.deckId,
    required this.remaining,
    required this.shuffled,
  });

  static GenerateDeckResponse fromJson(String json) {
    var jsonObject = convert.jsonDecode(json) as Map<String, dynamic>;
    return GenerateDeckResponse(
      success: jsonObject["success"] as bool,
      deckId: jsonObject["deck_id"] ?? "",
      remaining: jsonObject["remaining"] as int,
      shuffled: jsonObject["shuffled"] as bool,
    );
  }

// "success": true,
// "deck_id": "5659ed9ukabw",
// "remaining": 52,
// "shuffled": true
}
