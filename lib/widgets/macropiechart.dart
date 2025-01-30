import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MacroPieChart extends StatefulWidget {
  @override
  _MacroPieChartState createState() => _MacroPieChartState();
}

class _MacroPieChartState extends State<MacroPieChart> {
  double gerekenKalori = 0, alinanKalori = 0;

  @override
  Widget build(BuildContext context) {
    double kalanKalori = gerekenKalori - alinanKalori;
    if (kalanKalori < 0) kalanKalori = 0;
    double total = gerekenKalori > 0 ? gerekenKalori : 1;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Günlük Makro Yüzdesi",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                        color: const Color.fromARGB(255, 189, 5, 5),
                        value: (kalanKalori / total) * 100,
                        title:
                            "${((kalanKalori / total) * 100).toStringAsFixed(1)}%",
                        titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                

                    PieChartSectionData(

                        color: const Color.fromARGB(255, 47, 198, 1),
                        value: (alinanKalori / total) * 100,
                        title:
                            "${((alinanKalori / total) * 100).toStringAsFixed(1)}%",
                         titleStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                    ),
                  ),
                  ],
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
            SizedBox(height: 20),
            textField("Günlük gereken kalori (g)", (v) {
              setState(() => gerekenKalori = double.tryParse(v) ?? 0);
            }),
            textField("Aldığınız kalori", (v) {
              setState(() => alinanKalori = double.tryParse(v) ?? 0);
            }),
          ],
        ),
      ),
    );
  }

  Widget textField(String label, Function(String) onChanged) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
         fillColor: Theme.of(context).colorScheme.surface,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
