import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Variable para el valor del Slider
  double _sliderValue = 50.0;

  // Variable para el paso actual del Stepper
  int _currentStep = 0;

  // Variable para el valor del Switch
  bool _switchValue = false;

  // Variable para el índice seleccionado en el BottomNavigationBar
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaaziel Bennet Ciriaco Rueda/20220248'),
        actions: [
          // Menú desplegable en la AppBar
          PopupMenuButton<String>(
            onSelected: (String result) {
              print('Opción del menú seleccionada: $result');
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Opción 1'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('Opción 2'),
              ),
              PopupMenuItem<String>(
                value: 'option3',
                child: Text('Opción 3'),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        // Menú lateral (Drawer)
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Ejemplo de drawer'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Ejemplo de pestaña 1'),
              onTap: () {
                print('Pestaña 1 seleccionada');
              },
            ),
            ListTile(
              title: Text('Ejemplo de pestaña 2'),
              onTap: () {
                print('Pestaña 2 seleccionado');
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Título
                Text(
                  'Ejemplo de Widgets de Flutter/Dart:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                // Botón Elevado
                ElevatedButton(
                  onPressed: () {
                    print('Botón presionado');
                  },
                  child: Text('Ejemplo de elevated button'),
                ),
                SizedBox(height: 20),
                // Campo de Texto
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Ejemplo de label',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Checkbox
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: true,
                      onChanged: (bool? value) {
                        print('Checkbox cambiado a: $value');
                      },
                    ),
                    Text('Ejemplo de checkbox'),
                  ],
                ),
                SizedBox(height: 20),
                // Slider
                Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Text('Ejemplo de barra Slider: $_sliderValue'),
                SizedBox(height: 20),
                // Stepper
                Stepper(
                  currentStep: _currentStep,
                  onStepContinue: () {
                    setState(() {
                      _currentStep < 2 ? _currentStep += 1 : null;
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      _currentStep > 0 ? _currentStep -= 1 : null;
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Paso 1'),
                      content: Text('Ejemplo de paso 1'),
                    ),
                    Step(
                      title: Text('Paso 2'),
                      content: Text('Ejemplo de paso 2'),
                    ),
                    Step(
                      title: Text('Paso 3'),
                      content: Text('Ejemplo de paso 3'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Switch(
                      value: _switchValue,
                      onChanged: (bool value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                    Text('Ejemplo de opción de Switch'),
                  ],
                ),
                SizedBox(height: 20),
                // Botón Elevado con SnackBar
                ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Ejemplo de snackbar'),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Esconder',
                        onPressed: () {
                          // Código para deshacer
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('SnackBar'),
                ),
                SizedBox(height: 20),
                // ExpansionTile
                ExpansionTile(
                  title: Text('Ejemplo de expansiontile'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Ejemplo de elemento 1'),
                    ),
                    ListTile(
                      title: Text('ejemplo de elemento 2'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // InkWell
                InkWell(
                  onTap: () {
                    print('InkWell presionado');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.blue,
                    child: Text(
                      'Ejemplo de inkwell',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // BottomNavigationBar
                BottomNavigationBar(
                  currentIndex: _selectedTabIndex,
                  onTap: (index) {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Inicio',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Buscar',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Perfil',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Chip
                Chip(
                  label: Text('eemplo de etiqueta del chip'),
                  avatar: Icon(Icons.label),
                  onDeleted: () {
                    print('Chip eliminado');
                  },
                ),
                SizedBox(height: 20),
                // DataTable
                DataTable(
                  columns: [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Edad')),
                    DataColumn(label: Text('Ciudad')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Jaaziel')),
                      DataCell(Text('19')),
                      DataCell(Text('Manzanillo')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Andy')),
                      DataCell(Text('22')),
                      DataCell(Text('Manzanillo')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Ejemplo')),
                      DataCell(Text('de')),
                      DataCell(Text('datatable')),
                    ]),
                  ],
                ),
                SizedBox(height: 20),
                // Card
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Ejemplo de el título de la tarjeta'),
                        subtitle: Text('Ejemplo de el subtítulo de la tarjeta'),
                        leading: Icon(Icons.card_membership),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Ejemplo de el contenido de la tarjeta'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // ExpansionPanelList
                ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.all(0),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text('Ejemplo de panel axpansible'),
                        );
                      },
                      body: ListTile(
                        title:
                            Text('Ejemplo del contendio del panel expansible'),
                      ),
                      isExpanded: true,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
