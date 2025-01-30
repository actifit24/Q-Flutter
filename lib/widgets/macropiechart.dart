import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MacroPieChart extends StatefulWidget {
  @override
  _MacroPieChartState createState() => _MacroPieChartState();
}

class _MacroPieChartState extends State<MacroPieChart> {
  double a = 0, b = 0;

  @override
  Widget build(BuildContext context) {
    double total = a + b;

    return Scaffold(
      appBar: AppBar(title: Text("Makro Dağılımı")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Günlük Makro Yüzdesi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),

          // Pie Chart
          SizedBox(
            height: 250,
            child: PieChart(
              PieChartData(
                sections: total > 0
                    ? [
                        PieChartSectionData(
                            color: Colors.blue,
                            value: (a / total) * 100,
                            title:
                                "%${(a / total * 100).toStringAsFixed(1)}kaldı "),
                        PieChartSectionData(
                            color: Colors.red,
                            value: (b / total) * 100,
                            title:
                                "%${(b / total * 100).toStringAsFixed(1)}aldın "),
                      ]
                    : [],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Kullanıcıdan veri giriş alanları (TextField)
          textField("Günlük gereken kalori (g)",
              (v) => setState(() => a = double.tryParse(v) ?? 0)),
          textField("aldığınız kalori ",
              (v) => setState(() => b = double.tryParse(v) ?? 0)),
        ]),
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
          fillColor: Colors.white,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
