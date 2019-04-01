//
//  SettingsViewController.swift
//  UnitTestsProject
//
//  Created by Петр on 27/03/2019.
//  Copyright © 2019 DreamTeam. All rights reserved.
//

import UIKit

class SettingsViewController:
    UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate,
    SettingsViewInput {

    /// Textfield for media type
    @IBOutlet weak var mediaTypeTextField: UITextField!
    
    /// Displays search results count
    @IBOutlet weak var searchResultsCountLabel: UILabel!
    
    /// Software type
    @IBOutlet weak var softwareTypeSegmentedControl: UISegmentedControl!
    
    /// Slider of search results count
    @IBOutlet weak var searchResultsSlider: UISlider!
    
    /// Presenter
    var settingsPresenter: SettingsViewOutput!
    
    /// Media type pick options
    var mediaTypePickOptions: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        attachPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingsPresenter.setInitialState()
    }

    
    // MARK: - Picker view handler
    
    private func attachPickerView() {
        
        guard mediaTypeTextField != nil else { return }
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        mediaTypeTextField.inputView = pickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = false
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        mediaTypeTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneClick() {
        
        mediaTypeTextField.resignFirstResponder()
        settingsPresenter.setMediaType(type: mediaTypeTextField.text)
    }
    
    @objc func cancelClick() {
        mediaTypeTextField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mediaTypePickOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mediaTypePickOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mediaTypeTextField.text = mediaTypePickOptions[row]
    }
    
    
    // MARK: - Slider handler
    
    /// Change search results count
    @IBAction func searchResultsCountChanged(_ sender: UISlider) {
        settingsPresenter.setSearchResultsCount(count: Int(sender.value))
    }
    
    
    // MARK: - Segmented control handler
    
    @IBAction func softwareTypeChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settingsPresenter.setSoftwareType(softwareTypes[0])
        case 1:
            settingsPresenter.setSoftwareType(softwareTypes[1])
        default:
            break;
        }
    }
    
    
    // MARK: - View input
    
    func setValues(mediaType: String, softwareType: String, searchResultsCount: Int) {
        
        guard mediaTypePickOptions.contains(mediaType) && searchResultsCount > 0 && searchResultsCount < 201
            else { return }

        mediaTypeTextField.text = mediaType
        searchResultsCountLabel.text = String(searchResultsCount)
        searchResultsSlider.value = Float(searchResultsCount)

        if (softwareTypes.contains(softwareType)) {
            let index = softwareTypes.firstIndex(of: softwareType)
            softwareTypeSegmentedControl.selectedSegmentIndex = index! == -1 ? 0 : index!
        }
    }
    
}
