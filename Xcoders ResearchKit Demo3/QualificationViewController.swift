//
//  QualificationViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/17/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit

class QualificationViewController: UITableViewController {
    
    enum SegmentChoices:Int {
        case AgeChoice = 0, DocterChoice, PregnantChoice
    }
    
    var isQualified:Bool = false
    
    @IBOutlet weak var ageChoice: UISegmentedControl!
    @IBOutlet weak var doctorChoice: UISegmentedControl!
    @IBOutlet weak var pregnantChoice: UISegmentedControl!
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func choiceDidChange(sender:AnyObject) {
        enum Choice:Int {
            case Yes=0, No, Na
        }
        
        var isEligible:Bool = ageChoice.selectedSegmentIndex == Choice.Yes.rawValue
        
        isEligible = isEligible && doctorChoice.selectedSegmentIndex == Choice.No.rawValue
        isEligible = isEligible && (pregnantChoice.selectedSegmentIndex == Choice.No.rawValue || pregnantChoice.selectedSegmentIndex == Choice.Na.rawValue)
        
        self.navigationItem.rightBarButtonItem!.enabled = isEligible
    }
    
    

}
