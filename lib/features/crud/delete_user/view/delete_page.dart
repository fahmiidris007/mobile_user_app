import 'package:flutter/material.dart';
import 'package:mobile_user_app/configs/theme/app_themes.dart';

class DeletePage extends StatelessWidget {
  static const String routeName = '/deletePage';

  const DeletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            IconButton(
              onPressed: null,
              icon: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.check,color: Colors.white, size: 50),
                  )),
            ),
            SizedBox(height: 20),
            const Text("Delete Successful", style: TextStyle(color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,),),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
          ]
        ),
      ),
    );
  }
}


