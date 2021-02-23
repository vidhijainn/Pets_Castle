import 'package:flutter/material.dart';
import 'package:flutter_app/log_in_screen.dart';
import 'package:flutter_app/sign_up_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List petsImagesList = [
    ["https://blogs.cdc.gov/publichealthmatters/files/2020/05/golden_retiver_cat_cropped.jpg", "Pet Doctor"],
    ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKATssg0avS6zpVktRlLbXVmyQv0cdBMhgrg&usqp=CAU", "Pet Trainer"],
    ["https://blogs.cdc.gov/publichealthmatters/files/2020/05/golden_retiver_cat_cropped.jpg", "Pet Hostel"],
    ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKATssg0avS6zpVktRlLbXVmyQv0cdBMhgrg&usqp=CAU", "Pet Groomers"],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen(title: 'Pets')),
                );
              }
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Card(
                  child: ClipRRect(
                    child: Image.network(
                      petsImagesList[0][0],
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null ?
                            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                height: 500,
                child: GridView.builder(
                    itemCount: petsImagesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 2)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context,int index) {
                      return Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              child: Image.network(
                                petsImagesList[index][0],
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null ?
                                      loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              petsImagesList[index][1]
                            )
                          ],
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}