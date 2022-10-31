import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/account/bloc/account_bloc.dart';
import 'package:sokha_mall/src/features/account/bloc/account_event.dart';
import 'package:sokha_mall/src/features/account/bloc/account_state.dart';
import 'package:sokha_mall/src/features/account/bloc/contact/contact_bloc.dart';
import 'package:sokha_mall/src/features/account/screens/widgets/contact_us_tile.dart';
import 'package:sokha_mall/src/features/authentication/bloc/authentication_bloc.dart';
import 'package:sokha_mall/src/features/authentication/bloc/authentication_state.dart';
import 'package:sokha_mall/src/features/investment/bloc/investment_bloc.dart';
import 'package:sokha_mall/src/features/investment/screen/investment_history_screen.dart';
import 'package:sokha_mall/src/features/investment/screen/summary.dart';
import 'package:sokha_mall/src/features/investment/screen/widget/information.dart';
import 'package:sokha_mall/src/shared/bloc/file_pickup/file_pickup_bloc.dart';
import 'package:sokha_mall/src/shared/bloc/indexing/index.dart';
import 'package:sokha_mall/src/shared/widgets/custom_dialog.dart';
import 'package:sokha_mall/src/shared/widgets/login_button.dart';
import 'package:sokha_mall/src/shared/widgets/register_button.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';

