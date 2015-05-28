//
//  MainViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/17/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit
import ResearchKit

class MainViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    var results = [ORKResult]()
    
    enum Identifier:String {
        case InstructionStep = "Instruction", WeightStep = "Weight"
        
        func value() -> String {
            return rawValue
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func showSurvey(sender:AnyObject?) {
        
//        let taskViewController = ORKTaskViewController(task: createOneTimeSurveyTasks(), taskRunUUID: nil)
//        
//        taskViewController.delegate = self
//        
//        self.presentViewController(taskViewController, animated: true, completion: nil)
        
    }
    
    // MARK: ORKTaskViewControllerDelegate
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {
        /*
        The `reason` passed to this method indicates why the task view
        controller finished: Did the user cancel, save, or actually complete
        the task; or was there an error?
        
        The actual result of the task is on the `result` property of the task
        view controller.
        */
        
//        if let taskResult:[ORKResult] = taskViewController.result.results as? [ORKResult] {
//            for stepResult in taskResult {
//                println(stepResult.identifier)
//                if stepResult.identifier == Identifier.InstructionStep.value() {
//                    println(stepResult.identifier)
//                    println((stepResult as! ORKQuestionResult).answer)
//                }
//                
//                if stepResult.identifier == Identifier.WeightStep.value() {
//                    println(stepResult.identifier)
//                    //println("value " + )
//                }
//            }
//        }
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultsSegue" {
            if let resultsVC = segue.destinationViewController as? ResultsTabelViewController {
                resultsVC.results = self.results
            }
        }
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        if sender.identifier == "returnToMainVCFromQualified" {
            if let consentVC = sender.sourceViewController as? ConsentViewController {
                self.results = consentVC.results
            }
        }
    }
}
