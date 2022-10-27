import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/deposit/bloc/deposit_bloc.dart';

DepositBloc _depositBloc = DepositBloc();

class ScheduleDetail extends StatefulWidget {
  // const ScheduleDetail({ Key? key }) : super(key: key);
  final int id;
  ScheduleDetail({required this.id});

  @override
  State<ScheduleDetail> createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  @override
  Widget build(BuildContext context) {
    _depositBloc.add(FetchScheduleStart(id: widget.id));
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        // backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Schedule",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.1,
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
      body: BlocBuilder(
        bloc: _depositBloc,
        builder: (context, state) {
          if (state is FetchingDeposit) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorFetchDepost) {
            return Center();
          }
          return Container(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.98,
                      padding: EdgeInsets.all(10),
                      color: Theme.of(context).primaryColor,
                      child: Row(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            child: Text(
                              "NO.",
                              style: TextStyle(
                                  fontFamily: 'kh', color: Colors.white),
                              textScaleFactor: 1.1,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Amount",
                              style: TextStyle(
                                  fontFamily: 'kh', color: Colors.white),
                              textScaleFactor: 1.1,
                            ),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Date",
                              style: TextStyle(
                                  fontFamily: 'kh', color: Colors.white),
                              textScaleFactor: 1.1,
                            ),
                          )),
                          Expanded(
                              child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  fontFamily: 'kh', color: Colors.white),
                              textScaleFactor: 1.1,
                            ),
                          ))
                        ],
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: _depositBloc.deposit_list.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.98,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: index.isEven
                                    ? Colors.white
                                    : Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.07),
                                border: Border(
                                    bottom: BorderSide(color: Colors.black12))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(fontFamily: 'kh'),
                                    textScaleFactor: 1.1,
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${double.parse(_depositBloc.deposit_list[index].amount).toStringAsFixed(2)}\$",
                                    style: TextStyle(
                                        fontFamily: 'kh',
                                        fontWeight: FontWeight.bold),
                                    textScaleFactor: 1.1,
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${_depositBloc.deposit_list[index].date.split(" ")[0]}",
                                    style: TextStyle(fontFamily: 'kh'),
                                    textScaleFactor: 1.1,
                                  ),
                                )),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${_depositBloc.deposit_list[index].withdrawStatus}",
                                    style: TextStyle(
                                        fontFamily: 'kh',
                                        color: _depositBloc.deposit_list[index]
                                                    .withdrawStatus ==
                                                "completed"
                                            ? Theme.of(context).primaryColor
                                            : Colors.black),
                                    textScaleFactor: 1.1,
                                  ),
                                ))
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
