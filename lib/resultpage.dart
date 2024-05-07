import 'package:bmi_calc/theme.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  final Color primaryButtonColor; 

  const ResultPage({super.key, required this.height,required this.weight,required this.primaryButtonColor,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('YOUR RESULT'),
    
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(height,weight,primaryButtonColor),
    );
  }
}


class Result extends StatefulWidget {

 final int height;
 final int weight;
 final Color primaryButtonColor; 

  const Result(this.height,this.weight, this.primaryButtonColor, {super.key});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
String comment = '';
  String headline = '';
  
  @override
  Widget build(BuildContext context) {
    double bmi = (widget.weight / (widget.height * widget.height)) * 10000;

    if (bmi < 18.5) {
      comment = "You are underweight. Try to gain weight by eating a balanced diet with plenty of protein and healthy fats. Consider consulting a dietitian.";
      headline = "UNDERWEIGHT";
    } else if (bmi >= 18.5 && bmi < 25) {
      comment = "You are at a healthy weight. Maintain your healthy weight by continuing to eat a balanced diet and staying physically active.";
      headline = "NORMAL";
    } else if (bmi > 25 && bmi <= 29.99) {
      comment = "You are overweight. Focus on losing weight gradually by reducing calorie intake and increasing physical activity. Consult a healthcare professional for personalized advice.";
      headline = "OVERWEIGHT";
    } else {
      comment = "You are obese. Take steps to improve your health by making changes to your diet and lifestyle. Consider seeking support from a healthcare professional or weight loss program.";
      headline = "OBESE";
    }

    return Column(
      children: <Widget>[

        Expanded(

          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width *0.9,
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary

            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(headline,style: headlines),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('${bmi.round()}', style: resultNumber),
                ),
                Column(
                  children: <Widget>[
                    const Text('Normal BMI range:'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18.5 - 25 kg/m",style: headlines,),
                ),
                  ],
                ),
                

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(comment, style: headlines,),
                )
              ],
            ),
          ),        
        ),

        InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                color: primaryButtonColor,
                margin: const EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text('RE-CALCULATE', style: primaryButtonStyle),
                  ),
             ),
           ),


      ],
    );
  }
}
