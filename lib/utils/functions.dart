import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Utiliza a lib ImagePicker e retorna a imagem selecionada como Arquivo Uint8List
pickImage(ImageSource imageSource) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: imageSource);

  if (_file != null) {
    return await _file.readAsBytes();
  }
}

//Demonstrar SnackBar
showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
