import 'package:flutter/material.dart';
import 'package:flutter_alura_bytebank_curso2/screens/contacts_list.dart';

class DashBoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      /*
        crossAligment -> horizontal
        mainAligment -> vertical
         */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.network("https://cdn.pixabay.com/photo/2016/02/18/20/02/seljalandsfoss-1207958_960_720.jpg")// uma forma de passar uma imagem vindo da rede
          Padding(
            //colocar margens
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/grass.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: // e nao podemos mais deixar o color no contaniner, e sim no Material
              Theme //esse theme é uma forma de pegar o theme definido no context do MaterialApp
                  .of(context)
                  .primaryColor,
              child: InkWell( //esse InkWell faz a mesma coisa q o GestureDetector, mas é do material, e para isso funcionar vc precisa colocar o InkWell dentro do Widget do material
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactsListWidget();
                      },
                    ),
                  );
                },
                child: Container(
                  //o container sempre cr5esce conforme qo tem dentro, nos child
                  padding: EdgeInsets.all(8.0),
                  //colocar um padding para todos os childs dentro do container
                  height: 100,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Contacts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
