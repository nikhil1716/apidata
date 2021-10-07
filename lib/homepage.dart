import 'dart:convert';

import 'package:apidata/model.dart/apidata.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  KalyanApi? hello;
  List<LastMonthWinner> lastMonthWinner = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    callApi();
  }

  callApi() async {
    Map<String, dynamic> requestDict = {
      "country": "india",
      "request": "home_page",
      "device_type": "android"
    };
    var response = await http.post(
        Uri.parse("https://www.kalyanmobile.com/apiv1_staging/home_page.php"),
        body: requestDict);
    print("Resp --> ${response.body}");

    setState(() {
      hello = KalyanApi.fromJson(jsonDecode(response.body));
    });
    print("data here ${hello?.productOfMonthListing?[0].productName}");

    print("lengthi s${hello?.lastMonthWinner?.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Product of the Month",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: double.infinity,
                  height: 240,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(100, 5, 0, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.network(
                              "${hello?.productOfMonthListing?[index].productImage}",
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${hello?.productOfMonthListing?[index].productName}",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: hello?.productOfMonthListing?.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Text(
                  "Employee of the Week",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        child: Card(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              CircleAvatar(
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2Epd2vXFCUYCfuatkZn4C7xIhl5gF-6zZjw&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                                radius: 40,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                  "${hello?.lastMonthWinner?[index].userName}"),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: hello?.lastMonthWinner?.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Brand",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  width: double.infinity,
                  height: 240,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Image.network(
                              "${hello?.brandListing?[index].brandImagePath}",
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("${hello?.brandListing?[index].brandName}"),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: hello?.brandListing?.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
