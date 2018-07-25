//
//  TableViewController.swift
//  Pay
//
//  Created by Stephanie Tang on 4/27/17.
//  Copyright © 2017 Stephanie Tang. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var itemName: UILabel!
    
    @IBOutlet var itemCost: UILabel!
    
    @IBOutlet var itemClaimed: UILabel!
}

class TableViewController: UITableViewController {

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ItemDatabase.numItems()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell

        // Configure the cell...
        let row: Int = indexPath.row
        let item = ItemDatabase.getItem(index: row)
        cell.itemName.text = item.name
        cell.itemCost.text = String(item.cost)
        if(item.claimed){
            cell.itemClaimed.text = item.owner.name
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            ItemDatabase.removeItemAtIndex(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    @IBAction func backToItems(segue: UIStoryboardSegue){
        
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "viewCellSegue",
            let destination = segue.destination as? CellViewController,
            let itemIndex = tableView.indexPathForSelectedRow?.row{
                destination.itemName = ItemDatabase.getItem(index: itemIndex).name!
                destination.itemCost = ItemDatabase.getItem(index: itemIndex).cost
            }
    }*/

}
