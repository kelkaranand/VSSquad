//
//  EventsTableViewController.swift
//  EventsViewControllerContainer
//
//  Created by Lisa Brown on 11/23/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {

     
       
       // MARK: - Properties
       
       
      
    var events = [Event]()

           override func viewDidLoad() {
               super.viewDidLoad()
               loadSampleevents()
            
            
            
    }
    

           // MARK: - Table view data source

       /*    override func numberOfSections(in tableView: UITableView) -> Int {
               return 1
           }
           */
           override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return events.count
           }

           
          override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              
              // Table view cells are reused and should be dequeued using a cell identifier.
              let cellIdentifier = "EventsTableViewCell"
              
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventsTableViewCell  else {
                  fatalError("The dequeued cell is not an instance of EventTableViewCell.")
              }
              
              // Fetches the appropriate volunteer for the data source layout.
              let event = events[indexPath.row]
               
               cell.eventNameLabel.text = event.eventName
            cell.eventIdLabel.text = event.eventID
           cell.eventDateLabel.text = event.eventDate
               cell.eventAddressLabel.text = event.eventAddress
               
              
              
              return cell
          }
       
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print(events[indexPath.row].eventID)
           let alertController = UIAlertController(title: "Event", message:
               events[indexPath.row].eventID + " " + events[indexPath.row].eventName, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "Ok", style: .default))

           self.present(alertController, animated: true, completion: nil)
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
           //MARK: Private Methods
            
           private func loadSampleevents() {
              
               
               guard let event1 = Event(eventID: "Event Id: 1", eventName: "Name: Test Event 1", eventDate: "Date: 11/23/2019", eventAddress: "Address: 1234 Event Ln, Columbus, Oh 43229")else {
                   fatalError("Unable to instantiate event1")
               }
                   
                guard let event2 = Event(eventID: "Event Id: 2", eventName: "Name: Test Event 2", eventDate:"Date: 11/25/2019" , eventAddress: "Address: 1235 Event Ln, Columbus, OH 43229")
                    else {
                    fatalError("Unable to instantiate event2")
                }
               guard let event3 = Event(eventID: "Event Id: 3", eventName: "Name: Test Event 3", eventDate: "Date: 11/26/2019", eventAddress: "Address: 1236 Event Ln, Columbus, OH 43229")
                   else {
                   fatalError("Unable to instantiate event3")
               }
               guard let event4 = Event(eventID: "Event Id: 4", eventName: "Name: Test Event 4", eventDate: "Date: 11/27/2019", eventAddress: "Address: 1237 Event Ln, Columbus, OH 43229")
                   else {
                   fatalError("Unable to instantiate event4")
               }
               guard let event5 = Event(eventID: "Event Id: 5", eventName: "Name: Test Event 5", eventDate: "Date: 11/28/2019", eventAddress: "Address: 1238 Event Ln, Columbus, OH 43229")
                   else {
                   fatalError("Unable to instantiate event5")
               }
               
               events += [event1, event2, event3, event4, event5]
               
           }

}
   

