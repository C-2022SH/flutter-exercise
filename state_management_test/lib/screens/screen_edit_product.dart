import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/provider/provider_products.dart';

import '../provider/product.dart';

class ScreenEditProduct extends StatefulWidget {
  @override
  State<ScreenEditProduct> createState() => _ScreenEditProductState();
}

class _ScreenEditProductState extends State<ScreenEditProduct> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageURLFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var _editedProduct =
      Product(id: "", title: "", description: "", price: 0, imageUrl: "");
  var _isInit = true;

  @override
  void initState() {
    super.initState();
    _imageURLFocusNode.addListener(_updateImageURL);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final productID = ModalRoute.of(context)!.settings.arguments as String;
        if (productID.isNotEmpty) {
          _editedProduct = Provider.of<ProviderProducts>(context, listen: false)
              .findByID(productID);
          _imageUrlController.text = _editedProduct.imageUrl;
          print("got product, named ${_editedProduct.title}");
        }
      }
    }

    _isInit = false;
  }

  @override
  void dispose() {
    super.dispose();
    // 얘네는 자동으로 지워지지 않아서 메모리 릭이 생길 수 있다

    // 안전하게 리스너도 다 날려 주기
    _imageURLFocusNode.removeListener(_updateImageURL);

    // 노드 전부 날리기
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageURLFocusNode.dispose();
    _imageUrlController.dispose();
  }

  void _updateImageURL() {
    if (!_imageURLFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();

    if (isValid) {
      _form.currentState!.save();

      if (_editedProduct.id.isEmpty) {
        Provider.of<ProviderProducts>(context, listen: false)
            .addProduct(_editedProduct);
      } else {
        Provider.of<ProviderProducts>(context, listen: false)
            .updateProduct(_editedProduct);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save_alt_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _editedProduct.title,
                decoration: const InputDecoration(labelText: "title"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  // soft keyboard에서 next 버튼이 눌렸을 때 여기에 연결된 노드로 넘어간다
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: newValue!, // nullity check 해야 함
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  // null을 리턴하면 잘 되었다는 뜻
                  if (value == null || value.isEmpty) {
                    return "please provide a value";
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _editedProduct.price.toString(),
                decoration: const InputDecoration(labelText: "price"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(newValue!),
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  // null을 리턴하면 잘 되었다는 뜻
                  if (value == null || value.isEmpty) {
                    return "please provide a value";
                  }

                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return "please enter a valid number";
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _editedProduct.description,
                decoration: const InputDecoration(labelText: "description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (newValue) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    description: newValue!,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  // null을 리턴하면 잘 되었다는 뜻
                  if (value == null || value.isEmpty) {
                    return "please provide a value";
                  }

                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrlController.text.isEmpty
                        ? const Text("enter a url")
                        : Container(
                            child: Image.network(_imageUrlController.text),
                            //fit: BoxFit.scaleDown,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      //initialValue: _editedProduct.imageUrl,
                      decoration:
                          const InputDecoration(label: Text("image url")),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageURLFocusNode,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) => _saveForm(),
                      onSaved: (newValue) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: newValue!,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      validator: (value) {
                        // null을 리턴하면 잘 되었다는 뜻
                        if (value == null || value.isEmpty) {
                          return "please provide a value";
                        }

                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
