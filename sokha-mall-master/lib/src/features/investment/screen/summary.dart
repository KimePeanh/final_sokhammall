import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/checkout/screens/widgets/payment_method_dialog.dart';
import 'package:sokha_mall/src/features/checkout/screens/widgets/payment_type.dart';
import 'package:sokha_mall/src/features/investment/bloc/investment_bloc.dart';
import 'package:sokha_mall/src/features/investment/screen/confirm.dart';
import 'package:sokha_mall/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:sokha_mall/src/shared/bloc/indexing/index.dart';
import 'package:sokha_mall/src/shared/widgets/custom_dialog.dart';
import 'package:sokha_mall/src/shared/widgets/loading_dialogs.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';
import '../../../appLocalizations.dart';

InvestmentBloc _investmentBloc = InvestmentBloc();

class Summary extends StatefulWidget {
  final int qty;
  final String value;
  final String make_pro;
  final String total;
  final int open_every;
  final String money_to_paid;
  final String phonenumber;
  Summary(
      {required this.qty,
      required this.value,
      required this.make_pro,
      required this.total,
      required this.open_every,
      required this.money_to_paid,
      required this.phonenumber});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  IndexingBloc paymentTypeIndexingBloc = IndexingBloc();
  IndexingBloc paymentMethodIndexingBloc = IndexingBloc();
  FilePickupBloc _filePickupBloc = FilePickupBloc();

  @override
  void dispose() {
    paymentTypeIndexingBloc.close();
    paymentMethodIndexingBloc.close();
    _filePickupBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Deposit",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.2,
        ),
      ),
      body: BlocListener(
        bloc: _investmentBloc,
        listener: (context, state) {
          if (state is LoadingInvest) {
            loadingDialogs(context);
          } else if (state is ErrorInvest) {
            Navigator.pop(context);
          } else if (state is Invested) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ConfirmScreen()));
          }
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                BlocProvider(
                    create: (BuildContext context) => paymentTypeIndexingBloc,
                    child: PaymentType()),
                SizedBox(
                  height: 15,
                ),
                BlocProvider(
                  create: (BuildContext context) => paymentMethodIndexingBloc,
                  child: BlocBuilder(
                    bloc: paymentTypeIndexingBloc,
                    builder: (c, state) {
                      if (state == 0) {
                        return Container();
                      } else {
                        paymentMethodIndexingBloc.add(Taped(index: -1));
                        return _paymentMethodWidget(context);
                      }
                    },
                  ),
                ),
                BlocBuilder(
                  bloc: paymentTypeIndexingBloc,
                  builder: (context, state) {
                    if (state != 0) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              // color: Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(standardBorderRadius))),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!
                                  .translate("uploadTransImage")),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(),
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  height: MediaQuery.of(context).size.width / 3,
                                  child: AspectRatio(
                                      aspectRatio: 1,
                                      child: BlocBuilder(
                                        bloc: _filePickupBloc,
                                        builder: (context, dynamic state) {
                                          return (state == null)
                                              ? FittedBox(
                                                  child: Icon(
                                                    Icons.add_a_photo_outlined,
                                                    color: Colors.grey[300],
                                                  ),
                                                )
                                              : Image.file(state);
                                        },
                                      )),
                                ),
                              )
                            ],
                          ));
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                // Divider(),
                SizedBox(
                  height: 10,
                ),
                _summay(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        width: MediaQuery.of(context).size.width,
        height: 70,
        // color: Colors.amber,
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'AMOUNT TO PAY',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${widget.total}\$',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        textScaleFactor: 1.4,
                      ))
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              child: Container(
                alignment: Alignment.center,
                height: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.1,
                ),
              ),
              onTap: () {      
                if (paymentMethodIndexingBloc.state == (-1)) {
                  customDialog(
                      context,
                      "",
                      Text(AppLocalizations.of(context)!
                          .translate("pleaseChooseTransfer")),
                      () {});
                } else if (_filePickupBloc.state == null) {
                  customDialog(
                      context,
                      "",
                      Text(AppLocalizations.of(context)!
                          .translate("pleaseChooseTransImage")),
                      () {});
                } else {
                  print(_filePickupBloc.state);
                  int sum = widget.qty * 1000 + widget.qty * 400;
                  _investmentBloc.add(InvestPress(
                      quantity: widget.qty,
                      value: "${widget.qty * 1000}",
                      profit_per_year: "${widget.qty * 400}",
                      total: "${widget.qty * 1000 + widget.qty * 400}",
                      open_every_month: widget.open_every,
                      amount_to_be_paid: "${sum / (12 / widget.open_every)}",
                      phone_number: widget.phonenumber,
                      note: "",
                      imageurl: _filePickupBloc.state));
                }
              },
            )),
          ],
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        Helper.imgFromGallery((image) {
                          _filePickupBloc.add(image);
                        });
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      Helper.imgFromCamera((image) {
                        _filePickupBloc.add(image);
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _paymentMethodWidget(BuildContext contextt) {
    return Builder(
      builder: (c) {
        return BlocBuilder(
          bloc: BlocProvider.of<IndexingBloc>(c),
          builder: (context, int state) {
            return GestureDetector(
              onTap: () {
                paymentMethodDialog(c);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(standardBorderRadius))),
                  margin: EdgeInsets.only(bottom: 15),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!
                          .translate("chooseTransferMethod")),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(),
                      (paymentMethodIndexingBloc.state == (-1))
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .translate("choose here"),
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: Image(
                                    fit: BoxFit.fitWidth,
                                    // width: 15,
                                    // height: 15,
                                    image: AssetImage(
                                        paymentMethodList[state]["image"]),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(paymentMethodList[state]["name"],
                                            textScaleFactor: 1.1),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            paymentMethodList[state]
                                                ["description"],
                                            textScaleFactor: 1.1),
                                      ],
                                    )),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                    ],
                  )),
            );
          },
        );
      },
    );
  }

  _summay() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        color: Theme.of(context).primaryColor.withAlpha(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.qty > 1
                            ? Text(
                                "${widget.qty} shares/",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.3,
                              )
                            : Text(
                                "${widget.qty} share/",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.3,
                              ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "year",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.3,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.035,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10)),
                      color: Theme.of(context).primaryColor.withAlpha(200)),
                  child: Text(
                    "${widget.open_every} months",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textScaleFactor: 1.1,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            // color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Quantity: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'kh'),
                        ),
                        TextSpan(
                          text: "${widget.qty} shares",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'kh'),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Value: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kh',
                          ),
                        ),
                        TextSpan(
                          text: '${widget.total} \$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'kh',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //  SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Open every : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'kh',
                          ),
                        ),
                        TextSpan(
                          text: "${widget.open_every} months",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'kh'),
                        ),
                      ],
                    ),
                  ),
                ),
                //  SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Money to be paid : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: 'kh'),
                        ),
                        TextSpan(
                          text: "${widget.money_to_paid} \$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'kh'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
