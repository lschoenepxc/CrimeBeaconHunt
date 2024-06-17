//
//  IndizienVC.swift
//  CrimeBeaconHunt
//
//  Created by Laura Schöne on 17.06.24.
//

import UIKit

class IndizienVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indizArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get an reusable cell and force it to be of our custom type "DetailTableViewCell"
        /*
         Note: this will lead to a hard crash if it fails (but if this fails the app is buggy). Sometimes it is OK to provoke a hard crash if it's a must have to function.
        */
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! IndizTableViewCell
        
        // Prepare the data
        let indizText = indizArray[indexPath.row]
        
        // Configure the cell
        cell.indizText?.text = indizText
        
        return cell
    }
    
    
    @IBOutlet weak var tableViewInd: UITableView!
    
    // these arrays are hardcoded
    //let checkArray = [false, false, false]
    let indizArray = ["Indiz 1", "Indiz 2", "Indiz 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // delegation of data source (or drag in Storyboard)
        tableViewInd.dataSource = self
        
        // delegation of tasks (or drag in Storyboard)
        tableViewInd.delegate = self
        
        // we must set the size of all cells programmatically (btw. could differ between cells)
        tableViewInd.rowHeight = 75
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
