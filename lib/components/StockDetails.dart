import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wireframe/components/StockDetailsClass.dart';

class StockDetails extends StatefulWidget {
  final String id;
  const StockDetails({Key? key, required this.id}) : super(key: key);

  @override
  _StockDetailsState createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  List postsdata = [];
  bool isLoading = true;

  Future<StockDetailsClass> getStockDetails() async {
    var response;
    try {
      response = await Dio().get(
          'https://dummy-wireframe.iecsemanipal.com/stock/${widget.id}?apikey=icuasa3h58w3gimaetcxs');

      if (response.statusCode == 200) {
        print(response.data["data"]);
        return StockDetailsClass.fromJson(response.data["data"]);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (e) {
      print(e);
      throw e;
    }

    //return postsdata = response["data"];
  }

  Padding detailslower(String name , String desc){
    return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Column(
                                  children: [
                                    Text(
                                     name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                     desc,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
                              );
  }


  Card detailCard(IconData icon, Color x1, Color x2, String text) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      // shadowColor: Colors.grey.shade300,
      elevation: 5.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: <Color>[
                    x1,
                    x2,
                  ],
                ).createShader(bounds);
              },
              child: Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   getStockDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Details"),
        centerTitle: true,
        // iconTheme: IconThemeData(
        //   color: Color(0xff050A30),
        // ),
        backgroundColor: Color(0xff050A30),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: FutureBuilder<StockDetailsClass>(
        future: getStockDetails(),
        builder: (context, snapshot) {
          //  print(snapshot.data!.registerDate);
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xff050A30),
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Text("error while loading");
              else
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          snapshot.data!.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff050A30),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        snapshot.data!.assetType,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        childAspectRatio: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          detailCard(Icons.place, Color(0xff1f4037),
                              Color(0xff99f2c8), snapshot.data!.country),
                          detailCard(
                              Icons.monetization_on_rounded,
                              Color(0xffF09819),
                              Color(0xffEDDE5D),
                              snapshot.data!.currency),
                          detailCard(
                              Icons.stacked_line_chart,
                              Color(0xffF09819),
                              Color(0xffEDDE5D),
                              snapshot.data!.exchange),
                          detailCard(
                            Icons.copyright,
                            Color(0xff1f4037),
                            Color(0xff99f2c8),
                            snapshot.data!.symbol,
                          ),
                        ],
                      ),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(accentColor: Colors.black),
                          child: ExpansionTile(
                            title: Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 23.0),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  (snapshot.data!.description),
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                       GridView.count(
                         physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(30),
                        childAspectRatio: 1.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          detailslower("Sector", snapshot.data!.sector),
                          detailslower("Employees", snapshot.data!.fullTimeEmployees),
                          detailslower("Latest Quarter", snapshot.data!.latestQuarter),
                          detailslower("Dividend ", snapshot.data!.dividendPerShare),
                          detailslower("Dividend Yield", snapshot.data!.dividendYield),
                          detailslower("DividendDate", snapshot.data!.dividendDate),
                          detailslower("ExDividendDate", snapshot.data!.exDividendDate),
                          detailslower("CIK", snapshot.data!.cIK),
                              
                        ],
                      ),
                    
                     
                    ],
                  ),
                );
          }
        },
      ),
    );
  }
}
