import 'dart:developer';
import 'dart:io';

import 'package:anybank/conta.dart';

void main(){
  CheckingAccount accountChris = CheckingAccount("Chris", 4000);
  SavingsAccount accountDenize = SavingsAccount("Denize", 4000);
  SalaryAccount accountCatarina = SalaryAccount("Catarina", 4000, "AnyBank", "00.000.000/0001-00");
  BusinessAccount accountMatheus = BusinessAccount("Matheus", 2000);
  InvestmentAccount accountRoberta = InvestmentAccount("Roberta", 2000);

  accountChris.showAmmount();
  accountChris.sendAmmount(4300);

  accountDenize.showAmmount();
  accountDenize.sendAmmount(4300);
  accountDenize.calculateIncome();
  accountDenize.showAmmount();

  accountCatarina.showAmmount();
  accountCatarina.depositpaycheck(2000);


  accountMatheus.sendAmmount(1000);
  accountRoberta.getAmmount(1000);
}


