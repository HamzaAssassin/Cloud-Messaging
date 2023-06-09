import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cloud_messaging/notification_service.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken().then((value) {
      notificationService.isTokenRefresh(value!);
      print(value);
    });
    notificationService.firebaseInit(context);
    notificationService.setupInteractMessasge(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          notificationService.getDeviceToken().then((value) async {
            var data = {
              'to': value.toString(),
              'priority': 'high',
              'notification': {
                'title': 'Hamza',
                'body': 'Flutter Developer',
              },
              'data': {
                'type': 'msj',
                'id': 'asif1234',
              }
            };
            var response = await http.post(
                Uri.parse("https://fcm.googleapis.com/fcm/send"),
                headers: {
                  "Content-Type": "application/json",
                  'Authorization':
                      "key=AAAAE5DXhUY:APA91bH4B1E17mGMTZlfTdtEYB-xH-FZ48xr6XKZXSd5Ff64_MQ0ce626y0-_U5aKFHh8oQNZU8BD8EOUvs4xZseBsjkpuKFIMUEF4Yd2IH47GtfD7gRua6DFlir1qadP5f5ADzGVhcX"
                },
                body: jsonEncode(data));
                if (response.statusCode==200) {
                  
                } else {
                  
                }
          });
        },
        child: const Text("Send Notification"),
      )),
    );
  }
}
