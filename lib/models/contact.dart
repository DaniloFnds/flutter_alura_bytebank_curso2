class Contact {
  final String name;
  final int accountName;

  Contact(this.name, this.accountName);

  @override
  String toString() {
    return 'Contact{name: $name, accountName: $accountName}';
  }
}