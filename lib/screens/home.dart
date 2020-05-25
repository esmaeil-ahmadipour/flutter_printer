import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.print),
//          onPressed: _printDocument,
          onPressed: _printWeb,
        ),
      )
    );
  }

  void _printDocument() {
    Printing.layoutPdf(
      onLayout: (pageFormat) {
        final doc = pw.Document();

        doc.addPage(
          pw.Page(
            build: (pw.Context context) => pw.Center(
              child: pw.Text('Hello World!'),
            ),
          ),
        );

        return doc.save();
      },
    );
  }

  void _printWeb() {
    Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => await Printing.convertHtml(
          format: format,
          html: '<html><html><body><h2>Basic HTML Table</h2><table style="width:100%"><tr><th>Firstname</th><th>Lastname</th> <th>Age</th></tr><tr><td>Jill</td><td>Smith</td><td>50</td></tr><tr><td>Eve</td><td>Jackson</td><td>94</td></tr><tr><td>John</td><td>Doe</td><td>80</td></tr></table></body></html>',
        ));
  }
}
