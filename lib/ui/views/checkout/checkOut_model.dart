class CheckoutData {
  final ShippingAddress? shippingAddress;
  final DeliveryOption deliveryOption;
  final PaymentMethod paymentMethod;
  final List<CartItem> items;
  final double subtotal;
  final double shippingCost;
  final double taxes;
  final double total;
  final String? promoCode;

  CheckoutData({
    this.shippingAddress,
    required this.deliveryOption,
    required this.paymentMethod,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.taxes,
    required this.total,
    this.promoCode,
  });
}

class ShippingAddress {
  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String country;

  ShippingAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
  });

  String get formattedAddress => '$street, $city, $state $zipCode, $country';
}

class DeliveryOption {
  final String name;
  final String description;
  final double cost;
  final String estimatedDelivery;

  DeliveryOption({
    required this.name,
    required this.description,
    required this.cost,
    required this.estimatedDelivery,
  });
}

class PaymentMethod {
  final String type;
  final String lastFourDigits;

  PaymentMethod({required this.type, required this.lastFourDigits});

  String get formatted => '$type *$lastFourDigits';
}

class CartItem {
  final String brand;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.brand,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}
