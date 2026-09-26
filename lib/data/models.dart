import 'package:flutter/material.dart';

class Subject {
  final String name, code;
  final double pct;
  final Color color;
  final String meta;
  const Subject(this.name, this.code, this.pct, this.color, this.meta);
}

class WeakTopic {
  final String name;
  final int pct;
  const WeakTopic(this.name, this.pct);
}

class QuizQ {
  final String stem, tag, topic;
  final List<String> options;
  final int answer;
  const QuizQ(this.stem, this.tag, this.options, this.answer, this.topic);
}

enum TaskStatus { overdue, pending, done }

class TaskItem {
  final String title, meta;
  TaskStatus status;
  TaskItem(this.title, this.meta, this.status);
}

class ClassSlot {
  final String time, title, meta, state;
  const ClassSlot(this.time, this.title, this.meta, this.state);
}

class ChatMsg {
  final bool me;
  final String text;
  const ChatMsg(this.me, this.text);
}

class ContItem {
  final String tag, title, meta;
  const ContItem(this.tag, this.title, this.meta);
}
