import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class Chat {
  final String name, lastMessage, imageUrl, time;
  final bool isOnline;

  Chat(
      {required this.name,
      required this.lastMessage,
      required this.imageUrl,
      required this.time,
      required this.isOnline});
}

List chats = [
  Chat(
    name: "sanaa elghoul",
    lastMessage: "Hi doctor i just wanna...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "3m ago",
    isOnline: false,
  ),
  Chat(
    name: "Meriyem elmoutaraji ",
    lastMessage: "Hello doctor!...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "8m ago",
    isOnline: false,
  ),
  Chat(
    name: "taha dibess",
    lastMessage: "Can I ask you  ...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "5d ago",
    isOnline: false,
  ),
  Chat(
    name: "sanaa sanaa",
    lastMessage: "You’re welcome :)",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "5d ago",
    isOnline: true,
  ),
  Chat(
    name: "Meriyem elmoutaraji",
    lastMessage: "Thanks",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "6d ago",
    isOnline: false,
  ),
  Chat(
    name: "taha taha ",
    lastMessage: "Hope you are doing well...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "3m ago",
    isOnline: false,
  ),
  Chat(
    name: "meryem",
    lastMessage: "Hello !...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "8m ago",
    isOnline: true,
  ),
  Chat(
    name: "taha",
    lastMessage: " Sir Do you have ...",
    imageUrl: "assets/images/Anonym.jpeg",
    time: "5d ago",
    isOnline: false,
  ),
];
