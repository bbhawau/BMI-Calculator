import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmiResult;

  void calculateBMI() {
    final double? height = double.tryParse(heightController.text);
    final double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0) {
      setState(() {
        bmiResult = weight / (height * height);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
          width: 300,
          height: 300,
          child: Column(
            children: [
              //Height
              Container(
                child: TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      border: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              //Weight
              Container(
                child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),

              ElevatedButton(onPressed: calculateBMI, child: Text('Calculate')),

              const SizedBox(
                height: 30,
              ),
              if (bmiResult != null)
                Text(
                  'Your BMI is: ${bmiResult!.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }
}
