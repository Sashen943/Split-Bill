//
//  AmountViewController.swift
//  Split Bill
//
//  Created by Sashen Pillay on 2019/06/09.
//  Copyright © 2019 Sashen Pillay. All rights reserved.
//

import UIKit
import CoreLocation

class AmountViewController: UIViewController {
    
    var amount: Float?
    var address: String = "Unknown location" {
        didSet {
            locationLabel.text = self.address
        }
    }


    private lazy var amountViewModel = AmountViewModel(amountView: self)
    let locationManager = CLLocationManager()
    let locationUtility = LocationUtility()

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loadingIndicationView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoadingIndicator()
        amountViewModel.configureUI()
        checkIfLocationServices()
        amountTextField.becomeFirstResponder()
        amountTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        self.styleNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        amountViewModel.nextButtonTap(amount: amountTextField.text ?? "", address: address)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "people" {
            let viewController = segue.destination as! PeopleViewController
            viewController.bill = amountViewModel.bill
        }
    }
    
   @objc func textChanged(_ textField: UITextField) {
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
        }
    }
    
    @objc func historyButtonTapped() {
        navigateToHistoryScreen()
    }
    
    private func styleNavigationBar() {
        if (self.navigationController?.navigationBar) != nil {
             self.navigationController?.navigationBar.backgroundColor = .black
             self.navigationController?.navigationBar.barTintColor = .black
        }
    }

    func checkIfLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            self.setupLocationManager()
            self.checkLocationAuthorization()
        } else {
            
        }
    }

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            handleThatLocationCouldNotAttained()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
             handleThatLocationCouldNotAttained()
        }
    }
    
    private func handleThatLocationCouldNotAttained() {
        self.address = "Couldn't determine location"
        self.hideLoadingIndicator()
    }

}

extension AmountViewController: AmountView {
    func showLoadingIndicator() {
        self.loadingIndicationView.isHidden = false
    }
    
    func hideLoadingIndicator() {
        self.loadingIndicationView.isHidden = true
    }
    
    func displayLocationNotFoundPopUp() {
        let alert = UIAlertController(title: "Location not found",
                                      message: "Cannot attain a location for this bill",
                                      preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    func configureCurrencyLabel(currency: String) {
        currencyLabel.text = currency
    }
    
    func congigureTitle(title: String) {
        self.title = title
    }
    
    func configureInstructionTitle(instructionTitle: String) {
        self.instructionLabel.text = instructionTitle
    }
    
    func configureNextButton(buttonTitle: String) {
        nextButton.setTitle(buttonTitle, for: .normal)
    }
    
    func showErrorMessage() {
        errorLabel.isHidden = false
    }
    
    func hideErrorMessage() {
        errorLabel.isHidden = true
    }
    
    func configureErrorMessage(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = true
    }
    
    func navigateToSplitScreen(bill: Bill) {
        performSegue(withIdentifier: "people", sender: self)
    }
    
    func configureHistoryBarButton(buttonTitle: String) {
        let historyButton = UIBarButtonItem(title: buttonTitle,
                                            style: .plain,
                                            target: self,
                                            action: #selector(historyButtonTapped))
         self.navigationItem.rightBarButtonItem = historyButton
    }
    
    func navigateToHistoryScreen() {
        performSegue(withIdentifier: "history", sender: self)
    }
    
}

extension AmountViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = locations.first?.coordinate.latitude, let longitude = locations.first?.coordinate.longitude else {
                        displayLocationNotFoundPopUp()
            address = "Unknown location"
            self.hideLoadingIndicator()

            return
        }
        
        
       
        let location = CLLocation(latitude: latitude, longitude: longitude)
        locationUtility.getAdressName(coords: location)
        if locationUtility.address == "" {
            return
        }
        address = locationUtility.address
        self.hideLoadingIndicator()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       checkLocationAuthorization()
    }

}
