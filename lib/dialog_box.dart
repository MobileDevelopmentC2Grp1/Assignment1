// Importing useful libraries and checkbox_state file
import 'package:flutter/material.dart';
import 'checkbox_state.dart';

//Creating a stateful class MenuList
class DialogBoxWidget extends StatefulWidget {
  const DialogBoxWidget({super.key});

  @override
  State<DialogBoxWidget> createState() => _DialogBoxWidgetState();
}

// Creating a stateless class/widget 
// which contains a form where a user 
// adds details of their order
class _DialogBoxWidgetState extends State<DialogBoxWidget> {


// Defining an object of a method to access the FormState 
//created automaticallyby Flutter when building a Form . 

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variable to keep track of the state of radio buttons
  int _value = 1;

 // Map contains main ingrediants 
 //and the constituents of the checkbox
  final ingredients = {
    CheckBoxState(title: 'Beef'),
    CheckBoxState(title: 'Fish'),
    CheckBoxState(title: 'Chicken'),
    CheckBoxState(title: 'Vegetarian'),
  };

  @override
  Widget build(BuildContext context) {
    //Layout of the form using the sizedbox widget
    return SizedBox(
        height: 500, // height
        width: 320, // width

        // Creating a scrollable child widget
        child: SingleChildScrollView(

          // creating column widget
            child: Column(
          children: <Widget>[
            // Container widget with vertical and horizontal padding
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 8.0,
              ),

              // Creating a form widget
              child: Form(
                // assigning the key to the created form key
                  key: this._formKey,
                  child: Column(
                    children: <Widget>[
                      // Quantity
                      // Wrapping the text field in a padding
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        //Creating a text field
                        child: TextFormField(

                          // validator() function for the quantity text field in the form.
                          validator: (String? value) {

                            //Checking if the user did not leave the field empty
                            if (value == null || value.isEmpty) {
                              return 'Quantity field cannot be empty';
                            } 
                            // Checking if a user provided a valid number for quantity
                            else if (value == '0') {
                              return 'Quantity should be a number bigger than 0';
                            }
                            return null;
                          },
                          // title of the field's label and hit
                          decoration: InputDecoration(
                            labelText: 'How many items are you buying? ',
                            hintText: '2',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      ),

                      // Wrapping the title of the radiobox in a padding
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // Title of the radiobox section
                        child: Row(
                          children: const [
                            Text(
                              "How do you prefer to get your order?",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                      // Radiobox
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        //widget for the radio options
                        child: Row(
                          children: [
                            // defining the first radio option
                            Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  // Matching the value and groupvalue when an option is checked
                                  setState(() {
                                    _value = 1;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),

                            // Name of the option
                            const Text("Pickup")
                          ],
                        ),
                      ),

                      // defining the second radio option
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  // Matching the value and groupvalue when an option is checked
                                  setState(() {
                                    _value = 2;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),

                            // Title of the radio of option
                            const Text("Delivery")
                          ],
                        ),
                      ),

                      //CHECKBOX widget
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 16.0),
                        child: Row(
                          children: const [
                            //Title of the widget
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
                            // Changing the map with list of ingredients into an list
                            children: [
                              ...ingredients.map(singleCheckbox).toList(),
                            ],
                          )),

                          //Creating a float button which activate the validator method to 
                          //check if user inputs matches the desired input
                      Container(
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          tooltip: "Place Order",
                          // invoking the validate() on click of the FAB
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          // giving the FAB an icon
                          child: const Icon(Icons.check),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        )));
  }

// Class singleCheckbox to handle checking of check boxes
  Widget singleCheckbox(CheckBoxState boxcheck) => CheckboxListTile(
        title: Text(boxcheck.title),
        value: boxcheck.value,
        onChanged: (value) {
          setState(() {
            boxcheck.value = value!;
          });
        },
        // defining colors of a checkbox on different states
        selectedTileColor: Colors.white,
        activeColor: Colors.purple[500],
        checkColor: Colors.white,
        tileColor: Colors.white,
        // bringing the box infront
        controlAffinity: ListTileControlAffinity.leading,
      );
}
