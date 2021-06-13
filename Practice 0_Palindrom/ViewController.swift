//
//  ViewController.swift
//  Practice 0_Palindrom
//
//  Created by Константин Крашенинников on 13.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var currentMax = -1
    var finalMax = -1
    var temporaryArray = [String]()
    var finalArray = [String]()
    
    @IBOutlet weak var textByUser: UITextField!
    @IBOutlet weak var labelFinalCount: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func findButton(_ sender: UIButton) {
        
        resultLabel.sizeToFit()
        currentMax = -1
        finalMax = -1
        temporaryArray.removeAll()
        finalArray.removeAll()
        
        let arrayWithWords = textByUser.text?.components(separatedBy: " ")
        
        if let safeArrayWithWords = arrayWithWords {
            for i in safeArrayWithWords {
                if i.lowercased() == String(i.lowercased().reversed()) {
                    currentMax += i.count + 1
                    temporaryArray.append(i)
                    if currentMax > finalMax {
                        finalMax = currentMax
                        finalArray.removeAll()
                        finalArray = temporaryArray
                    }
                } else if i.lowercased() != String(i.lowercased().reversed()) {
                    currentMax = -1
                    temporaryArray.removeAll()
                }
            }
        }
        let finalText = finalArray.joined(separator: " ")
        
        if finalMax != -1 {
            resultLabel.text = "Your longest palindrom is '\(finalText)'."
            labelFinalCount.text = "It has \(finalMax) symbols."
        } else if finalMax == -1 {
            resultLabel.text = "You don't have palindromes in your text. Try again."
        }
    }
}
