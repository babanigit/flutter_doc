// Encapsulation in Dart can be achieved by marking class members as private using the _ (underscore) prefix.

class BankAccount {
  double _balance; // Private attribute

  BankAccount(this._balance);

  void deposit(double amount) {
    _balance += amount;
    print("Deposited: \$${amount}");
  }

  double get balance => _balance; // Getter
}

void main() {
  BankAccount account = BankAccount(1000);
  account.deposit(500);
  print("Current balance: \$${account.balance}");
}
