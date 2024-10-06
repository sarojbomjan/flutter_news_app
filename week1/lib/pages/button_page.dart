import 'package:flutter/material.dart';
import 'package:week1/static.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key});

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodyForNeedy"),
      ),
      body: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height / 3,
                    width: size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        StaticValue.newsdetail!.urlToImage!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Text("Image not available");
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    child: Text(
                      StaticValue.newsdetail!.title!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Share button
                  Positioned(
                    right: 30,
                    top: 30,
                    child: Icon(
                      Icons.share,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),

                  // Play button
                  Container(
                    height: size.height / 3,
                    child: Center(
                      child: Icon(
                        Icons.play_circle,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Divider(
                thickness: 1,
              ),
              Text(
                "Latest Menu",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Visit us for quality food and services",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              SizedBox(
                height: 20,
              ),
              //Menu List
              Expanded(
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 219, 206, 184)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/images/food3.webp",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          //Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delicious Goat Cheese and Pumpkin Risotto",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                                Text(
                                  "\$7.99",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Image.asset(
                          "lib/images/food4.webp",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        //Text
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grilled Ham and Cheese Sandwich With Fresh Pears",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$5.99",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ))
                      ]),
                      SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Image.asset(
                          "lib/images/food1.webp",
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        //Text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Loaded Cauliflower",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "\$4.99",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
