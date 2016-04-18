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
  
  let pickerView = PickerView()
  let data1 = ["1", "2", "3"]
  let data2 = ["a", "b", "c"]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

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

