//
//  ViewController.swift
//  PickerView
//
//  Created by Kenan Karakecili on 18/04/16.
//  Copyright © 2016 Kenan Karakecili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var textField1: NonPerformField!
  @IBOutlet weak var textField2: NonPerformField!
  
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

