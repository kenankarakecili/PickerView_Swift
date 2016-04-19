# PickerView_Swift
An effective implementation for UIPickerView in Swift

![alt tag](https://raw.githubusercontent.com/KenanKarakecili/PickerView_Swift/master/Untitled-2.gif)

#Usage
```
class ViewController: UIViewController {

  let pickerView = PickerView()

}

extension ViewController: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(textField: UITextField) {
    if textField == textField1 {
      pickerView.dataArray = data1
    } else if textField == textField2 {
      pickerView.dataArray = data2
    }
    pickerView.field = textField
    pickerView.setPicker()
  }
  
}
```
