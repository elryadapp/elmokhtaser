class AccountModel {
  final String describtion;
  final DateTime date;
  final String type;
  final String state;
  final String price;

  AccountModel(
      {required this.describtion,
      required this.date,
      required this.type,
      required this.state,
      required this.price});
}
