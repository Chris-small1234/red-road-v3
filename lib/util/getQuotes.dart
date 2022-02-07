import 'firebase_manager.dart';
import 'localStorage.dart';

class getQuotes {
  Future<String?> writeQuoteFuture() async {
    FirebaseManager db = new FirebaseManager();
    LocalStorage storage = new LocalStorage();
    var today;
    var quotes;
    db.sectionType = "home";
    today = await db.readDate(db.day, db.sectionType);
    quotes = await db.readQuote(quotes);
    if (quotes != null) {
      await storage.writeContent(quotes[today]);
    }
  }
}
