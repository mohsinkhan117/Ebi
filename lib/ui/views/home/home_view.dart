import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/ui/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyTextfield(
              hintText: 'Search',
              controller: textController,
              isObscure: false,
              prefixIcon: Icons.search_rounded,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PillsCard(
                    description: 'Favorites',
                    iconData: Icons.favorite_border,
                  ),
                  PillsCard(description: 'History', iconData: Icons.history),
                  PillsCard(
                    description: 'Orders',
                    iconData: Icons.document_scanner_outlined,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SvgPicture.asset(
                'assets/EbiCopyforteam/Notifications/Banner.svg',
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xf000000),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ListTile(
                  title: CircleAvatar(
                    child: Image.asset('assets/images/abaya_type/1.png'),
                  ),
                  subtitle: Text('Black \n Abbayas'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PillsCard extends StatelessWidget {
  IconData iconData;
  String description;
  PillsCard({super.key, required this.iconData, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xf1A1A1A)),
      ),
      child: Row(
        children: [
          Icon(iconData, color: AppColors.primary),
          Text(description),
        ],
      ),
    );
  }
}
