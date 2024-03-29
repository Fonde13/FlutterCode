import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";

void main() {
  runApp(MaterialApp(home: const MoneyApp()));
}

class MoneyApp extends StatefulWidget {
  const MoneyApp({super.key});

  @override
  State<MoneyApp> createState() => _MoneyAppState();
}

class _MoneyAppState extends State<MoneyApp> {
  var isFoodTrue = false;
  var isEntertainmentTrue = false;
  var isInvestTrue = false;
  var isBillsTrue = false;
  var isSavingTrue = false;
  var totalNumofChoices = 0;
  var AmountofMoney = 0;
  var Percentage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          children: [
            Icon(Icons.money),
            Text(
              "Money Manager",
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            child: Expanded(
                          child: Row(children: [
                            Text("Enter Salary: "),
                            _SalaryField(),
                            Text("SAR")
                          ]),
                        )),
                      )
                    ],
                  ),
                ), // widdgets folder
                _Choices()
              ],
            ),
          ),
          Expanded(
            child: Column(children: [
              if (isFoodTrue)
                Row(children: [
                  Expanded(
                    child: Row(
                      children: [Text("Food")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Value %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Percentage %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  )
                ]),
              if (isSavingTrue)
                Row(children: [
                  Expanded(
                    child: Row(
                      children: [Text("Saving")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Value %")]),
                        Row(children: [Text("Data")]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Percentage %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  )
                ]),
              if (isInvestTrue)
                Row(children: [
                  Expanded(
                    child: Row(
                      children: [Text("Investment")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Value %")]),
                        Row(children: [Text("Data")]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Percentage %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  )
                ]),
              if (isEntertainmentTrue)
                Row(children: [
                  Expanded(
                    child: Row(
                      children: [Text("Entertainment")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Value %")]),
                        Row(children: [Text("Data")]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Percentage %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  )
                ]),
              if (isBillsTrue)
                Row(children: [
                  Expanded(
                    child: Row(
                      children: [Text("Bills")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Value %")]),
                        Row(children: [Text("Data")]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [Text("Percentage %")]),
                        Row(children: [Text("%$Percentage")]),
                      ],
                    ),
                  )
                ]),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _SalaryField() {
    return Expanded(child: TextField(
      onSubmitted: (value) {
        AmountofMoney = int.parse(value);

        calctotal();
        setState(() {});
      },
    ));
  }

  Widget _Choices() {
    return Container(
        child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              const Text("Food"),
              Checkbox(
                  value: isFoodTrue,
                  onChanged: (value) {
                    isFoodTrue = value!;
                    calctotal();

                    calctotal();
                    setState(() {});
                  })
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text("Entertainment"),
              Checkbox(
                  value: isEntertainmentTrue,
                  onChanged: (value) {
                    isEntertainmentTrue = value!;
                    calctotal();
                    setState(() {});
                  })
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text("Investment"),
              Checkbox(
                  value: isInvestTrue,
                  onChanged: (value) {
                    isInvestTrue = value!;

                    calctotal();
                    setState(() {});
                  })
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text("Bills"),
              Checkbox(
                  value: isBillsTrue,
                  onChanged: (value) {
                    isBillsTrue = value!;
                    calctotal();
                    setState(() {});
                  })
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Text("Saving"),
              Checkbox(
                  value: isSavingTrue,
                  onChanged: (value) {
                    isSavingTrue = value!;
                    calctotal();
                    calctotal();
                    setState(() {});
                  })
            ],
          ),
        ),
      ],
    ));
  }

  int calctotal() {
    totalNumofChoices = 0;
    if (isBillsTrue) totalNumofChoices += 1;
    if (isEntertainmentTrue) totalNumofChoices += 1;
    if (isFoodTrue) totalNumofChoices += 1;
    if (isInvestTrue) totalNumofChoices += 1;
    if (isSavingTrue) totalNumofChoices += 1;
    Percentage = (100 / totalNumofChoices) as int;
    return totalNumofChoices;
  }
}
