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
                    width: MediaQuery.of(context).size.width * 0.95,
                    // height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.all(10),
                    // child: Text(
                    //     _historyInvestmentBloc.invest_list[index].status),
                    
                  );
                }),
          );
        },
      ),
    );
  }
}
