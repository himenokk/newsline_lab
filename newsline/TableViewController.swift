//
//  TableViewController.swift
//  newsline
//
//  Created by Sanzhar Kiyassov on 08.11.2023.
//

import UIKit

class TableViewController: UITableViewController {
 
        var arrNews = [News(title: "Australian ports resume some operations after major cyberattack", subtitle: "One of Australia’s biggest port operators has restarted some operations after a crippling cyberattack that led to a huge backup of cargo. DP World Australia, which manages the flow of nearly 40% of the country’s goods and is owned by Dubai-based logistics giant DP World, announced Monday that the resumption came three days following a breach of its IT systems." ),News(title: "Whatever happened to NFTs?", subtitle: "In the latest episode of The Simpsons the hapless dad turns his son Bart, and then himself, into NFTs to make It all goes wrong when Homer finds out from a floating pizza cat that the NFT craze is The episode has been widely applauded by NFT fans and sceptics alike for successfully poking fun at a side of the crypto world that exploded a couple of years ago but has now gone very quiet."), News(title: "Apple’s Swift Student Challenge to open in February 2024 with new Distinguished Winners category", subtitle: "Apple’s Swift Student Challenge has given thousands of students around the world the opportunity to showcase their creativity and build real-world skills to take into their careers and beyond. Since 2020, students participating in the challenge have joined a worldwide community of developers using Swift — the same programming language used by professionals — to create the next wave of groundbreaking apps. The next challenge will open in February 2024, and will include a new category recognizing 50 Distinguished Winners, who will be named for standout submissions.")]
        
        var timer = Timer()
    
        var time = 0
        
    
        
        @IBOutlet weak var dateLabel: UILabel!
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            

//             Uncomment the following line to preserve selection between presentations
//             self.clearsSelectionOnViewWillAppear = false
//
//             Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//             self.navigationItem.rightBarButtonItem = self.editButtonItem
//
            dateLabel.text = timeToString(intTime: time)
            
            timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(addNews), userInfo: nil, repeats: true)
        }
    
        @objc func countTime(){
            time += 4
            dateLabel.text = timeToString(intTime: time)
            
        
        }
    
    
        func timeToString(intTime: Int) -> String{
            let seconds = intTime % 60
            let minutes = (intTime / 60) % 60
            let hours = intTime / 3600
            
            return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds, " ago")
            //00:00:00
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)

            // Configure the cell...\
            let labelTitle = cell.viewWithTag(1000) as! UILabel
            labelTitle.text = arrNews[indexPath.row].title

            let labelSubtitle = cell.viewWithTag(1001) as! UILabel
            labelSubtitle.text = arrNews[indexPath.row].subtitle
            
            return cell
        }
        
            
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 186

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
