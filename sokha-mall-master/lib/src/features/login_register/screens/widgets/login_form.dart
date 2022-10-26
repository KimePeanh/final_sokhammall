import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/authentication/bloc/index.dart';
import 'package:sokha_mall/src/features/login_register/bloc/login/login_bloc.dart';
import 'package:sokha_mall/src/features/login_register/bloc/login/login_event.dart';
import 'package:sokha_mall/src/features/login_register/bloc/login/login_state.dart';
import 'package:sokha_mall/src/features/login_register/screens/login_register_page.dart';
import 'package:sokha_mall/src/shared/bloc/indexing/index.dart';
import 'package:sokha_mall/src/shared/widgets/error_snackbar.dart';
import 'package:sokha_mall/src/shared/widgets/loading_dialogs.dart';
import 'package:sokha_mall/src/utils/constants/app_constant.dart';
import 'package:sokha_mall/src/utils/helper/helper.dart';
import 'dialog_choose_country.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();
  final IndexingBloc countryIndexBloc = IndexingBloc();
  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    countryIndexBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is Logging) {
          loadingDialogs(context);
        } else if (state is Logged) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationStarted(token: state.token));
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        } else if (state is ErrorLogin) {
          Navigator.of(context).pop();
          errorSnackBar(
              text: (state.error[5] == "C")
                  ? AppLocalizations.of(context)!.translate(state.error)
                  : state.error,
              context: context);
        }
      },
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
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
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      AppLocalizations.of(context)!.translate("password")),
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .translate("passRequired");
                }
                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 5),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: EdgeInsets.all(15),
            //     child: Text(
            //       "Forget ChangePassword?",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(color: Colors.red),
            //     ),
            //   ),
            // ),
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
                      BlocProvider.of<LoginBloc>(context).add(LoginPressed(
                          phoneNumber: Helper.manipulatePhoneNumber(
                              code: countries[countryIndexBloc.state]["code"],
                              phoneNumber: _phoneNumberController.text),
                          password: _passwordController.text));
                    }
                  },
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    AppLocalizations.of(context)!.translate("logIn"),
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ])),
    );
  }
}
