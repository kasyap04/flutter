import 'package:bingo/home/customeWidget/tableInputChild.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// class BingoTable extends StatefulWidget {
//   // const BingoTable({Key? key}) : super(key: key);

//   void shuffleNumbers() {
//     print("sdf");
//   }

//   @override
//   _BingoTableState createState() => _BingoTableState();
// }

// class _BingoTableState extends State<BingoTable> {
//   final List<Widget> cell = <Widget>[];

//   @override
//   void initState() {
//     super.initState();
//     for (int i = 1; i <= 25; i++) {
//       cell.add(TableInputChild(
//           isEven: i % 2 == 0 ? true : false,
//           cellNum: i < 10 ? "0$i" : i.toString()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       height: (screenSize.width * 0.95) + 2,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: GridView.count(
//         primary: false,
//         crossAxisCount: 5,
//         children: cell,
//       ),
//     );
//   }
// }

class BingoTable extends StatefulWidget {
  @override
  _BingoTableState createState() => _BingoTableState();
}

class _BingoTableState extends State<BingoTable> {
  final List<Widget> cell = <Widget>[];

  @override
  void initState() {
    super.initState();
    // _createRandomNumbers();
    // for (int i = 1; i <= 25; i++) {
    //   cell.add(TableInputChild(
    //       isEven: i % 2 == 0 ? true : false,
    //       cellNum: i < 10 ? "0$i" : i.toString()));
    // }
  }

  void _createRandomNumbers() {
    List<int> numbers = <int>[];
    numbers.clear();
    Random random = Random();
    while (numbers.length < 25) {
      int randomNumber = random.nextInt(25) + 1;

      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }

    // cell.clear();
    for (int i = 0; i < numbers.length; i++) {
      int n = numbers[i];
      cell.add(TableInputChild(
          isEven: i % 2 == 0 ? true : false,
          cellNum: n < 10 ? "0$n" : n.toString()));
    }

    // print(numbers);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    print(cell);

    // print(cell);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: screenSize.width * 0.95,
          width: screenSize.width * 0.95,
          // color: Colors.red,
          margin: const EdgeInsets.only(bottom: 20),
          child: GridView.count(
            primary: false,
            crossAxisCount: 5,
            children: cell,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            setState(_createRandomNumbers);
          },
          child: Text("Shuffle numbers"),
          style: OutlinedButton.styleFrom(
              primary: const Color.fromARGB(255, 128, 128, 128),
              textStyle: const TextStyle(fontSize: 22, color: Colors.grey),
              fixedSize: Size(screenSize.width - 20, 30)),
        ),
      ],
    );
  }
}
