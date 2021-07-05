import 'package:app_eletivas/checkbox_state.dart';
import 'package:flutter/material.dart';

class SegundaPagina extends StatefulWidget {
  const SegundaPagina({key}) : super(key: key);

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (_) => SegundaPagina(),
    );
  }

  @override
  _SegundaPaginaState createState() => _SegundaPaginaState();
}

class _SegundaPaginaState extends State<SegundaPagina> {
  final todasMetasDiarias = CheckboxState(title: 'Selecionar todas as metas');

  final metasDiarias = {
    CheckboxState(title: 'Praticar exercícios fisicos'),
    CheckboxState(title: 'Beber, no mínimo, 3L de água'),
    CheckboxState(title: 'Comer frutas ou legumes'),
    CheckboxState(title: 'Alongar-se durante o dia'),
    CheckboxState(title: 'Fazer pausas entre as tarefas do dia'),
    CheckboxState(title: 'Interagir com pessoas'),
  };

  Widget buildSingleCheckbox(CheckboxState checkbox) {
    return CheckboxListTile(
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: (bool value) {
        setState(() {
          checkbox.value = value;
          todasMetasDiarias.value = 
          metasDiarias.every((meta) => meta.value);
        });
      },
    );
  }

  Widget buildGroupCheckBox(CheckboxState checkbox) {
    return CheckboxListTile(
      title: Text(checkbox.title),
      value: checkbox.value,
      onChanged: toggleGroupCheckbox,
    );
  }

  void toggleGroupCheckbox(bool value) {
    if (value == null) return;
    AlertDialog(
            title: Text('Parabéns, você concluiu todas as tarefas!'),
            actions: <Widget>[
              TextButton(
                child: Text('Obrigado!'),
                onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    setState(() {
          todasMetasDiarias.value = value;
          metasDiarias.forEach((meta) {meta.value = value;});
    });
  }

  AppBar appBar() {
    return AppBar(
      title: Text('Metas diárias'),
    );
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          buildGroupCheckBox(todasMetasDiarias),
          Divider(color: Colors.white,),
          ...metasDiarias.map(buildSingleCheckbox).toList(),
        ],
      )
    ); 
  }
}


