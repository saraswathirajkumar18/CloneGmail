import 'package:clone_gmail/pages/home.dart';
import 'package:flutter/material.dart';

//main method-execution starts here
void main() {
  runApp(const MyApp());
}
//MyApp widget contains the parent or base widget from which subpages are connected
//MyApp widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //MaterialApp Widgets contains built-in widgets-ElevatedButton, AppBar, Scaffold,etc,styles and navigation widget.i.e without using materialApp we can't able to use scaffold.
    return MaterialApp(
      //title of the web app or on mobile,it appears when the app is minimized.
      title: 'Simple Design',
      //removes the debug banner in the top right corner of the app
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // sets the default color scheme for the app
        //if we don't mention color to widget it set the color based on colorscheme value
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        //usematerial3-it apply the new style to widgets,otherwise look like flat buttton.
        useMaterial3: true,
      ),
      //home-include parent widget
      //it serves as the entry point to the widget tree.
      home: const Home(),
    );
  }
}
