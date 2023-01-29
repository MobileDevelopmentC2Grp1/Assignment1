// Class CheckBoxState to keep track 
//if a chechbox is active/check or not

class CheckBoxState {
  // Instance variable of the class
  final String title;
  bool value;
  // Creating a constructor for initialization
  CheckBoxState({
    required this.title,
    this.value = false,
  });
}
