//
//  TableVC.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/2/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let allPlaces = AllPlases()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlaces.places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let place = allPlaces.places[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell") as! AddressCell
        cell.setCell(place: place)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segFromListToMap", sender: allPlaces.places[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segFromListToMap" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let selectedRow = indexPath.row
                if let destination = segue.destination as? MapWithSelectedPinVC {
                destination.place = self.allPlaces.places[selectedRow]
                }
            }
        }
    }
}
