//
//  ViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/12/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit
import ResearchKit

class ConsentViewController: UIViewController, ORKTaskViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func launchConsent(sender: AnyObject) {
        let consentSteps = IFConsent().studyOverviewSteps()
        let task = ORKOrderedTask(identifier: "identifier", steps: [consentSteps, IFConsent().reviewConsent()])
        
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
        taskViewController.delegate = self
        
        self.presentViewController(taskViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func reviewAndAgreeConsent(sender:AnyObject) {
        let task = ORKOrderedTask(identifier: "reviewConsent", steps: [IFConsent().reviewConsent()])
        let taskViewController = ORKTaskViewController(task: task, taskRunUUID: nil)
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
        //taskResultFinishedCompletionHandler?(taskViewController.result)
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

