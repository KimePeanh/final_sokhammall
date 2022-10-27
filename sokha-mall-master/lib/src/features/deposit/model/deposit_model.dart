class DepositModel {
  final int? id;
  final String? date;
  final int? companyId;
  final String? amount;
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
      companyId: json['company_id'],
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

  DepositModel(
      {required this.id,
      required this.date,
      required this.companyId,
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
      required this.requestWithdrawalNote});
}
