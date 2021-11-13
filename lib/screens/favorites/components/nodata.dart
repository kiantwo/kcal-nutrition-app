import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key, required this.subject, required this.image})
      : super(key: key);
  final String subject;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 445.0,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 55.0, bottom: 15.0),
            child: Image(
              image: image,
              height: 120.0,
              fit: BoxFit.cover,
              color: const Color(0xffe7e7e7),
            ),
          ),
          Column(
            children: [
              Text(
                "No " + subject + " Found",
                style: const TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  'You have not saved any ' +
                      subject.toLowerCase() +
                      '. Go ahead, search and save your favorite ' +
                      subject.toLowerCase() +
                      '.',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 50.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Search'),
            ),
          )
        ],
      ),
    );
  }
}
