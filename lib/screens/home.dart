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
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: IconButton(
            icon: const Icon(Icons.print),
//          onPressed: _printDocument,
            onPressed: _printWeb,
          ),
        ));
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
              baseUrl: 'https://i.ibb.co/6JwzHLD/',
              html:
                  '<html><html><body><h2>جدول تحت وب</h2><table style="width:100%"><tr>'
                  '<th>نام</th><th>نام خانوادگی</th> <th>سن</th></tr><tr>'
                  '<img src="repository-flutter-digikalla-Ui.jpg" style="width:200px;height:100px;">'
                  '<td>علی</td>'
                  '<td>رضایی</td>'
                  '<td>50</td>'
                  '</tr><tr><td>مهرداد</td><td>احمدی</td><td>32</td></tr><tr><td>حسن</td><td>رضایی</td><td>52</td></tr></table></body></html>',
            ));
  }
}
