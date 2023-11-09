//
//  TableViewController.swift
//  newsline
//
//  Created by Sanzhar Kiyassov on 08.11.2023.
//

import UIKit

class TableViewController: UITableViewController {
 
        var arrNews = [News(title: "news1", subtitle: "subtitle1subtitle1subtitle1subtitle1subt itle1subtitle1subtitle1subtit le1subtitle1subtitle1subtitle1subtitle1subtitle1subtitle1 subtitle1subtitle1subtitle1subtitle1subtitle1" ),News(title: "news2", subtitle: "subtitle2")]
        
        var timer = Timer()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            

//             Uncomment the following line to preserve selection between presentations
//             self.clearsSelectionOnViewWillAppear = false
//
//             Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//             self.navigationItem.rightBarButtonItem = self.editButtonItem
//
            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(addNews), userInfo: nil, repeats: true)
        }

        @objc func addNews(){
            arrNews.insert(arrNews[1], at: 0)

            tableView.reloadData()

        }
        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return arrNews.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            // Configure the cell...\
            let labelTitle = cell.viewWithTag(1000) as! UILabel
            labelTitle.text = arrNews[indexPath.row].title

            let labelSubtitle = cell.viewWithTag(1001) as! UILabel
            labelSubtitle.text = arrNews[indexPath.row].subtitle
            
            return cell
        }
        
            
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 400
            
        }
    
    
        /*

        // Override to support conditional editing of the table view.
        override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        */

        /*
        // Override to support editing the table view.
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if editingStyle == .insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        */

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
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    }
