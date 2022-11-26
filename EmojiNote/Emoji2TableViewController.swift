//
//  Emoji2TableViewController.swift
//  EmojiNote
//
//  Created by macbook on 26.11.22.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var objects = [
        Emoji(emoji: "🥰", name: "Love", description: "Let's love each other", isFavourite: false),
        Emoji(emoji: "⚽️", name: "Football", description: "Let's play game", isFavourite: false),
        Emoji(emoji: "✈️", name: "Plain", description: "Let's go to the trip", isFavourite: true),
        Emoji(emoji: "🗽", name: "USA", description: "Welcome in America", isFavourite: true),
        Emoji(emoji: "🍓", name: "Strawberry", description: "Mmmmm it,s very tasty", isFavourite: true),
        Emoji(emoji: "🐞", name: "Beetle", description: "Hello little Juk", isFavourite: false)


    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.title = "Emoji Note"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        

    }

    // MARK: - Table view data source

    // create sections in Table
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //create rows in sections = objects.count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }

    // fill cell from array
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        
        let object = objects[indexPath.row]
        cell.set(object: object)


        return cell
    }
    
    //edit row - press "edit"
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
    
    // edit row  - delete row - press "delete"
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    // can move cell up&down - touch right element and move up&down
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // move cell up&down - touch right element and move up&down
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // choose row
        let movedEmoji = objects.remove(at: sourceIndexPath.row)
        // move row
        objects.insert(movedEmoji, at: destinationIndexPath.row)
        //reload table
        tableView.reloadData()
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    /*
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
