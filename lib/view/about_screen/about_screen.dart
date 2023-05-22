import 'package:ahamcare/utils/styles/sizedbox.dart';
import 'package:ahamcare/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const TextWidget(
          name: "About Aahamcare",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TextWidget(name: 'The objective of the Aahamcare app:'),
                AppSize.kHeight10,
                TextWidget(
                  textAlign: TextAlign.left,
                
                  name:"""Aahamcare brings hundreds and thousands of NGOs in your locality on a common platform so that you can choose to support your favourite causes \nAahamcare qualifies the the NGOs before putting them on the app, that way a you can be sure that you are contributing to NGO with great track record and legal commoliances
                
Aahamcare app is a a integrator or aggregator of NGOs . Through Aahamcare app you can and contribute either in cash or in kind. If you wish you can choose a store enlisted within the app and make purchases on sehalf of of any NGO.
                
The NGOs entire legal compliance and information will be available on the Azhameare app. You can view the photographs and videos and the work done by the NGO the NGOs requirements are listed and constantly made uptodate. So that the people who would like to support the NGO will always be able to track the work done by the NGO and get Involved or support them on timely basis,
                
                    """,
                ),
                TextWidget(name: 'Process related:'),
                AppSize.kHeight10,
                TextWidget(name: '''The process of Aaham begins with enlisting the NGOs on the app. A backend legal division serutinizes the NGO Information and thelr compliances and only after passing the criteria they are enlisiod on on he app
                
After the enlistment the NGOs will provide at a backend Interface fo showcase their work ok and also seek publish thar requirements...
                
The requirements listad on the app are modulated by a backend team and enly then appears on the app. Once the requirements are enlisted those who wish to support the NGOs can choose one of the many options available and help them
                
There will be no registration fee to put your NGO on the app. As per the laid down norms Aahamcare app will conduct regular audits of the NGOs
                
If specific requirements are mentioned, the NGOs can also so describe the the progress being made on those specific requirements
                
Front-end:

The people who wish © support the NGO will first register themselves on the agp Registration is mandatory however they can choose to contribute to their NGOs anonymously also'''
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

