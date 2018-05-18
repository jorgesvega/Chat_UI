import 'package:flutter/material.dart';
import './pages/call_history.dart';
import './pages/camera_page.dart';
import './pages/chat_screen.dart';
import './pages/status_page.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new WhatsAppUIClone(),
      title: 'WhatsApp',
      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),
        accentColor: new Color(0xff25D366),
      ),
    )
  );
}

// Stateful widget creation (3 steps)
class WhatsAppUIClone extends StatefulWidget { // 1º- The class name is defined followed by the jeywords 'Extends StatefulWidget'
  _WhatsAppUIClone createState() => new _WhatsAppUIClone(); // 2º- The state is created
}

class _WhatsAppUIClone extends State<WhatsAppUIClone> with SingleTickerProviderStateMixin { //3º- Another class is created, this time using the name used to create the state. This class extends the State.
// SingleTickerProviderStateMixin is added later. Is an animation property used by TabBar.
  TabController _tabcontroller;

  // Override two lifecycle methods
  @override
  void initState() { // We set _tabcontroller (we created earlier) to a new TabController
    super.initState();
    _tabcontroller = new TabController(
      vsync: this,
      length: 4, // We set the number of tabs
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // A Scaffold is a widget from material package. Provides us different API's for adding differents features to our app such as an AppBar, Tabs, Drawer, etc.
      appBar: new AppBar( // We create a material app bar.
        backgroundColor: Theme.of(context).primaryColor,
        title: new Text('Flutter based chat UI'),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabcontroller,
          indicatorColor: Colors.white,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: 'CHATS',),
            new Tab(text: 'STATUS',),
            new Tab(text: 'CALLS',)
          ],
        ),
      ),
      body: new TabBarView( // We use the body property and set it to a new TabBarView
      // The TabBarView used the same controller as before and took in the four different classes we created as its children
        controller: _tabcontroller,
        children: <Widget>[
          new CameraPage(),
          new ChatScreen(),
          new StatusPage(),
          new CallHistory()
        ],
      ),
    );
  }
}