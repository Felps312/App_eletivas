import 'package:app_eletivas/segundaPagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'calculadoraIMC.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _chaveFormulario = GlobalKey<FormState>();
  TextEditingController _pesoEdit = TextEditingController();
  TextEditingController _alturaEdit = TextEditingController();
  TextEditingController _idadeEdit = TextEditingController();
  
  String _resultado;

  void limparCampos() {
    _pesoEdit.text = '';
    _alturaEdit.text = '';
    _idadeEdit.text = '';
    

    setState(() {
          _resultado = 'Informe peso, altura e idade';
        });
  }

  @override
  void initState() {
    super.initState();
    limparCampos();
  }

  void calcularIMC() {
    double peso = double.parse(_pesoEdit.text);
    double altura = double.parse(_alturaEdit.text) / 100.0;
    int idade = int.parse(_idadeEdit.text);
    var calculadoraIMC = new CalculadoraIMC(altura, peso, idade);

    setState(() {
          _resultado = calculadoraIMC.classificar();
        });
  }

  FloatingActionButton botaoDeCalculo() {
    return FloatingActionButton(
      onPressed: () {
        if (_chaveFormulario.currentState.validate()) {
          calcularIMC();
        }
      },
      tooltip: 'Calcular',
      child: Icon(Icons.calculate),
      backgroundColor: Colors.teal.shade400,
    );  
  }

  IconButton botaoDeLimpar() {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        limparCampos();
      }
    );
  }
  
  AppBar appBar(String titulo) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
       botaoDeLimpar(),
      ],
    );
  }

  TextFormField campotexto({TextEditingController controller, String mensagemDeErro, String rotulo}) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(labelText: rotulo),
      controller: controller,
      validator: (text) {
        return text.isEmpty ? mensagemDeErro : null;
      },
    );
  }
  
  Container textoResultado() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _resultado,
        textAlign: TextAlign.center,
        textScaleFactor: 1.5,
      ),
    );
  }

  Form formulario() {
    return Form(
      key: _chaveFormulario,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          campotexto(
            rotulo : 'Peso (Kg)',
            mensagemDeErro: 'Informe o peso!',
            controller: _pesoEdit
          ),
          campotexto(
            rotulo: 'Altura (cm)',
            mensagemDeErro: 'Informe a altura!',
            controller: _alturaEdit
          ),
          campotexto(
            rotulo: 'Idade',
            mensagemDeErro: 'Informa a idade!',
            controller: _idadeEdit,
          ),
          textoResultado(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(widget.title),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: formulario()
      ),
      floatingActionButton:  botaoDeCalculo(),
      bottomNavigationBar: IconButton(
        icon: Icon(Icons.add),
        iconSize: 30,
        tooltip: 'Ir para próxima página',
        alignment: Alignment.topCenter,
        onPressed: () {
          Navigator.push(
            context,
            SegundaPagina.route(),
          );
        },
      ),
    );
  }
}
