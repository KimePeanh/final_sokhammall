import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/appLocalizations.dart';
import 'package:sokha_mall/src/features/account/bloc/contact/contact_bloc.dart';
import 'package:sokha_mall/src/features/account/bloc/contact/contact_event.dart';
import 'package:sokha_mall/src/features/account/bloc/contact/contact_state.dart';
import 'package:sokha_mall/src/shared/widgets/error_snackbar.dart';
import 'package:sokha_mall/src/shared/widgets/loading_dialogs.dart';

import 'contact_us_modal.dart';

Widget contactUs() => Builder(
      builder: (context) {
        return BlocListener<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is FetchingContact) {
              loadingDialogs(context);
            }
            if (state is ErrorFetchingContact) {
              Navigator.of(context).pop();
              errorSnackBar(text: state.error.toString(), context: context);
            }
            if (state is FetchedContact) {
              Navigator.of(context).pop();
              contactUsModal(context, state.contact);
            }
          },
          child: TextButton(
            onPressed: () {
              BlocProvider.of<ContactBloc>(context).add(FetchContact());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.contacts, color: Theme.of(context).primaryColor),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                      AppLocalizations.of(context)!.translate("contactUs"),
                      textScaleFactor: 1,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.button),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
