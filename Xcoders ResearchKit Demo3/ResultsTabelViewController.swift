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
                    return "RowID"
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
    
        return 3
    }
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let rowId = RowIdentifier(rawValue: indexPath.row)?.getRowIdentifier() {
             let cell = tableView.dequeueReusableCellWithIdentifier(rowId, forIndexPath: indexPath) as! UITableViewCell
        }
        
       
        return tableView.dequeueReusableCellWithIdentifier("EmptyCell", forIndexPath: indexPath) as! UITableViewCell
    }

}
