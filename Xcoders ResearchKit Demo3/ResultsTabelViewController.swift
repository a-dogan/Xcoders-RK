//
//  ResultsTabelViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/20/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit
import ResearchKit

class ResultsTabelViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var results = [ORKResult]()
    var resultsType = StepIdentifiers.UndefinedStep
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum RowIdentifier:Int {
        case IDRow, StartDate, EndDate
        
        func getRowIdentifier() -> String? {
            switch self.rawValue {
            case 0:
                    return "TaskIdentifier"
            case 1:
                    return "StartDate"
            case 2:
                    return "EndDate"
            default:
                    return nil
            }
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if results.count > 0 {
            return results.count + 3 //RowId + StartDate + EndDate
        }
        
        return 1
    }
    
    //MARK: cellForRowAtIndePath
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if results.count > 0 {
            if indexPath.row <= 2  {
                if let rowId = RowIdentifier(rawValue: indexPath.row)?.getRowIdentifier() {
                    let cell = tableView.dequeueReusableCellWithIdentifier(rowId, forIndexPath: indexPath) as! UITableViewCell
                    
                    switch indexPath.row {
                    case RowIdentifier.IDRow.rawValue:
                        cell.textLabel!.text = self.results[0].identifier
                        break
                    case RowIdentifier.StartDate.rawValue:
                        cell.textLabel!.text = "Start Date " + self.results[0].startDate!.description
                        break
                    case RowIdentifier.EndDate.rawValue:
                         cell.textLabel!.text = "End Date " + self.results[0].endDate!.description
                        break
                    default:
                        return tableView.dequeueReusableCellWithIdentifier("EmptyCell", forIndexPath: indexPath) as! UITableViewCell
                    }
                    return cell
                }
            }
        }
       
        return tableView.dequeueReusableCellWithIdentifier("EmptyCell", forIndexPath: indexPath) as! UITableViewCell
    }
}
