import 'package:flutter/material.dart';

Future<void> accessMicrophone(context) async {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Container(
            color: const Color(0xff2D3438),
            height: 130,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icons/camera.png"),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Camera",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                const Divider(
                  color: Color(0xff4A5054),
                  height: 1,
                ),
                Row(
                  children: [
                    Image.asset("assets/icons/gallery.png"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Gallery",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                )
              ],
            ),
          ));
    },
  );
}
