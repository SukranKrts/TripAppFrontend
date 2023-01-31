import 'package:flutter/material.dart';

import 'mycardscreen.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

enum Menu {updatePassvord, delete, kart}

class _ProfileScreen extends State<ProfileScreen>{

  //String _selectedMenu = '';
  var _popupMenuItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text("Kullanıcı Bilgileri"),
        backgroundColor: const Color(0xff5ac18e),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (value){
              _onMenuItemSellected(value as int);
            },
            itemBuilder: (strg) => [
            builPopupMenu("Şifremi Değiştir", Icons.edit, Menu.updatePassvord.index),
            builPopupMenu("Hesabımı Sil", Icons.delete, Menu.delete.index),
            builPopupMenu("KartBilgilerim", Icons.credit_card, Menu.kart.index)
          ])
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            buildTextField("", "İsim Soyisim",Icons.person),
            buildTextField("", "Email", Icons.email),
            buildTextField("", "Telefon",Icons.phone),
            const SizedBox(height: 35),
              FloatingActionButton(
                backgroundColor: const Color(0xff5ac18e),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: const Text("Güncelle", style: TextStyle(fontSize: 17),),
                onPressed: (){})
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeHolder, IconData icon){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.green
            ),
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )
        ),
      ),
      );
  }
  
  PopupMenuItem builPopupMenu(String title,IconData icon, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: Colors.black,),
          Text(title)
        ],
      ));
  }

  showAlertDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("Hesabını sil!"),
          content: const Text("Hesabını silmet istediğinden eminmisin!"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextBtn("Sil", 0),
                buildTextBtn("İptal", 1)
              ],
            )
          ],
        );
      },
    );
  }

  buildTextBtn(String text, int sayi){
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        onPressed: () {
          if(sayi == 0){
            
          }else if(sayi == 1){
            Navigator.of(context).pop();
          }
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
          ),
        ),
    );
  }

  _onMenuItemSellected(int value){
    setState(() {
      _popupMenuItemIndex = value;
    });
    if(value == Menu.updatePassvord.index){
      //Navigator.pushNamed(context, );
    }if(value == Menu.delete.index){
      showAlertDialog();
    }
    if(value == Menu.kart.index){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyCardInfo()));
    }
  }
}