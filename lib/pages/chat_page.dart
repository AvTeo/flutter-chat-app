import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _messages = [];

  bool _isWraiting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
              child: const Text(
                'Te',
                style: TextStyle(fontSize: 12, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              'Teo flutter',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true,
              ),
            ),
            const Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSumit,
                onChanged: (text) {
                  setState(() {
                    if (text.trim().length > 0) {
                      _isWraiting = true;
                    } else {
                      _isWraiting = false;
                    }
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Send message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: const Text('Send'),
                      onPressed: _isWraiting
                          ? () => _handleSumit(
                                _textController.text.trim(),
                              )
                          : null,
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(
                          color: Colors.blue[400],
                        ),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: _isWraiting
                              ? () => _handleSumit(
                                    _textController.text.trim(),
                                  )
                              : null,
                          icon: const Icon(
                            Icons.send,
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  _handleSumit(String text) {
    if (text.length == 0) return;
    print(text);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 400,
        ),
      ),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isWraiting = false;
    });
  }

  @override
  void dispose() {
// TODO: off del socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
