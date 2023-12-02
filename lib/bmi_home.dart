
import 'package:bmi_calculator/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});
  @override
  State createState() => _BmiHomeState();
}

class _BmiHomeState extends State{
  double heightValue = 1.5;
  double weightValue = 30;
  String status = '';
  double bmi = 0.0;
  Color color = Colors.green;

  @override

  _updateBmi(){
    bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
  }

  _updateStatus(){
    status = _getStatusAndColor()['text'];
  }

  _getStatusAndColor(){
      if(bmi < 16.0){
        return {'text' : BMI.underWeightSevere, 'color': Colors.green.shade100};
      }
      else if(bmi >= 16.0 && bmi <= 16.9){
        return  {'text' : BMI.underWeightModerate, 'color': Colors.green.shade200};
      }
      else if(bmi >= 17.0 && bmi <= 18.4){
        return {'text' :  BMI.underWeightModerate, 'color': Colors.green.shade300};
      }
      else if(bmi >= 18.5 && bmi <= 24.9){
        return {'text' : BMI.normal, 'color': Colors.green};
      }
      else if(bmi >= 25.0 && bmi <= 29.9){
        return {'text' :  BMI.OverweightPreObese, 'color': Colors.red.shade400};
      }
      else if(bmi >= 30.0 && bmi <= 34.9){
        return {'text' :  BMI.ObeseClass1 , 'color': Colors.red.shade500};
      }
      else if(bmi >= 35.0 && bmi <= 39.9){
        return {'text' : BMI.ObeseClass2 , 'color': Colors.red.shade700};
      }else{
        return {'text' : BMI.ObeseClass3 , 'color': Colors.red.shade900};
      }
  }

  @override
  void initState() {
    _updateBmi();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          BmiSlider(
              label: 'Height',
              unit: BmiUnit.m,
              sliderValue: heightValue,
              sliderDivision: 100,
              sliderMin: 1.2,
              sliderMax: 2.2,
              onChange: (newValue) {
                setState(() {
                  heightValue = newValue;
                });
                _updateBmi();
              }
          ),
          BmiSlider(
              label: 'Weight',
              unit: BmiUnit.kg,
              sliderValue: weightValue,
              sliderDivision: 200,
              sliderMin: 30,
              sliderMax: 100,
              onChange: (newValue) {
                setState(() {
                  weightValue = newValue;
                });
                _updateBmi();
              }
          ),
          Expanded( child: BmiResult(color: _getStatusAndColor()['color'],bmi: bmi,status: status,)),
        ],
      ),
    );
  }

}

class BmiSlider extends StatelessWidget {
  const BmiSlider({
    super.key,
    required this.label,
    required this.unit,
    required this.sliderValue,
    required this.sliderDivision,
    required this.sliderMin,
    required this.sliderMax,
    required this.onChange,
  });
  final String label;
  final BmiUnit unit;
  final double sliderValue;
  final int sliderDivision;
  final double sliderMax, sliderMin;
  final Function(double) onChange;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: textLabelStyle,),
            const SizedBox(width: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: RichText(text: TextSpan(
                text: sliderValue.toStringAsFixed(1),
                style: textValueStyle,
                children: [
                  TextSpan(
                    text: '${unit.name}',
                    style: textLabelStyle.copyWith(fontSize: 20)
                  )
                ]
              )),
            )
          ],
        ),
        Slider(
          activeColor: Colors.white70,
          inactiveColor: Colors.white30,
          label: sliderValue.toStringAsFixed(1),
          value: sliderValue,
          divisions: sliderDivision,
          max: sliderMax,
          min: sliderMin,
          onChanged: (double value) { onChange(value); },
        )
      ],
    );
  }
}

class BmiResult extends StatelessWidget {
  const BmiResult({super.key,
    required this.color,
    required this.bmi,
    required this.status
  });
  final Color color;
  final double bmi;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          AnimatedContainer(
            duration: const Duration(microseconds: 500),
            alignment: Alignment.center,
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color,width: 10)
            ),
            child: Text(bmi.toStringAsFixed(1),style: textValueStyle.copyWith(fontSize: 60),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(status,style: resultTextStyle,),
          )
      ],
    );
  }
}
