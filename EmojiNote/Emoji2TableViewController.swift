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

    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue" else { return }
        let sourceVC = segue.source as! NewEmojiTableViewController2
        let emoji = sourceVC.emoji
        
        let newIndexPath = IndexPath(row: objects.count, section: 0)

        objects.append(emoji)
        tableView.insertRows(at: [newIndexPath], with: .fade)
        
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
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let done = doneAction(at: indexPath)
        let favourite = favoriteAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [done, favourite])
    

    }
    
    func doneAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Done") { (action, view, completion) in
            self.objects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.backgroundColor = .systemGreen
        action.image = UIImage(systemName: "checkmark.circle")
        return action
    }
    
    func favoriteAction(at indexPath: IndexPath) -> UIContextualAction {
        
        var object = objects[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            object.isFavourite = !object.isFavourite
            self.objects[indexPath.row] = object
            completion(true)
            
        }
        action.backgroundColor = object.isFavourite ? .systemPurple : .systemGray
        action.image = UIImage(systemName: "heart")
        return action
    }
}
