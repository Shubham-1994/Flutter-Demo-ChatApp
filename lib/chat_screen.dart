import 'package:ChatApp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController =
      new TextEditingController();

  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.add(message);
    });
    _textEditingController.clear();
  }

  Widget _textComposerWidget() {
    return new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(children: [
          new Flexible(
            child: new TextField(
              decoration:
                  new InputDecoration.collapsed(hintText: 'Send a message'),
              controller: _textEditingController,
              onSubmitted: _handleSubmit,
            ),
          ),
          new IconTheme(
              data: new IconThemeData(color: Theme.of(context).accentColor),
              child: new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmit(_textEditingController.text),
                ),
              ))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
            child: new ListView.builder(
          padding: new EdgeInsets.all(8.0),
          itemBuilder: (_, int index) => _messages[index],
          itemCount: _messages.length,
        )),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
