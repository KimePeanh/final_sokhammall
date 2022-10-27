import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sokha_mall/src/features/investment/history_bloc/bloc/history_investment_bloc.dart';

HistoryInvestmentBloc _historyInvestmentBloc = HistoryInvestmentBloc();

class InvestmentHistoryScreen extends StatefulWidget {
  const InvestmentHistoryScreen({Key? key}) : super(key: key);

  @override
  State<InvestmentHistoryScreen> createState() =>
      _InvestmentHistoryScreenState();
}

class _InvestmentHistoryScreenState extends State<InvestmentHistoryScreen> {
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    _historyInvestmentBloc.add(StartFetchingHis());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "History",
          style: TextStyle(color: Colors.black),
          textScaleFactor: 1.1,
        ),
      ),
      body: BlocBuilder(
        bloc: _historyInvestmentBloc,
        builder: (context, state) {
          if (state is FetchingInvestHis) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorInvestHis) {
            return Center();
          }
          return SmartRefresher(
            controller: _refreshController,
            cacheExtent: 1,
            physics: AlwaysScrollableScrollPhysics(),
            onRefresh: () {
              _historyInvestmentBloc.add(StartFetchingHis());
            },
            onLoading: () {
              if (_historyInvestmentBloc.state is EndofHistoryInvest) {
              } else {
                _historyInvestmentBloc.add(ReloadEvent());
              }
            },
            enablePullDown: true,
            enablePullUp: true,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _historyInvestmentBloc.invest_list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                                    "${_historyInvestmentBloc.invest_list[index].request_date}",
                                    style: TextStyle(fontFamily: 'kh', color: Colors.grey),
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
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'kh'),
                                              ),
                                              _historyInvestmentBloc
                                                          .invest_list[index]
                                                          .qty >
                                                      1
                                                  ? TextSpan(
                                                      text:
                                                          "${_historyInvestmentBloc.invest_list[index].qty} shares",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontFamily: 'kh'),
                                                    )
                                                  : TextSpan(
                                                      text:
                                                          "${_historyInvestmentBloc.invest_list[index].qty} share",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
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
                                                    '${_historyInvestmentBloc.invest_list[index].total} \$',
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
                                                    "${_historyInvestmentBloc.invest_list[index].open_every_month} months",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'kh'),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${_historyInvestmentBloc.invest_list[index].amount_to_be_paid} \$",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                        _historyInvestmentBloc.invest_list[index].status ==
                                "pending"
                            ? Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.orange,
                                ),
                                child: Text(
                                    "${_historyInvestmentBloc.invest_list[index].status}",
                                    style: TextStyle(color: Colors.white)),
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).primaryColor,
                                ),
                                child: Text(
                                  "${_historyInvestmentBloc.invest_list[index].status}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                      ],
                    ),
                  );
                }), 
          );
        },
      ),
    );
  }
}
