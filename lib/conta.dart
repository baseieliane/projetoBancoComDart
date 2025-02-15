abstract class Account {
  String name;
  double _balance;

  Account (this.name, this._balance);

  void getAmmount (double ammount){
    _balance += ammount;
    showAmmount();
  }

  void sendAmmount (double ammount){
    if (_balance >= ammount){
      _balance -= ammount;
      showAmmount();
    }
  }
  
  void showAmmount () {
    print("O saldo atual de $name, é R\$$_balance");
  }
}

class CheckingAccount extends Account {
  CheckingAccount (super.name, super._balance);
  double loan = 300;

  @override
  void sendAmmount (double ammount){
    if (_balance + loan >= ammount){
      _balance -= ammount;
      showAmmount();
    }
  }
}

class SavingsAccount extends Account{

  SavingsAccount (super.name, super._balance);
  double income = 0.05;

  void calculateIncome(){
    _balance += _balance * income;
  }
}

class SalaryAccount extends Account{
  String nomeEmpresa;
  String cnpj;
  SalaryAccount (super.name, super._balance, this.nomeEmpresa, this.cnpj);

  void depositpaycheck(double valor){
    _balance += valor;
    print("O salário da $nomeEmpresa, de CNPJ $cnpj no valor de $valor foi depositado");
    showAmmount();
  }
}

mixin Taxation {
  double tax = 0.03;

  double taxedValue(double ammount){
    return ammount * tax;
  }
}

class BusinessAccount extends Account with Taxation{
  BusinessAccount(super.name, super._balance);

  @override
  void sendAmmount (double ammount){
    if (_balance >= ammount + taxedValue(ammount)){
      _balance -= ammount + taxedValue(ammount);
      showAmmount();
    }
  }

    @override
  void getAmmount (double ammount){
    _balance += ammount - taxedValue(ammount);
    showAmmount();
  }
}

class InvestmentAccount extends Account with Taxation{
  InvestmentAccount(super.name, super._balance);

  @override
  void sendAmmount(double ammount){
    if (_balance >= ammount + taxedValue(ammount)){
      _balance -= ammount + taxedValue(ammount);
      showAmmount();
    }
  }

  @override
  void getAmmount(double ammount){
    _balance += ammount - taxedValue(ammount);
    showAmmount();
  }
}
