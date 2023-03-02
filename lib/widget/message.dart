
import 'package:flutter/material.dart';

alertMessage(BuildContext context){
showDialog(context: context, builder: (_) => const AlertDialog(
  title: Text('Message'),
  content: Text('Publication was successfully created'),
));
}