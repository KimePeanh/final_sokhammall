import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sokha_mall/src/features/investment/history_bloc/bloc/history_investment_bloc.dart';
import 'package:sokha_mall/src/features/investment/screen/schedule_detail.dart';

HistoryInvestmentBloc _historyInvestmentBloc = HistoryInvestmentBloc();

class Schecdule extends StatefulWidget {
  const Schecdule({Key? key}) : super(key: key);

  @override
  State<Schecdule> createState() => _SchecduleState();
}

class _SchecduleState extends State<Schecdule> {
  DateTime? selectedDay;
  List _invest = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _historyInvestmentBloc.add(StartFetchingHis());
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
        bloc: _historyInvestmentBloc,
        builder: (context, state) {
          if (state is FetchingInvestHis) {
            _invest.clear();
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorInvestHis) {
            _invest.clear();

            return Center();
          }
          _invest.clear();
          _historyInvestmentBloc.invest_list.length > 0
              ? _historyInvestmentBloc.invest_list.forEach((data) {
                  data.status != "pending" ? _invest.add(data) : _invest;
                })
              : _invest = [];

          print(_invest);
          return Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _invest.length,
                itemBuilder: (context, index) {
                  print(_invest[index].id);
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.95,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 1),
                                color: Colors.grey.shade200,
                                blurRadius: 5)
                          ]),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${_invest[index].request_date}",
                                      style: TextStyle(
                                          fontFamily: 'kh', color: Colors.grey),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Quantity: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'kh'),
                                                ),
                                                _invest[index].qty > 1
                                                    ? TextSpan(
                                                        text:
                                                            "${_invest[index].qty} shares",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontFamily: 'kh'),
                                                      )
                                                    : TextSpan(
                                                        text:
                                                            "${_invest[index].qty} share",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
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
                                                  text:
                                                      '${_invest[index].total} \$',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                                  text:
                                                      "${_invest[index].open_every_month} months",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'kh'),
                                                ),
                                                TextSpan(
                                                  text:
                                                      "${_invest[index].amount_to_be_paid} \$",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontFamily: 'kh'),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                          // _invest[index].status ==
                          //         "pending"
                          //     ? Container(
                          //         padding: EdgeInsets.only(
                          //             left: 10, right: 10, top: 5, bottom: 5),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(5),
                          //           color: Colors.orange,
                          //         ),
                          //         child: Text(
                          //             "${_invest[index].status}",
                          //             style: TextStyle(color: Colors.white)),
                          //       )
                          //     : Container(
                          //         padding: EdgeInsets.only(
                          //             left: 10, right: 10, top: 5, bottom: 5),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(5),
                          //           color: Theme.of(context).primaryColor,
                          //         ),
                          //         child: Text(
                          //           "${_invest[index].status}",
                          //           style: TextStyle(color: Colors.white),
                          //         ),
                          //       )
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleDetail(
                                  id: _invest[index].id,
                                ))),
                  );
                }),
          );
        },
      ),
    );
  }
}
