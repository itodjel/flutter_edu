import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/button_tab.dart';
import 'package:flutter_application_1/widgets/favorite.dart';
import 'blocs/tabs/all.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const green = const Color(0xFF7b7517);

  int _counter = 0;

  double _price = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _price = double.parse((84.99 * _counter).toStringAsFixed(2));
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _counter = _counter > 0 ? _counter-- : 0;
      _price = double.parse((84.99 * _counter).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TabsBloc(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [FavoriteIcon()],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<TabsBloc, TabsState>(
              builder: (context, tabsState) {
                return Column(
                  children: [
                    Text(
                      "Fruits Cake",
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'strawberry & kiwi special',
                      style: TextStyle(color: green, fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ButtonTab(
                            index: 1,
                            text: '1 Kg',
                          ),
                        ),
                        Expanded(
                          child: ButtonTab(
                            index: 2,
                            text: '2 Kg',
                          ),
                        ),
                        Expanded(
                          child: ButtonTab(
                            index: 3,
                            text: '3 Kg',
                          ),
                        ),
                        Expanded(
                          child: ButtonTab(
                            index: 4,
                            text: '4 Kg',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        BlocBuilder<TabsBloc, TabsState>(
                          builder: (context, tabsState) {
                            if (tabsState.status == TabsStateStatus.loading) {
                              return imgLoading();
                            } else
                              return Expanded(
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          tabsState.imgPath,
                                        ),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              );
                          },
                        ),
                        Container(
                          height: 200,
                          // width: width * 0.20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.add, color: Colors.white),
                                onPressed: () => _incrementCounter(),
                              ),
                              Container(
                                padding: const EdgeInsets.all(13.0),
                                decoration: BoxDecoration(
                                  color: green,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '$_counter',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove, color: Colors.white),
                                onPressed: () => _decrementCounter(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '\$$_price',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.w800),
                          ),
                        ]),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                            color: const Color(0xFF212129),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.sentiment_satisfied,
                                color: Colors.white54,
                                size: 42.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '4 Eggs',
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        )),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                    width: 1.0, color: Color(0xFF4d4d52)),
                                right: BorderSide(
                                    width: 1.0, color: Color(0xFF4d4d52)),
                              ),
                              color: const Color(0xFF212129),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.sentiment_neutral,
                                  color: Colors.white54,
                                  size: 42.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '2 tsp vanilla',
                                  style: TextStyle(fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          // width: width * 0.30,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            color: const Color(0xFF212129),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.sentiment_very_dissatisfied_outlined,
                                color: Colors.white54,
                                size: 42.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '2 cup sugar',
                                style: TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.map,
                            color: Colors.white54,
                            size: 95.0,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DELIVERY'),
                              Text('45, Amarlands'),
                              Text('Nr. Hamer Road, London'),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}

Widget imgLoading() {
  return Expanded(
    child: Container(
        child: Center(
            child: Container(
      child: CircularProgressIndicator(),
    ))),
  );
}
