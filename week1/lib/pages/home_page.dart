import "package:flutter/material.dart";

import "../api/get.dart";
import "../model/newsapi.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future
  late Future<NewsApi?> futureNewsData;

  horizontalscrollFunc(var size, Articles articledata) {
    return Container(
      width: size.width / 1.5,
      height: size.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            height: size.height / 5,
            width: size.width / 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(articledata.urlToImage!, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                return Text("Image not available");
              }),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            child: Container(
              width: size.width / 2,
              decoration: BoxDecoration(color: Colors.black12),
              child: Text(
                articledata.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 10,
            child: Icon(
              Icons.play_circle,
              size: 30,
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          )
        ],
      ),
    );
  }

  verticalscrollFunc(var size, var color) {
    return Container(
      width: size.width / 1.5,
      height: size.height / 5,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image Section
          Container(
            height: size.height / 5, // Adjust height for proportionality
            width: size.width / 2, // Adjust width for the image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "lib/images/food.jpeg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text("Image not available"));
                },
              ),
            ),
          ),

          SizedBox(width: 10),

          // Content Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Content",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/pagecontent");
                      },
                      child: Text("Order Now"),
                    ),
                    Text(
                      "Sep 25, 2024",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureNewsData = GetApi().getNewsApiCall();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: futureNewsData,
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  //network, server error
                  return Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                        child: Text("Server error"),
                      ));

                case ConnectionState.active:
                  return const CircularProgressIndicator();

                case ConnectionState.waiting:
                  return const CircularProgressIndicator();

                case ConnectionState.done:
                  NewsApi newsdata = snapshot.data;
                  return (snapshot.data != null || snapshot.hasData)
                      ? Column(
                          children: [
                            Container(
                              height: size.height / 5,
                              width: size.width / 1,
                              child: ListView.builder(
                                itemCount: newsdata.articles!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return horizontalscrollFunc(
                                      size, newsdata.articles![index]);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              height: size.height / 1.6,
                              width: size.width / 1,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return verticalscrollFunc(size, 0xfffEDE8DC);
                                },
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: size.height,
                          width: size.width,
                          child: const Center(
                            child: Text("No data available"),
                          ),
                        );

                default:
                  return Container(
                      height: size.height,
                      width: size.width,
                      child: Center(
                        child: Text("Server error"),
                      ));
              }
            },
          ),
        ],
      ),
    );
  }
}
