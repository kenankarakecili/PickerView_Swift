//
//  PickerView.swift
//
//  Created by Kenan Karakecili on 4/15/16.
//  Copyright © 2016 Kenan Karakecili. All rights reserved.
//

import UIKit

protocol KKPickerViewDelegate {
  func pickerDidSelectAction(row: Int)
}

class KKPickerView: UIPickerView {
  
  private var array: [String] = []
  var field: UITextField!
  var myDelegate: KKPickerViewDelegate?
  
  func setup(field: UITextField, array: [String]) {
    self.field = field
    self.array = array
    backgroundColor = UIColor.groupTableViewBackgroundColor()
    showsSelectionIndicator = true
    delegate = self
    dataSource = self
    let toolBar = UIToolbar()
    toolBar.barStyle = UIBarStyle.Default
    toolBar.tintColor = UIColor.blueColor()
    toolBar.sizeToFit()
    let doneButton = UIBarButtonItem(title: "OK", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(doneButtonAction))
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(cancelButtonAction))
    toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
    field.inputView = self
    field.inputAccessoryView = toolBar
    field.tintColor = UIColor.clearColor()
    if field.text?.characters.count > 0 {
      let row = self.array.indexOf(field.text!)
      selectRow(row!, inComponent: 0, animated: false)
    } else {
      selectRow(0, inComponent: 0, animated: false)
    }
  }
  
  @objc private func doneButtonAction() {
    field.resignFirstResponder()
    let row = selectedRowInComponent(0)
    myDelegate!.pickerDidSelectAction(row)
  }
  
  @objc private func cancelButtonAction() {
    field.resignFirstResponder()
  }
}

extension KKPickerView: UIPickerViewDataSource, UIPickerViewDelegate {
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return array.count
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
    let view2 = UIView(frame: CGRectMake(0, 0, 320, 44))
    let label = UILabel(frame: view2.frame)
    label.textAlignment = .Center
    label.text = array[row]
    view2.addSubview(label)
    return view2
  }
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return array[row]
  }
  
}
