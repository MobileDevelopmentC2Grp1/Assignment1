import 'package:flutter/material.dart';
import 'checkbox_state.dart';

class DialogBoxWidget extends StatefulWidget {
  const DialogBoxWidget({super.key});

  @override
  State<DialogBoxWidget> createState() => _DialogBoxWidgetState();
}

// Required
class LoginData {
  String fullnames = "";
  String email = "";
  String address = "";
  String quantity = "";
}

class _DialogBoxWidgetState extends State<DialogBoxWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _value = 1;

  final ingredients = {
    CheckBoxState(title: 'Beef'),
    CheckBoxState(title: 'Fish'),
    CheckBoxState(title: 'Chicken'),
    CheckBoxState(title: 'Vegetarian'),
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: 320,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 8.0,
              ),
              child: Form(
                  key: this._formKey,
                  child: Column(
                    children: <Widget>[
                      // Quantity
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Quantity field cannot be empty';
                            } else if (value == '0' || value.isEmpty) {
                              return 'Quantity should be a number bigger than 0';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'How many items are you buying? ',
                            hintText: '2',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text(
                              "How do you prefer to get your order?",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = 1;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text("Pickup")
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = 2;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text("Delivery")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                        child: Row(
                          children: const [
                            Text(
                              "What do you prefer? ",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Column(
                            children: [
                              ...ingredients.map(singleCheckbox).toList(),
                            ],
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          tooltip: "Place Order",
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          child: const Icon(Icons.check),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        )));
  }

  Widget singleCheckbox(CheckBoxState boxcheck) => CheckboxListTile(
        title: Text(boxcheck.title),
        value: boxcheck.value,
        onChanged: (value) {
          setState(() {
            boxcheck.value = value!;
          });
        },
        selectedTileColor: Colors.white,
        activeColor: Colors.purple[500],
        checkColor: Colors.white,
        tileColor: Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
      );
}
