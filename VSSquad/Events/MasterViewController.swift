//
//  MasterViewController.swift
//  EventsViewControllerContainer
//
//  Created by Lisa Brown on 11/23/19.
//  Copyright © 2019 Lisa Brown. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
   
    
//    var container: ContainerViewController!
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//               if segue.identifier == "ContainerView"{
//                container = segue.destination as? ContainerViewController
//                   container.animationDurationWithOptions = (0.5, .transitionCrossDissolve)
//               }
//           }
//     @IBAction func segmentControl(_ sender: UISegmentedControl) {
//           if sender.selectedSegmentIndex == 0{
//
//
//               container!.segueIdentifierReceivedFromParent("eventslistsegue")
//           }else{
//               container!.segueIdentifierReceivedFromParent("myeventslistsegue")
//                  }
//       }


/*  @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Events", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "My Events", at: 1, animated: false)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)

        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
    }
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    private lazy var eventstableViewController: EventsTableViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Events", bundle: Bundle.main)

        // Instantiate View Controller
        var tableviewController = storyboard.instantiateViewController(withIdentifier: "EventsTableViewController") as! EventsTableViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: tableviewController)

        return tableviewController
    }()

    private lazy var myeventstableViewController: MyEventsTableViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Events", bundle: Bundle.main)

        // Instantiate View Controller
        var tableviewController = storyboard.instantiateViewController(withIdentifier: "MyEventsTableViewController") as! MyEventsTableViewController

        // Add View Controller as Child View Controller
        self.add(asChildViewController: tableviewController)

        return tableviewController
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        view.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
         private func updateView() {
            if segmentedControl.selectedSegmentIndex == 0 {
                remove(asChildViewController: eventstableViewController)
                add(asChildViewController: myeventstableViewController)
            } else {
                remove(asChildViewController: myeventstableViewController)
                add(asChildViewController: eventstableViewController)
            }
        }
}
*/
 }


