import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class age_Calculator extends StatefulWidget {
   age_Calculator({Key? key}) : super(key: key);

  @override
  State<age_Calculator> createState() => _age_CalculatorState();
}

class _age_CalculatorState extends State<age_Calculator> {
   DateTime today = DateTime.now();

   GlobalKey<FormState> formKey = GlobalKey();

   String? years='';

   String? month='';

   String? day='';

   int? ageYear=0;

   int? ageMonth=0;

   int? ageDay=0;

   int? ageHour=0;

   int? ageMinute=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Age Calculator',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('  Y',style: TextStyle(color: Colors.white,fontSize: 20),),
                          SizedBox(
                            width: 130,
                            height:58,
                            child: TextFormField(
                              cursorColor: Colors.white,
                              onChanged: (value) {
                                if (value.length == 4) {
                                  FocusScope.of(context).nextFocus();
                                }
                                years=value;
                              },

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '0000',
                                filled: true,
                                  fillColor: Colors.white10,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  hintStyle: const TextStyle(color: Colors.white),
                              ),

                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         const Text('  M',style: TextStyle(color: Colors.white,fontSize: 20),),
                        SizedBox(
                          width: 70,
                          height:58,
                          child: TextFormField(
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              if (value.length == 2) {
                                FocusScope.of(context).nextFocus();
                              }
                              month=value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '00',
                              filled: true,
                                fillColor: Colors.white10,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 12),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('  D',style: TextStyle(color: Colors.white,fontSize: 20),),
                        SizedBox(
                          width: 70,
                          height:58,
                          child: TextFormField(
                            cursorColor: Colors.white,
                            onChanged: (value) {
                              if (value.length == 2) {
                                FocusScope.of(context).nextFocus();
                              }
                              day=value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '';

                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: '00',
                              filled: true,
                                fillColor: Colors.white10,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 50,bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const Text(
                        'Your Age Is....... '
                            ,
                        style: TextStyle(
                            color: Colors.blue, fontSize: 20),
                      ),
                     Text(
                            '$ageYear  years and ',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                     Text('$ageMonth  months and',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                     Text('$ageDay  days and',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                     Text('$ageHour  hour and ',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                      Text('$ageMinute  hour',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                    setState(() {
                      ageYear = today.year-int.parse(years!);
                      ageMonth= today.month-int.parse(month!);
                      ageDay  = today.day-int.parse(day!);
                      ageHour = today.hour -int.parse(day!);
                      ageMinute=today.minute-ageHour!;
                    });}else{showSnackBar(context, 'ENTER THE VALUE');}
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    alignment: Alignment.center,
                    child:const Text(
                      'Calculator',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}