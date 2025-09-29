import 'package:checkout_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactinData() {
  var amount = AmountModel(
    total: '90',
    currency: 'USD',
    details: Details(subtotal: '90', shipping: '0', shippingDiscount: 0),
  );

  List<OrederItemModel> orders = [
    OrederItemModel(currency: 'USD', name: 'Apple', quantity: 10, price: '4'),
    OrederItemModel(currency: 'USD', name: 'Apple', quantity: 10, price: '5'),
  ];

  var itemList = ItemListModel(items: orders);

  return (amount: amount, itemList: itemList);
}
