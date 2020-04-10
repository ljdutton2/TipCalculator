//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var InputView: UIView!
    @IBOutlet weak var BillamtTextView: UILabel!
    @IBOutlet weak var BillamtTextField: UITextField!
    
    @IBOutlet weak var TipPercentSegment: UISegmentedControl!
    
    @IBOutlet weak var OutputView: UIView!
    @IBOutlet weak var TipAmtTitleLabel: UILabel!
    @IBOutlet weak var TipAmtLabel: UILabel!
    @IBOutlet weak var TotalTitleLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    
    @IBOutlet weak var ResetButton: UIButton!
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func themeToggled(_ sender: UISwitch) {
    }
    @IBAction func TipPercentChanged(_ sender: UISegmentedControl) {
      }
    
    @IBAction func restButtonTapped(_ sender: UIButton) {
        print("Button Tapped")
    }
}
