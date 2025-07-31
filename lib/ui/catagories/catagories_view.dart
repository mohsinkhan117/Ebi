import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/theme/sizes.dart';
import 'package:ebi/ui/catagories/catagories_view_model.dart';
import 'package:ebi/ui/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatagoriesView extends StatelessWidget {
  static const routeName = '/catagories-View';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => CatagoriesView(),
      settings: const RouteSettings(name: routeName),
    );
  }

  // Assets
  static const String catagory1 = 'assets/images/abaya_type/1.png';
  static const String catagory2 = 'assets/images/abaya_type/2.png';
  static const String catagory3 = 'assets/images/abaya_type/3.png';
  static const String catagory4 = 'assets/images/abaya_type/4.png';
  static const String catagory5 = 'assets/images/abaya_type/5.png';

  final Map<String, List<String>> categories = const {
    'Black Abayas': [
      'Classic Abayas',
      'Casual Abayas',
      'Occasion Abayas',
      'Plain Abayas',
      'Work Abayas',
      'Seasonal Abayas',
    ],
    'Colored Abayas': [
      'Classic Abayas',
      'Casual Abayas',
      'Occasion Abayas',
      'Plain Abayas',
      'Work Abayas',
      'Seasonal Abayas',
    ],
    'Niqabs': ['Tall', 'Medium', 'Short'],
    'Scarves': ['Black', 'Colored', 'Embroidered', 'Printed'],
    'Under Abayas': ['One Piece', 'Two Pieces'],
  };

  CatagoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatagoriesViewModel>(
      builder: (context, model, child) {
        final categoryKeys = categories.keys.toList();
        final selectedCategory = categoryKeys[model.selectedIndex];

        return Scaffold(
          appBar: AppBar(
            title: MyTextfield(
              hintText: 'Search',
              controller: model.searchBarController,
              isObscure: false,
              prefixIcon: Icons.search_rounded,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: AppSizes.defaultSpace),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Sidebar: Category Icons
                Padding(
                  padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
                  child: Column(
                    children: List.generate(5, (index) {
                      final assets = [
                        catagory1,
                        catagory2,
                        catagory3,
                        catagory4,
                        catagory5,
                      ];
                      final labels = [
                        'Black\nAbayas',
                        'Colored\nAbayas',
                        'Niqabs',
                        'Scarves',
                        'Under\nAbayas',
                      ];
                      return CatagoryItem(
                        label: labels[index],
                        asset: assets[index],
                        isSelected: model.selectedIndex == index,
                        onTap: () => model.selectCategory(index),
                      );
                    }),
                  ),
                ),

                
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: AppColors.grey),
                    padding: const EdgeInsets.all(16),
                    itemCount: categories[selectedCategory]!.length,
                    itemBuilder: (context, index) {
                      final item = categories[selectedCategory]![index];
                      return ListTile(title: Text(item), onTap: () {});
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

class CatagoryItem extends StatelessWidget {
  final String asset;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CatagoryItem({
    super.key,
    required this.label,
    required this.asset,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: AppSizes.productImageRadius * 2,
              backgroundColor: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      asset,
                      fit: BoxFit.cover,
                      width: AppSizes.productImageRadius * 4,
                      height: AppSizes.productImageRadius * 4,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      width: AppSizes.productImageRadius * 4,
                      height: AppSizes.productImageRadius * 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(
                          0.4,
                        ), // semi-transparent overlay
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: isSelected
                  ? const TextStyle(fontWeight: FontWeight.bold)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
