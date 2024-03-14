import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splashScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  double BMI = 0.0;
  String? NAME;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Height (in feet.inch)"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Weight"),
            ),
          ),
          TextButton(
            onPressed: () => CalcBMI(),
            child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                child: const Text("Enter")),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Text(
              "$NAME , your BMI IS : $BMI",
            ),
          )
        ],
      ),
    );
  }

  void CalcBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    int i = 1;
    String temp = height.toString();
    for (i = 0; i < temp.length; i++) {
      if (temp[i] == '.') {
        break;
      }
    }
    height = (double.parse(temp.substring(0, i)) * 12) +
        (double.parse(temp.substring(i + 1, temp.length)));
    height = height * 0.0254;
    if (height > 0.0) {
      setState(() {
        BMI = (weight) / (height * height);
        NAME = nameController.text;
      });
    }
  }
}
