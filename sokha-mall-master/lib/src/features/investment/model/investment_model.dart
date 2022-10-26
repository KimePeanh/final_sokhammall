class InvestmentModel {
  final int id;
  final int qty;
  final String value;
  final String profit_per_year;
  final String? attachment;
  final String phone_number;
  final int user_id;
  final String status;
  final String request_date;
  final String total;
  final int open_every_month;
  final String amount_to_be_paid;
  // List<DepositModel> deposits;

  factory InvestmentModel.fromjson(Map<String, dynamic> json) {
    return InvestmentModel(
      id: json['id'],
      qty: json['quantity'],
      value: json['value'],
      profit_per_year: json['profit_per_year'],
      attachment: json['attachment'],
      phone_number: json['phone_number'],
      user_id: json['user_id'],
      status: json['status'],
      request_date: json['request_date'],
      total: json['total'],
      open_every_month: json['open_every_month'],
      amount_to_be_paid: json['amount_to_be_paid'],
      // deposits: json['deposits'].forEach((data) {
      //   DepositModel.fromjson(json['deposits']);
      // }),
    );
  }

  InvestmentModel({
    required this.id,
    required this.qty,
    required this.value,
    required this.profit_per_year,
    required this.attachment,
    required this.phone_number,
    required this.user_id,
    required this.status,
    required this.request_date,
    required this.total,
    required this.open_every_month,
    required this.amount_to_be_paid,
    // required this.deposits,
  });
}

class DepositModel {
  final int id;
  final String date;
  final int company_id;
  final String amount;
  final String? paidBy;
  final String? note;
  final int? createdBy;
  final int? updatedBy;
  final String? withdrawStatus;
  final int? investmentId;
  final String? requestWithdrawal;
  final String? requestWithdrawalDate;
  final int? userId;
  final String? requestWithdrawalNote;

  factory DepositModel.fromjson(Map<String, dynamic> json) {
    return DepositModel(
      id: json['id'],
      date: json['date'],
      company_id: json['company_id'],
      amount: json['amount'],
      paidBy: json['paid_by'],
      note: json['note'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      withdrawStatus: json['withdraw_status'],
      investmentId: json['investment_id'],
      requestWithdrawal: json['request_withdrawal'],
      requestWithdrawalDate: json['request_withdrawal_date'],
      userId: json['user_id'],
      requestWithdrawalNote: json['request_withdrawal_note'],
    );
  }

  DepositModel({
    required this.id,
    required this.date,
    required this.company_id,
    required this.amount,
    required this.paidBy,
    required this.note,
    required this.createdBy,
    required this.updatedBy,
    required this.withdrawStatus,
    required this.investmentId,
    required this.requestWithdrawal,
    required this.requestWithdrawalDate,
    required this.userId,
    required this.requestWithdrawalNote,
  });
}
