import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class WatchTVPage extends StatelessWidget {
  const WatchTVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}