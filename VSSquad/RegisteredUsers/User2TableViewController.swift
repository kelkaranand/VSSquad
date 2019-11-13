//
//  volunteer2TableViewController.swift
//  VSSquad
//
//  Created by Lisa Brown on 11/3/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class volunteer2TableViewController: UITableViewController {

   //MARK: Properties
         
    
    var volunteers = [Volunteer]()

        override func viewDidLoad() {
            super.viewDidLoad()

            // Load the sample data.
            loadSamplevolunteers()
        }

        // MARK: - Table view data source

    /*    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        */
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return volunteers.count
        }

        
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           // Table view cells are reused and should be dequeued using a cell identifier.
           let cellIdentifier = "UserTableViewCell"
           
           guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UserTableViewCell  else {
               fatalError("The dequeued cell is not an instance of UserTableViewCell.")
           }
           
           // Fetches the appropriate volunteer for the data source layout.
           let volunteer = volunteers[indexPath.row]
            
            cell.firstName.text = volunteer.firstName
            cell.lastName.text = volunteer.lastName
            cell.regEvents.text = volunteer.regEvents
            cell.memberSince.text = volunteer.memberSince
            
           
           
           return cell
       }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(volunteers[indexPath.row].firstName)
        let alertController = UIAlertController(title: "Volunteer", message:
            volunteers[indexPath.row].firstName + " " + volunteers[indexPath.row].lastName, preferredStyle: .alert)
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
         
        private func loadSamplevolunteers() {
           
            
            guard let volunteer1 = Volunteer(firstName: "Lisa", lastName: "Jennings", regEvents: "5", memberSince: "2019")else {
                fatalError("Unable to instantiate volunteer2")
            }
                
             guard let volunteer2 = Volunteer(firstName: "Lexus", lastName: "Davis", regEvents: "20", memberSince: "2016")
                 else {
                 fatalError("Unable to instantiate volunteer2")
             }
            guard let volunteer3 = Volunteer(firstName: "Anand", lastName: "Kelkar", regEvents: "7", memberSince: "2018")
                else {
                fatalError("Unable to instantiate volunteer3")
            }
            guard let volunteer4 = Volunteer(firstName: "Noah", lastName: "Flaniken", regEvents: "9", memberSince: "2018")
                else {
                fatalError("Unable to instantiate volunteer4")
            }
            guard let volunteer5 = Volunteer(firstName: "Don", lastName: "Bacharowski", regEvents: "12", memberSince: "2017")
                else {
                fatalError("Unable to instantiate volunteer5")
            }
            
            volunteers += [volunteer1, volunteer2, volunteer3, volunteer4, volunteer5]
            
        }
    }

