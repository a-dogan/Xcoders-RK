//
//  SurveyTableTableViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/25/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit
import ResearchKit

class SurveyTableTableViewController: UITableViewController, UITableViewDelegate, ORKTaskViewControllerDelegate {

    enum SurveyRowID:Int {
        case Survey
        case SurveyWithChoice
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 7
    }
    
    //MARK: TableView didDeselectRowAtIndexPath
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.row {
            case SurveyRowID.Survey.rawValue:
                let taskViewController = ORKTaskViewController(task: Survey().dailySurveyQuestions(), taskRunUUID: nil)
                taskViewController.delegate = self
                self.presentViewController(taskViewController, animated:true , completion: nil)
            case SurveyRowID.SurveyWithChoice.rawValue:
                let taskViewController = ORKTaskViewController(task: Survey().dailySurveyChoiceQuestions(), taskRunUUID: nil)
                taskViewController.delegate = self
                self.presentViewController(taskViewController, animated:true , completion: nil)
            default:
                return
        }
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
        
        taskViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
