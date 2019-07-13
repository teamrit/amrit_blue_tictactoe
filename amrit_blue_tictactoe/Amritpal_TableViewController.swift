//
//  Amritpal_TableViewController.swift
//  amrit_blue_tictactoe
//
//  Created by Singh Singh on 2019-05-29.
//  Copyright © 2019 Singh Singh. All rights reserved.
//

import UIKit

class Amritpal_TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: "numberOfGamesPlayed")
        print(numberOfGamesPlayed)
        return numberOfGamesPlayed
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "amrit_table_cell", for: indexPath) as! Amritpal_TableViewCell
        let array = ["Frodo", "Sam", "Wise", "Gamgee"]
        print(array.randomElement()!) // Using ! knowing I have array.count > 0
        
        let numberOfGamesPlayed = UserDefaults.standard.integer(forKey: "numberOfGamesPlayed")
        let thisCellGameIndex = numberOfGamesPlayed - indexPath.row
        
        let whoWon = UserDefaults.standard.string(forKey: "Result_\(String(thisCellGameIndex))")
        
        let whenWon = UserDefaults.standard.object(forKey: "Timestamp_\(String(thisCellGameIndex))") as! Date
        
        print(whoWon,whenWon)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    
        cell.who_won.text = whoWon
        cell.date_played.text = dateFormatter.string(from: whenWon)
        
        if (whoWon == Amritpal_GameModel.cross) {
            cell.win_loss_image.image = UIImage(named: "Blue_Win")
        } else {
            cell.win_loss_image.image = UIImage(named: "Blue_Loss")
        }
        
        cell.orderOfMoves = UserDefaults.standard.object(forKey: "OrderOfMoves_\(String(thisCellGameIndex))") as? [Int]
        
        return cell
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

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue identifier \(segue.identifier!)")
        
        if (segue.identifier! == "newGame") {
            return
        }
        
        // PREPARE to send past game data
        let thisCell = sender as! Amritpal_TableViewCell
        
        let destinationViewController = segue.destination as! Amritpal_GameViewController
        
        destinationViewController.isPastGame = true
        destinationViewController.orderOfMoves = thisCell.orderOfMoves
        
    
        
    }

}
