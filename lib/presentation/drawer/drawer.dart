import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/drawer/pages/custom_model.dart';
import 'package:flutter_api/presentation/drawer/pages/difficult_api.dart';
import 'package:flutter_api/presentation/drawer/pages/nested_api.dart';
import 'package:flutter_api/presentation/drawer/pages/verycomplexapi.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              highlightColor: Colors.purple,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NestedApi()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.monitor_heart_outlined,
                    size: 25,
                    color: Colors.purple,
                  ),
                  Text(
                    '  Nested Api',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: (30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomImageModelScreen()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.image_outlined,
                    size: 25,
                    color: Colors.purple,
                  ),
                  Text(
                    ' Custom Image Model',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: (30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DifficultApiWithCustomModel()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.account_tree_outlined,
                    color: Colors.purple,
                    size: 25,
                  ),
                  Text(
                    ' Difficult Nested Api',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: (30),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VeryComplexApi()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 25,
                    color: Colors.purple,
                  ),
                  Text(
                    ' Very complex Api',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
