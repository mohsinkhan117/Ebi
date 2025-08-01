import 'package:ebi/core/theme/app_colors.dart';
import 'package:ebi/core/utils/device_utils.dart';
import 'package:ebi/ui/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class BlackAbayaScreen extends StatelessWidget {
  BlackAbayaScreen({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTextfield(
          hintText: 'Search',
          controller: searchController,
          isObscure: false,
          prefixIcon: Icons.search,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15),
            // Category Tabs with fixed height
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: CategoryTabs(description: '     Classic    '),
                  ),
                  SizedBox(width: 5),
                  CategoryTabs(description: '   Casual     '),
                  SizedBox(width: 5),

                  CategoryTabs(description: '    Occassion     '),
                  SizedBox(width: 5),

                  CategoryTabs(description: '   Work     '),
                  SizedBox(width: 5),
                  CategoryTabs(description: '      plain     '),
                ],
              ),
            ),

            // Filters Row
            const FiltersRow(),

            // Product Grid with expanded to take remaining space
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductGrid(),
                    const SizedBox(height: 20), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab Button Widget (previously missing)
// class TabButton extends StatelessWidget {
//   final String label;
//   final bool isSelected;

//   const TabButton({super.key, required this.label, required this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               color: isSelected ? Colors.black : Colors.grey,
//             ),
//           ),
//           if (isSelected)
//             Container(
//               margin: const EdgeInsets.only(top: 4),
//               height: 2,
//               width: 24,
//               color: Colors.black,
//             ),
//         ],
//       ),
//     );
//   }
// }

// Category Tabs Widget using TabButton
class CategoryTabs extends StatelessWidget {
  String description;

  CategoryTabs({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(description, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}

// Filters Row Widget
class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined, size: 18),
            label: const Text('Filters'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              padding: EdgeInsets.zero,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.swap_vert, size: 18),
            label: const Text('Price Lowest to highest'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}

// Product Grid Widget with dummy data
class ProductGrid extends StatelessWidget {
  ProductGrid({super.key});

  // Dummy product data with colors
  final List<Map<String, dynamic>> dummyProducts = [
    {
      'brand': 'Brand',
      'name': 'Product name',
      'price': '\$10.99',
      'asset': 'assets/images/homeImages/1.png',
    },
    {
      'brand': 'Brand',
      'name': 'Product name',
      'price': '\$10.99',
      'asset': 'assets/images/homeImages/2.png',
    },
    {
      'brand': 'Brand',
      'name': 'Product name',
      'price': '\$10.99',
      'asset': 'assets/images/homeImages/3.png',
    },

    {
      'brand': 'Brand',
      'name': 'Product name',
      'price': '\$10.99',
      'asset': 'assets/images/homeImages/4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            // mainAxisExtent: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.67, // Increased from 0.75 to prevent overflow
          ),
          // itemCount: dummyProducts.length,
          itemCount: 4,
          itemBuilder: (context, index) {
            final product = dummyProducts[index];
            return ProductCard(
              brand: product['brand'],
              name: product['name'],
              price: product['price'],
              imagePath: product['asset'],
            );
          },
        );
      },
    );
  }
}

// Product Card Widget with background color
class ProductCard extends StatelessWidget {
  final String brand;
  final String name;
  final String price;
  final String imagePath;
  const ProductCard({
    super.key,
    required this.brand,
    required this.name,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DeviceUtils.getScreenHeight(context) * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: DeviceUtils.getScreenHeight(context) * 0.2,
            width: DeviceUtils.getScreenWidth(context) * 0.4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 4),
          Text(brand),
          Text(name, style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.favorite_border_outlined, color: AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }
}
