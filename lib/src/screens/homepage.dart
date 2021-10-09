import 'package:flutter/material.dart';
import 'package:sequence_of_numbers/src/logic/generate.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController number = TextEditingController();

  int digit = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2 - 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              gradient: const LinearGradient(
                colors: [
                  Colors.lightBlue,
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "The $digit digit number in sequence is",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  height: 110.0,
                  width: 110.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.6,
                        color: Colors.blueGrey,
                        spreadRadius: 0.6,
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      digit == 0 ? "0" : searchElement(digit).toString(),
                      style: const TextStyle(
                        fontSize: 42.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2 - 40,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Give sequence number from 1 to N",
                ),
                SizedBox(
                  width: 110.0,
                  child: TextField(
                    controller: number,
                    decoration: const InputDecoration(
                      labelText: "digit number",
                    ),
                    onSubmitted: (String value) {
                      setState(() {
                        digit = int.parse(value);
                        number.clear();
                      });
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 6.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      digit = int.parse(number.text);
                      number.clear();
                    });
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 16.0
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}