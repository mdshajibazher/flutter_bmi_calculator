import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class BmiProvider extends ChangeNotifier{
  double _heightValue = 1.5;
  double _weightValue = 30;
  String _status = '';
  double _bmi = 0.0;
  Color _color = Colors.green;

  double get heightValue => _heightValue;

  Color get color => _color;

  double get bmi => _bmi;

  String get status => _status;

  double get weightValue => _weightValue;


  BmiProvider(){
    _updateBmi();
  }


  changeHeight(double value){
    _heightValue = value;
    _updateBmi();
  }

  changeWeight(double value){
    _weightValue = value;
    _updateBmi();
  }
  _updateBmi(){
    _bmi = weightValue / (heightValue * heightValue);
    _updateStatus();
    notifyListeners();
  }

  _updateStatus(){
    _status = getStatusAndColor()['text'];
  }
  getStatusAndColor(){
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

}