import 'package:flutter/material.dart';

// custom created screens
import 'package:flutter_app/models/only_images.dart';
import 'package:flutter_app/models/pet_doctors_model.dart';
import 'package:flutter_app/models/pets_images_list.dart';

// custom created widgets
import 'package:flutter_app/widgets/carousel_component.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<PetDoctorsModel> petDoctorsModelList = [
    PetDoctorsModel(iconLabel: 'Veterinarian', imageName: 'assets/icons/hospital.png'),
    PetDoctorsModel(iconLabel: 'Training', imageName: 'assets/icons/trainer.png'),
    PetDoctorsModel(iconLabel: 'Grooming', imageName: 'assets/icons/groom.png'),
    PetDoctorsModel(iconLabel: 'Hostel', imageName: 'assets/icons/hostel.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselComponent(images: onlyImages),
              Container(
                height: 500,
                child: GridView.builder(
                    itemCount: petDoctorsModelList.length,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(petDoctorsModelList[index].imageName),
                            Text(petDoctorsModelList[index].iconLabel)
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