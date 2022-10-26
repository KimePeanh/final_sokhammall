import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';


class WithdrawForm extends StatefulWidget {
  // const WithdrawForm({Key key}) : super(key: key);

  @override
  _WithdrawFormState createState() => _WithdrawFormState();
}

class _WithdrawFormState extends State<WithdrawForm> {
  final GlobalKey<FormState> _mykey = GlobalKey<FormState>();
  GlobalKey key = GlobalKey();
  final _amountController = TextEditingController();
  final _walletController = TextEditingController();
  final _noteController = TextEditingController();
  // final WithdrawBloc withdrawBloc = WithdrawBloc();

  _onRequestWithdraw() {
    // if (_mykey.currentState.validate()) {
    //   withdrawBloc.add(SendWithdrawRequest(
    //       amount: _amountController.text,
    //       note: _noteController.text,
    //       type: "withdraw"));
    // }
  }

  void _clearTextInput() {
    _amountController.clear();
    _noteController.clear();
  }

  // Future<bool> _errorMessage(String errorMessage) {
  //   return showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return AlertDialog(
  //               title: Text('Alert !'),
  //               content: Text(errorMessage),
  //               actions: <Widget>[
  //                 FlatButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop(false);
  //                   },
  //                   child: Text('Yes'),
  //                 ),
  //               ],
  //             );
  //           }) ??
  //       false;
  // }

  // Future<bool> _successMessage() {
  //   return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('ជោគជ័យ!'),
  //           content: Text("ការស្នើសុំរបស់អ្នកត្រូវបានបញ្ជូន"),
  //           actions: <Widget>[
  //             FlatButton(
  //               onPressed: () {
  //                 Navigator.pushReplacement(context,
  //                     MaterialPageRoute(builder: (context) => WithdrawForm()));
  //                 Navigator.of(context).pop();
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    _walletController.text = "350.00 \$";
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          // backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Withdraw",
            style: TextStyle(color: Colors.black, fontFamily: 'kh'),
            textScaleFactor: 1.2,
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: 
         Form(
            key: _mykey,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        icon: ImageIcon(AssetImage('assets/icons/wallet.png'), color: Theme.of(context).primaryColor,),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                        labelText:
                            "Wallet",
                        hintStyle: TextStyle(fontSize: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                      ),
                      controller: _walletController,
                      readOnly: true,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return 'Amount is required.';
                        // }
                        // return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        icon: Icon(Icons.local_atm, color: Theme.of(context).primaryColor,),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                        labelText:
                            "Amount",
                        hintStyle: TextStyle(fontSize: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                      ),
                      controller: _amountController,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return 'Amount is required.';
                        // }
                        // return null;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        icon: Icon(Icons.edit, color: Theme.of(context).primaryColor,),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                        labelText:
                            "Remark",
                        hintStyle: TextStyle(fontSize: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                      ),
                      controller: _noteController,
                      autocorrect: false,
                      validator: (value) {
                        // if (value.isEmpty) {
                        //   return 'remark is required.';
                        // }
                        // return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: RaisedButton(
                        elevation: 0,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "Request Withdraw",
                          style: TextStyle(color: Colors.white, fontFamily: 'kh', fontWeight: bold),
                          textScaleFactor: 1.2,
                        ),
                        onPressed: _onRequestWithdraw,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
