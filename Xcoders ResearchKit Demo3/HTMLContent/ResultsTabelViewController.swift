//
//  ResultsTabelViewController.swift
//  Xcoders ResearchKit Demo3
//
//  Created by Dogan, Art on 5/20/15.
//  Copyright (c) 2015 artdog, Inc. All rights reserved.
//

import UIKit

class ResultsTabelViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    enum RowIdentifiers:String {
        case IDRow = "IDRow", StartDate = "StartDate", EndDate = "EndDate"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 1
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier(, forIndexPath: indexPath) as! UITableViewCell
        
        return nil
    }

}
