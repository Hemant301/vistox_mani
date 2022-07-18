import 'package:flutter/material.dart';

import '../profileitem/setting.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // homebloc.fetchFaq();
    return Scaffold(
      appBar: new PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Basicappbar(
            title: 'Faqs',
          )),
      body: Column(
        children: [
          Column(
            children: List.generate(
                5,
                (index) => Faqbutton(
                      question: 'Question  to be shown here',
                      answer: 'Anser will be shown here',
                    )),
          )
        ],
      ),
    );
  }
}

class Faqbutton extends StatefulWidget {
  Faqbutton({Key? key, this.question, this.answer})
      : super(
          key: key,
        );
  String? question;
  String? answer;

  @override
  State<Faqbutton> createState() => _FaqbuttonState();
}

class _FaqbuttonState extends State<Faqbutton> {
  int expand = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (expand == 1) {
            setState(() {
              expand = 0;
            });
          } else {
            setState(() {
              expand = 1;
            });
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.question}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: expand == 0
                      ? const Icon(Icons.arrow_drop_down)
                      : const Icon(Icons.arrow_drop_up),
                )
              ],
            ),
            expand == 0
                ? Container()
                : Text(
                    '${widget.answer}',
                  ),
            const Divider(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
