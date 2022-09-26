import 'package:awarisupport/frontend/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  RxList<Chat> chats = <Chat>[].obs;

  @override
  void onReady() {
    super.onReady();
    getAllMessage();
  }

  Future getAllMessage() async {
    var supportRef = db.collection("support");
    var snapshots = await supportRef.get();
    var docs = snapshots.docs;

    chats.value = [];
    for (var doc in docs) {
      Chat chat = Chat(
        name: "Jenny Wilson",
        lastMessage: "Hope you are doing well...",
        image: "assets/images/user.png",
        time: "3m ago",
        isActive: false,
      );
      chats.add(chat);
    }
  }
}
