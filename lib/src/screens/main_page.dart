import 'package:flutter/material.dart';
import 'package:tutorial_flutter_sqflite/src/database/database.dart';
import 'package:tutorial_flutter_sqflite/src/model/car_model.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final db = CarDatabase();
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    setupList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          _buildAddButton(),
          _buildCarList(cars),
        ],
      ),
    );
  }

  Widget _buildCarList(List<Car> carsList) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: carsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Id'),
                    Text(carsList[index].id.toString()),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Model'),
                    Text(carsList[index].model),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Power'),
                    Text(carsList[index].power.toString()),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text('Top speed'),
                    Text(carsList[index].topSpeed.toString()),
                  ],
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    onDelete(carsList[index].id);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildAddButton() {
    return RaisedButton(
      child: Text('Add Car'),
      onPressed: () {
        onPressed();
      },
    );
  }

  onDelete(int id) async {
    await db.removeCar(id);
    db.fetchAll().then((carDb) => cars = carDb);
    setState(() {});
  }

  void onPressed() async {
    var car = new Car.random();
    await db.addCar(car);
    setupList();
  }

  void setupList() async {
    var _cars = await db.fetchAll();
    print(_cars);

    setState(() {
      cars = _cars;
    });
  }
}
