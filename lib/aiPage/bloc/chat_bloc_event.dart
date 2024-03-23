// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocEvent {}

class ChatGenerateNewTextMessageEvent extends ChatBlocEvent {
  final String inputMessage;
  ChatGenerateNewTextMessageEvent({
    required this.inputMessage,
  });
}
