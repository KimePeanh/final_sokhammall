import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/login_register/bloc/register/register_bloc.dart';
import 'package:sokha_mall/src/features/login_register/bloc/register/register_event.dart';
import 'package:sokha_mall/src/features/login_register/bloc/register/register_state.dart';
import 'package:sokha_mall/src/shared/bloc/indexing/index.dart';
import 'package:sokha_mall/src/shared/widgets/error_snackbar.dart';
import 'package:sokha_mall/src/shared/widgets/loading_dialogs.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';
import 'dialog_choose_country.dart';
import '../login_register_page.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();
  final IndexingBloc countryIndexBloc = IndexingBloc();
  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    countryIndexBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is Registering) {
          loadingDialogs(context);
        } else if (state is Registered) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationStarted(token: state.token));
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        } else if (state is ErrorRegistering) {
          Navigator.of(context).pop();
          errorSnackBar(text: state.error, context: context);
        }
      },
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.translate("name")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("nameRequired");
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            BlocBuilder(
              bloc: countryIndexBloc,
              builder: (c, int state) {
                return GestureDetector(
                  onTap: () {
                    dialogChooseCountry(context, (index) {
                      countryIndexBloc.add(Taped(index: index));
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image(
                              image: AssetImage(countries[state]["image"]),
                              width: 40,
                              height: 40),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          // color: Colors.red,
                          child: TextFormField(
                            controller: _phoneNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                prefixText: countries[state]["code"],
                                border: OutlineInputBorder(),
                                labelText: AppLocalizations.of(context)!
                                    .translate("phoneNumber")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .translate("phoneNumberRequired");
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              controller: _passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      AppLocalizations.of(context)!.translate("password")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("passRequired");
                } else if (value.length < 8) {
                  return AppLocalizations.of(context)!
                      .translate("passwordLength");
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!
                      .translate("confirmPassword")),
              validator: (value) {
                if (value!.isEmpty || value != _passwordController.text) {
                  return AppLocalizations.of(context)!
                      .translate("falseConfirmPass");
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(standardBorderRadius),
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<RegisterBloc>(context).add(
                          RegisterPressed(
                              name: _nameController.text,
                              phoneNumber: Helper.manipulatePhoneNumber(
                                  code: countries[countryIndexBloc.state]
                                      ["code"],
                                  phoneNumber: _phoneNumberController.text),
                              password: _passwordController.text));
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    AppLocalizations.of(context)!.translate("register"),
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ])),
    );
  }

  // dialogChooseCountry() {
  //   return showDialog<void>(
  //       context: context,
  //       builder: (context) => SimpleDialog(
  //             title: Text(
  //               AppLocalizations.of(context)!.translate("chooseCountry"),
  //             ),
  //             titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
  //             contentPadding: const EdgeInsets.fromLTRB(0.0, 0, 0.0, 16.0),
  //             children: [
  //               ...countries
  //                   .map((country) => Container(
  //                           child: TextButton(
  //                         style: TextButton.styleFrom(
  //                             backgroundColor: Colors.white),
  //                         onPressed: () {
  //                           countryIndexBloc
  //                               .add(Taped(index: countries.indexOf(country)));
  //                         },
  //                         child: Row(
  //                           crossAxisAlignment: CrossAxisAlignment.center,
  //                           children: [
  //                             Image(
  //                                 image: AssetImage(country["image"]),
  //                                 width: 35,
  //                                 height: 35),
  //                             SizedBox(width: 10),
  //                             Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                       AppLocalizations.of(context)!
  //                                           .translate(country["name"]),
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .subtitle1),
  //                                   SizedBox(height: 5),
  //                                   Text(country["code"],
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .subtitle2),
  //                                 ])
  //                           ],
  //                         ),
  //                       )))
  //                   .toList()
  //             ],
  //           ));
  // }
}
