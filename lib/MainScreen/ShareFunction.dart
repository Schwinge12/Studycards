import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';





class ShareDemo extends StatefulWidget {
  @override
  ShareDemoState createState() => ShareDemoState();
}

class ShareDemoState extends State<ShareDemo> {
  String text = '';
  String subject='';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stapel Teilen',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('test'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share text:',
                    hintText: 'Enter some text and/or link to share',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),

                const Padding(padding: EdgeInsets.only(top: 24.0)),
                Builder(
                  builder: (BuildContext context) {
                    return RaisedButton(
                      child: const Text('Share'),
                      onPressed: text.isEmpty
                          ? null
                          : () {
                        // A builder is used to retrieve the context immediately
                        // surrounding the RaisedButton.
                        //
                        // The context's `findRenderObject` returns the first
                        // RenderObject in its descendent tree when it's not
                        // a RenderObjectWidget. The RaisedButton's RenderObject
                        // has its position and size after it's built.
                        final RenderBox box = context.findRenderObject();
                        Share.share(text,
                            subject: subject,
                            sharePositionOrigin:
                            box.localToGlobal(Offset.zero) &
                            box.size);
                      },
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}