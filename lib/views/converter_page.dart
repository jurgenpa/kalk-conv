import 'package:flutter/material.dart';
import 'package:converter/converter.dart';
import 'package:flutter/services.dart';


class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {


  late TextEditingController _value3Controller;
  late String vastus;

  @override
  void initState() {
    super.initState();
    vastus = "0.00";
    _value3Controller = TextEditingController();
  }

  Widget _buildValue1TextField() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: TextField(
          controller: _value3Controller,
          decoration: InputDecoration(labelText: 'Sisesta km'),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(',')),
          ],
        ),
      );
    }

  @override
  void dispose() {
    super.dispose();
    _value3Controller.dispose();
  }

  void _calcUpdate(String opr) {
    setState(() {
      final double vaartus1 = double.parse(_value3Controller.text);
      final Length l1 = Length(vaartus1, 'km');
      vastus = l1.valueIn('mi').toString();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Km -> Mi teisendaja"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            Text('Vastus'),
            Align(
                alignment: Alignment.center,
                child: Text("$vastus", style: TextStyle(fontSize: 40, ),)
            ),
            Divider(height: 4, color: Colors.grey, thickness: 5, ),
            _buildValue1TextField(),
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _calcUpdate(vastus);
                  },
                  child: const Text('Teisenda'),),
              ],
            )
          ],
        ),
      ),
    );
  }

}