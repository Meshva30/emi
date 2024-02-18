import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const EMI());
}

class EMI extends StatefulWidget {
  const EMI({Key? key}) : super(key: key);

  @override
  State<EMI> createState() => _EMIState();
}

class _EMIState extends State<EMI> {
  double loanAmount = 100000.0;
  double interestRate = 10.0;
  double loanTenure = 24.0;
  double emi = 0.0;

  double calculateEMI() {
    double principal = loanAmount;
    double rateOfInterest = interestRate / 100 / 12;
    double numberOfPayments = loanTenure;

    double emi = ((principal *
            rateOfInterest *
            pow(1 + rateOfInterest, numberOfPayments)) /
        (pow(1 + rateOfInterest, numberOfPayments) - 1)) as double;

    return emi;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData(useMaterial3: true);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text(
            'EMI Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 80,
          leading: Icon(
            Icons.notes,
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.topCenter,
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\u{20B9} ${emi.toStringAsFixed(2)}/Month',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Loan Amount',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${loanAmount.toStringAsFixed(0)}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Slider(
                      value: loanAmount,
                      min: 0.0,
                      max: 200000.0,
                      divisions: 100,
                      onChanged: (value) {
                        setState(() {
                          loanAmount = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Interest Rate:',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' ${interestRate.toStringAsFixed(0)}%',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Slider(
                      value: interestRate,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (value) {
                        setState(() {
                          interestRate = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Loan Tenure: ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${loanTenure.toStringAsFixed(0)} Months',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Slider(
                      value: loanTenure,
                      min: 6.0,
                      max: 60.0,
                      onChanged: (value) {
                        loanTenure = value;
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        emi = calculateEMI();
                        setState(() {});
                      },
                      child: Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
