class RazorPayOrderModel {
  int? amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  String? id;
  Notes? notes;
  dynamic offerId;
  String? receipt;
  String? status;

  RazorPayOrderModel({
    this.amount,
    this.amountDue,
    this.amountPaid,
    this.attempts,
    this.createdAt,
    this.currency,
    this.entity,
    this.id,
    this.notes,
    this.offerId,
    this.receipt,
    this.status,
  });

  // From JSON
  factory RazorPayOrderModel.fromJson(Map<String, dynamic> json) {
    return RazorPayOrderModel(
      amount: json['amount'],
      amountDue: json['amount_due'],
      amountPaid: json['amount_paid'],
      attempts: json['attempts'],
      createdAt: json['created_at'],
      currency: json['currency'],
      entity: json['entity'],
      id: json['id'],
      notes: json['notes'] != null ? Notes.fromJson(json['notes']) : null,
      offerId: json['offer_id'],
      receipt: json['receipt'],
      status: json['status'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'amount_due': amountDue,
      'amount_paid': amountPaid,
      'attempts': attempts,
      'created_at': createdAt,
      'currency': currency,
      'entity': entity,
      'id': id,
      'notes': notes?.toJson(),
      'offer_id': offerId,
      'receipt': receipt,
      'status': status,
    };
  }
}

class Notes {
  String? itemId;
  String? type;
  String? userId;

  Notes({
    this.itemId,
    this.type,
    this.userId,
  });

  // From JSON
  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      itemId: json['itemId'],
      type: json['type'],
      userId: json['userId'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'type': type,
      'userId': userId,
    };
  }
}
