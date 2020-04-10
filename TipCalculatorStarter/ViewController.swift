//
//  ViewController.swift
//  TipCalculatorStarter
//
//  Created by Chase Wang on 9/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var isDefaultStatusBar = true
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return isDefaultStatusBar ? .default : .lightContent
       }

    
    @IBOutlet weak var headerView: UIView!

    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var InputView: UIView!
    @IBOutlet weak var BillamtTextView: UILabel!
    @IBOutlet weak var BillamtTextField: BillAmountTextField!
    
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
      setUpViews()
      setTheme(isDark: false)
       BillamtTextField.calculateButtonAction = {
           self.calculate()
      }
    }
    func setUpViews() {
          headerView.layer.shadowOffset = CGSize(width: 0, height: 1)
          headerView.layer.shadowOpacity = 0.05
          headerView.layer.shadowColor = UIColor.black.cgColor
          headerView.layer.shadowRadius = 35

          InputView.layer.cornerRadius = 8
          InputView.layer.masksToBounds = true
          
          OutputView.layer.cornerRadius = 8
          OutputView.layer.borderWidth = 1
          OutputView.layer.borderColor = UIColor.tcHotPink.cgColor
          OutputView.layer.masksToBounds = true
          
          ResetButton.layer.cornerRadius = 8
          ResetButton.layer.masksToBounds = true
      }
      
      func setTheme(isDark: Bool) {
          let theme = isDark ? ColorTheme.dark : ColorTheme.light

          view.backgroundColor = theme.viewControllerBackgroundColor

          headerView.backgroundColor = theme.primaryColor
          titleLabel.textColor = theme.primaryTextColor

          InputView.backgroundColor = theme.secondaryColor

          BillamtTextField.tintColor = theme.accentColor
          
          if #available(iOS 13.0, *) {
              TipPercentSegment.selectedSegmentTintColor = theme.accentColor
          } else {
              TipPercentSegment.tintColor = theme.accentColor
          }

          OutputView.backgroundColor = theme.primaryColor
          OutputView.layer.borderColor = theme.accentColor.cgColor

          TipAmtTitleLabel.textColor = theme.primaryTextColor
          TotalTitleLabel.textColor = theme.primaryTextColor

          TipAmtLabel.textColor = theme.outputTextColor
          TotalLabel.textColor = theme.outputTextColor

          ResetButton.backgroundColor = theme.secondaryColor
          
          isDefaultStatusBar = theme.isDefaultStatusBar
          setNeedsStatusBarAppearanceUpdate()
      }
      
      func calculate() {
          // dismiss keyboard
          if self.BillamtTextField.isFirstResponder {
              self.BillamtTextField.resignFirstResponder()
          }

          guard let billAmountText = self.BillamtTextField.text,
              let billAmount = Double(billAmountText) else {
                  clear()
                  return
          }

          let roundedBillAmount = (100 * billAmount).rounded() / 100

          let tipPercent: Double
          switch TipPercentSegment.selectedSegmentIndex {
          case 0:
              tipPercent = 0.15
          case 1:
              tipPercent = 0.18
          case 2:
              tipPercent = 0.20
          default:
              preconditionFailure("Unexpected index.")
          }

          let tipAmount = roundedBillAmount * tipPercent
          let roundedTipAmount = (100 * tipAmount).rounded() / 100

          let totalAmount = roundedBillAmount + roundedTipAmount

          // Update UI
          self.BillamtTextField.text = String(format: "%.2f", roundedBillAmount)
          self.TipAmtLabel.text = String(format: "%.2f", roundedTipAmount)
          self.TotalLabel.text = String(format: "%.2f", totalAmount)
      }
      
      func clear() {
          BillamtTextField.text = nil
          TipPercentSegment.selectedSegmentIndex = 0
          TipAmtLabel.text = "$0.00"
          TotalLabel.text = "$0.00"
      }

    @IBAction func themeToggled(_ sender: UISwitch) {
        setTheme(isDark: sender.isOn)
    }
    @IBAction func TipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
      }
    
    @IBAction func restButtonTapped(_ sender: UIButton) {
        print("Button Tapped")
    }
}
  
