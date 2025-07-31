import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebi/core/helper_functions/helper_function.dart';
import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/utils/device_utils.dart';
import 'package:ebi/ui/catagories/catagories_view.dart';
import 'package:ebi/ui/views/home/home_view_model.dart';
import 'package:ebi/ui/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
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
                      PillsCard(
                        description: 'History',
                        iconData: Icons.history,
                      ),
                      PillsCard(
                        description: 'Orders',
                        iconData: Icons.document_scanner_outlined,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Image.asset('assets/images/Slidshow3.png'),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CatagoriesView(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xf000000),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CategorySection(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Best Sellers',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(width: 20),
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
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.imagePath.length,
                    itemBuilder: (context, index) {
                      return BestSellerTile(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/abaya_type/1.png'),
                  ),
                  Text('   Black \n Abbayas'),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/abaya_type/2.png'),
                  ),
                  Text(' Colored \n Abbayas'),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/abaya_type/3.png'),
                  ),
                  Text('  Niqabs'),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),

          GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/abaya_type/4.png'),
                  ),
                  Text('   Scarves  '),
                ],
              ),
            ),
          ),
          SizedBox(width: 15),

          GestureDetector(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Image.asset('assets/images/abaya_type/1.png'),
                  ),
                  Text('   Under \n Abbaya'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerTile extends StatelessWidget {
  final int index;

  const BestSellerTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: DeviceUtils.getScreenWidth(context) * 0.3,
        child: Column(
          children: [
            Container(
              height: 150,
              child: ClipRRect(
                child: Image.asset(
                  viewModel.imagePath[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text('Brand'),
            Text(
              'Product Name',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '\$10.99',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border, color: AppColors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
