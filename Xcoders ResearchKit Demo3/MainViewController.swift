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

    enum Identifier:String {
        case InstructionStep = "Instruction", WeightStep = "Weight"
        
        func value() -> String {
            return rawValue
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    //one time survey creator
    func createOneTimeSurveyTasks() -> ORKTask {
        //create a step array for each step that will be presented to the participant
        var steps = [ORKStep]()
        
        let instructionStep = ORKInstructionStep(identifier: Identifier.InstructionStep.value())
        instructionStep.title = "Getting Started"
        instructionStep.text = "This one time survey will be used to gather some baseline measurements. This data will be used to gauge your progess as you progress in the study."
        steps += [instructionStep]
        
        let weightAnswerFormat = ORKAnswerFormat.integerAnswerFormatWithUnit("lbs")
        weightAnswerFormat.minimum = 0
        
        let weightStep = ORKQuestionStep(identifier: Identifier.WeightStep.value(), title: "Current Weight", answer:weightAnswerFormat)

        steps += [weightStep]
        
        return ORKOrderedTask(identifier: "FirstTimeSurvey", steps: steps)
    }
    
    @IBAction func showSurvey(sender:AnyObject?) {
        
        let taskViewController = ORKTaskViewController(task: createOneTimeSurveyTasks(), taskRunUUID: nil)
        
        taskViewController.delegate = self
        
        self.presentViewController(taskViewController, animated: true, completion: nil)
        
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
        
        if let taskResult:[ORKResult] = taskViewController.result.results as? [ORKResult] {
            for stepResult in taskResult {
                println(stepResult.identifier)
                if stepResult.identifier == Identifier.InstructionStep.value() {
                    println(stepResult.identifier)
                    println((stepResult as! ORKQuestionResult).answer)
                }
                
                if stepResult.identifier == Identifier.WeightStep.value() {
                    println(stepResult.identifier)
                    //println("value " + )
                }
            }
        }
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        
            //get source viewcontroller, get [ORKResults] on source
    
    }
}
