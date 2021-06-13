import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wireframe/components/StockDetails.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
  List stockData = [];
  bool isLoading = true;
  void getstockData() async {
    var response;
    try {
      response = await Dio().get(
          'https://dummy-wireframe.iecsemanipal.com/stocks?apikey=icuasa3h58w3gimaetcxs');

      // var responseBody = json.decode(response);
      //print(responseBody);
      // print(response.data["count"]);
      setState(() {
        stockData = response.data["data"];
        isLoading = false;
      });
      // print(postsdata);
    } catch (e) {
      print(e);
    }

    //return postsdata = response["data"];
  }

  @override
  // ignore: must_call_super
  void initState() {
    getstockData();
  }

  Padding stockCard(String currency, String country, String name,
      String exchange, String id) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 5,
        color: Colors.grey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xffF09819),
                          Color(0xffEDDE5D),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.monetization_on_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    currency,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              child: Text(
                name,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xff1f4037),
                          Color(0xff99f2c8),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    country,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xff1f4037),
                          Color(0xff99f2c8),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.stacked_line_chart,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    exchange,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StockDetails(id: id),
                      ),
                    );
                  },
              child: Padding(
                padding: EdgeInsets.only(right: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xffF09819),
                          Color(0xffEDDE5D),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final textcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color(0xff050A30),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xff050A30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Stocks",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stockData.length,
                  // postsdata.length,
                  itemBuilder: (context, index) {
                    //  print(postsdata[index]["owner"]["firstName"]);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: stockCard(
                        stockData[index]["Currency"],
                        stockData[index]["Country"],
                        stockData[index]["Name"],
                        stockData[index]["Exchange"],
                        stockData[index]["_id"],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
