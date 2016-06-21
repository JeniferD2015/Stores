//
//  TableViewController.swift
//  StoresApp
//
//  Created by Jenifer  on 5/20/16.
//  Copyright © 2016 Jenifer . All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var storeDatasource = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StoreList"
        
        storeDatasource = StoreDatasource.fetchAllStores()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeDatasource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseCell",forIndexPath: indexPath) as! TableViewCell
        
        //configure the cell
        cell.nameLabel.text = storeDatasource[indexPath.row].name
        cell.cellImageView.image = UIImage(named: storeDatasource[indexPath.row].image!)
        cell.detailTextLabel?.text = storeDatasource[indexPath.row].category
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue" {
            let row = self.tableView.indexPathForSelectedRow!.row
            let vc = segue.destinationViewController as? DetailViewController
            vc?.selectedStore = storeDatasource[row]
        }
        
    }
}
