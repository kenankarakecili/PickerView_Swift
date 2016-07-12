# KKPickerView_Swift
An effective implementation for UIPickerView in Swift

![alt tag](https://raw.githubusercontent.com/KenanKarakecili/PickerView_Swift/master/Untitled-2.gif)

#Usage
```
class ViewController: UIViewController {

  let pickerView = KKPickerView()
  let data1 = ["1", "2", "3"]
  let data2 = ["a", "b", "c", "d"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pickerView.myDelegate = self
  }

}

extension ViewController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(textField: UITextField) {
    if textField == textField1 {
      pickerView.setup(textField, array: data1)
    } else if textField == textField2 {
      pickerView.setup(textField, array: data2)
    }
  }
  
}

extension ViewController: KKPickerViewDelegate {
  
  func pickerDidSelectAction(row: Int) {
    if pickerView.field == textField1 {
      textField1.text = data1[row]
    } else {
      textField2.text = data2[row]
    }
  }
  
}
```