IndexingBloc paymentMethodIndexingBloc = IndexingBloc();
InvestmentBloc _investmentBloc = InvestmentBloc();

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({Key? key}) : super(key: key);

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  Color appcolor = Color(0xff00A652);
  TextEditingController amountcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  final _phonenumber = TextEditingController();
  late GlobalKey<FormState>? _formKey = GlobalKey<FormState>();


  IndexingBloc paymentTypeIndexingBloc = IndexingBloc();
  // IndexingBloc paymentMethodIndexingBloc = IndexingBloc();
  FilePickupBloc _filePickupBloc = FilePickupBloc();
  @override
  void dispose() {
    // paymentTypeIndexingBloc.close();
    _filePickupBloc.close();
    super.dispose();
  }

  String image = "";
  String text = "";
  TextStyle myNormalStyle = TextStyle(
    fontFamily: 'kh',
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  int qty = 1;
  int? a;
  void increase() {
    setState(() {
      qty++;
    });
  }

  void discrease() {
    if (qty > 1) {
      setState(() {
        qty--;
      });
    } else {}
  }

  List<int> month = [3, 6, 12];
  int index = 0;

  void inscrease() {
    setState(() {
      index++;
    });
  }

  void discreasee() {
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    a = qty * 1000 + qty * 400;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        // backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Investment",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.2,
        ),
        actions: [
          InkWell(
            child: Icon(
              Icons.history,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InvestmentHistoryScreen()));
            },
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticating) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotAuthenticated) {
            //return Text("j");
            return Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginButton(context: context),
                  SizedBox(height: 15),
                  registerButton(context: context),
                  SizedBox(height: 15),
                  BlocProvider(
                      create: (BuildContext context) {
                        return ContactBloc();
                      },
                      child: contactUs()),
                ],
              ),
            );
          }
          BlocProvider.of<AccountBloc>(context).add(FetchAccountStarted());
          // Future.delayed(Duration(microseconds: 100), () {
          //   _phonenumber.text =
          //       BlocProvider.of<AccountBloc>(context).state.user!.phone;
          // });
          BlocProvider.of<AccountBloc>(context).state.toString() ==
                  "FetchedAccount()"
              ? _phonenumber.text =
                  "0${BlocProvider.of<AccountBloc>(context).state.user!.phone.substring(3)}"
              : _phonenumber.text = "";
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Information(),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      width: width * 0.95,
                      child: Text(
                        AppLocalizations.of(context)!.translate('buyshare'),
                        style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                        textScaleFactor: 1.1,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.95,
                    child: Column(
                      children: <Widget>[
                        _quantity(),
                        SizedBox(
                          height: 20,
                        ),
                        each(AppLocalizations.of(context)!.translate("value"),
                            "\$ ${qty * 1000}", width, appcolor),
                        SizedBox(
                          height: 10,
                        ),
                        each(AppLocalizations.of(context)!.translate("mp1y"),
                            "\$ ${qty * 400}", width, appcolor),
                        SizedBox(
                          height: 10,
                        ),
                        each(
                            AppLocalizations.of(context)!.translate("total"),
                            "\$ ${qty * 1000 + qty * 400}",
                            width,
                            Colors.red.shade600),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: width * 0.95,
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate("choosetowithdraw"),
                        style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                        textScaleFactor: 1.1,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  _principal(),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: width * 0.95,
                      child: Text(
                        "Complete your investment withdraw account and phone number.",
                        style: TextStyle(fontWeight: bold, fontFamily: 'kh'),
                        textScaleFactor: 1.1,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.95,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: Text(
                            "Account No.",
                            overflow: TextOverflow.ellipsis,
                            style: myNormalStyle,
                            textScaleFactor: 1.2,
                          ),
                        )),
                        Expanded(
                            child: Container(
                          // color: Colors.red,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: appcolor)),
                          child: GestureDetector(
                            onTap: () {
                              _showPicker(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.width / 6,
                              child: AspectRatio(
                                  aspectRatio: 1.4,
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
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.95,
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Phone Number",
                            overflow: TextOverflow.ellipsis,
                            style: myNormalStyle,
                            textScaleFactor: 1.2,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Container(
                          // color: Colors.red,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _phonenumber,
                              decoration: InputDecoration(
                                icon: Icon(Icons.phone,
                                    color: Theme.of(context).primaryColor),
                                hintText: "Enter your phone number",
                              ),
                            validator: (value){
                              if (value!.isEmpty){
                                return "Enter your phone number";
                              }
                            },
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appcolor),
                      child: Text(
                        "Payment",
                        style: TextStyle(
                            fontWeight: bold,
                            fontFamily: "kh",
                            color: Colors.white),
                        textScaleFactor: 1.1,
                      ),
                    ),
                    onTap: () {
                      int sum = qty * 1000 + qty * 400;
                      if (_filePickupBloc.state == null) {
                        customDialog(
                            context,
                            "",
                            Text(AppLocalizations.of(context)!
                                .translate("pleaseChooseTransImage")),
                            () {});
                      } else if (_filePickupBloc.state != null && _formKey!.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Summary(
                                      qty: qty,
                                      value: "${qty * 1000}",
                                      make_pro: "${qty * 400}",
                                      total: "${qty * 1000 + qty * 400}",
                                      open_every:
                                          int.parse(month[index].toString()),
                                      money_to_paid:
                                          "${sum / (12 / month[index])}",
                                      phonenumber:
                                          "0${BlocProvider.of<AccountBloc>(context).state.user!.phone.substring(3)}",
                                    )));
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _quantity() {
    return Container(
      height: 40,
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Text(
              AppLocalizations.of(context)!.translate('quantity'),
              style: myNormalStyle,
              textScaleFactor: 1.2,
            ),
          )),
          Expanded(
              child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red.shade600,
                    ),
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.2,
                    ),
                  ),
                  onTap: () {
                    discrease();
                  },
                ),
                Text(
                  "$qty",
                  style: myNormalStyle,
                  textScaleFactor: 1.2,
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: appcolor,
                    ),
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                      textScaleFactor: 1.2,
                    ),
                  ),
                  onTap: () {
                    increase();
                  },
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  _principal() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    AppLocalizations.of(context)!.translate("openevery"),
                    style: myNormalStyle,
                    textScaleFactor: 1.2,
                  ),
                )),
                Expanded(
                    child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red.shade600,
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onTap: () {
                          // inscrease();
                          if (index > 0) {
                            discreasee();
                          } else {
                            setState(() {
                              index = 0;
                            });
                          }
                        },
                      ),
                      Text(
                        "${month[index]}",
                        style: myNormalStyle,
                        textScaleFactor: 1.2,
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: appcolor,
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(color: Colors.white),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        onTap: () {
                          if (index <= 1) {
                            inscrease();
                          } else if (index > 1) {
                            setState(() {
                              index = 2;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          each(AppLocalizations.of(context)!.translate("Money to be paid"),
              "\$ ${a! / (12 / month[index])}", width, appcolor),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget each(String text, String righttext, double width, Color color) {
    return Container(
      width: width * 0.95,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text(
                    "${text}",
                    overflow: TextOverflow.ellipsis,
                    style: myNormalStyle,
                    textScaleFactor: 1.2,
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  // color: Colors.blue.withOpacity(0.1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  child: Text(
                    righttext,
                    style: TextStyle(
                        fontFamily: 'ab', fontWeight: bold, color: color),
                    textScaleFactor: 1.2,
                  ),
                ))
              ],
            ),
          ),
        ],
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
}
