import 'package:flutter/material.dart';

class WalkthroughWidget extends StatefulWidget {
  final String human;
  final String footer;
  final String title;
  final String describe;
  WalkthroughWidget(this.human, this.footer, this.title, this.describe);

  @override
  State<WalkthroughWidget> createState() => _WalkthroughWidgetState();
}

class _WalkthroughWidgetState extends State<WalkthroughWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 90, bottom: 50),
          child: Image.asset('assets/images/walkthrough/${widget.human}.png'),
        ),
        Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontFamily: 'AvenirNextRoundedPro',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              widget.describe,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontFamily: 'AvenirNextRoundedPro',
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 35,
        ),
        SizedBox(
          width: size.width,
          child: Image.asset('assets/images/walkthrough/${widget.footer}.png',
              fit: BoxFit.cover),
        ),
      ],
    );
  }
}
