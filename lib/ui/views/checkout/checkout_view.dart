import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key});

  final List<Map<String, dynamic>> items = [
    {'title': 'SHIPPING', 'content': 'Add shipping address', 'trailing': false},
    {
      'title': 'DELIVERY',
      'content': 'FREE\nStandard | 3-4 days',
      'trailing': true,
    },
    {'title': 'PAYMENT', 'content': 'Visa *1234', 'trailing': true},
    {'title': 'PROMOS', 'content': 'Apply promo code', 'trailing': false},
  ];

  final List<Map<String, dynamic>> products = [
    {
      'price': 10.99,
      'image': 'assets/images/homeImages/1.png',
      'description': 'This is First class cotton available only with us',
      'brand': 'Aliya',
      'quantity': 01,
      'product-name': 'Black Abayya Stiched',
    },
    {
      'price': 8.99,
      'image': 'assets/images/homeImages/3.png',
      'description': 'The is Europian Abbaya Lenga',
      'brand': 'Natasha',
      'quantity': 02,
      'product-name': 'White Scrave UnStiched',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'), centerTitle: true),
      body: Expanded(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          children: [
            // Main sections
            ...List.generate(items.length, (index) {
              final item = items[index];
              return ListTile(
                leading: Text(
                  item['title'],
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                ),
                title: Text(item['content']),
                trailing: const Icon(Icons.arrow_forward_ios),
              );
            }),

            ItemsSections(items: products),

            // Order summary
            const Divider(),
            PriceSummarySection(),

            // Order button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Place order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============ items section ================
class ItemsSections extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const ItemsSections({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ITEMS', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                'DESCRIPTION',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('PRICE', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: Image.asset(
                item['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Name: ${item['product-name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Brand:${item['brand']}'),
                  Text(item['description']),
                  Text('Quantity: ${item['quantity'].toString()}'),
                ],
              ),

              trailing: Text(
                '\$${item['price']}',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ],
    );
  }
}

class PriceSummarySection extends StatelessWidget {
  const PriceSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subtotal'),
              Text('Shipping Total'),
              Text('Taxes'),
              Text('Total'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("\$19.96"),
              Text("Free"),
              Text("\$2.00"),
              Text("\$21.96"),
            ],
          ),
        ],
      ),
    );
  }
}
