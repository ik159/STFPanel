import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class StockDetailsClass {
  StockDetailsClass({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.picture,
    required this.dateOfBirth,
    required this.country,
    required this.registerDate,
    required this.phone,
    required this.gender,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String picture;
  String dateOfBirth;
  String country;
  String registerDate;
  String phone;
  String gender;
  factory StockDetailsClass.fromJson(Map<String, dynamic> json) =>
      StockDetailsClass(
          id: json["Symbol"],
          firstName: json["AssetType"],
          email: json["Name"],
          lastName: json["CIK"],
          picture: json["Exchange"],
          dateOfBirth: json["Currency"],
          country: json["Country"],
          registerDate: json["Sector"],
          phone: json["FiscalYearEnd"],
          gender: json["LatestQuarter"]);
}

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
                          snapshot.data!.firstName +
                              " " +
                              snapshot.data!.lastName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff050A30),
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (snapshot.data!.registerDate),
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Text(
                        snapshot.data!.gender,
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 15,
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        childAspectRatio: 1.8,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          detailCard(Icons.place, Color(0xff1f4037),
                              Color(0xff99f2c8), snapshot.data!.country),
                          detailCard(Icons.mail, Color(0xffF09819),
                              Color(0xffEDDE5D), snapshot.data!.email),
                          detailCard(Icons.phone, Color(0xffF09819),
                              Color(0xffEDDE5D), snapshot.data!.phone),
                          detailCard(
                            Icons.date_range_rounded,
                            Color(0xff1f4037),
                            Color(0xff99f2c8),
                            snapshot.data!.dateOfBirth,
                          ),
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
