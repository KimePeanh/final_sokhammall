import 'dart:developer';

import 'package:sokha_mall/src/features/shipping_address/models/address.dart';

class User {
  final String id;
  String name;
  final String phone;
  String email;
  String profileImage;
  Address? address;
  WalletModel? walletModel;
  String verifyStatus;
  factory User.fromJson(Map<String, dynamic> json) {
    Address? _address;
    if (json["address"] == null) {
    } else if (json["address"].length == 0) {
    } else {
      Map<String, dynamic> data = {};
      if (json["address"].runtimeType == (data.runtimeType)) {
        _address = Address.fromJson(json["address"]);
      }
    }
    WalletModel? _wallet;
    Map<String, dynamic> data = {};
    if (json["wallet"].runtimeType == (data.runtimeType)) {
      _wallet = WalletModel.fromjson(json["wallet"]);
    }
    print(json);
    return User(
        id: json["id"].toString(),
        name: json["name"],
        phone: json["phone"].toString(),
        verifyStatus: json["verify_status"],
        address: _address,
        walletModel: _wallet,
        // address: json["address"] == null || json["address"].length == 0
        //     ? null
        //     : Address.fromJson(json["address"]),
        email: json["email"] ?? "",
        profileImage: json["image_url"] ?? "");
  }
  User(
      {required this.id,
      required this.name,
      required this.address,
      required this.walletModel,
      required this.verifyStatus,
      required this.phone,
      required this.email,
      required this.profileImage});
}

class WalletModel {
  final String balance;

  factory WalletModel.fromjson(Map<String, dynamic> json) {
    return WalletModel(
      balance: json['balance'],
    );
  }

  WalletModel({required this.balance});
}
