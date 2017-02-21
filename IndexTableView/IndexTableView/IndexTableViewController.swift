//
//  IndexTableViewController.swift
//  IndexTableView
//
//  Created by Mac on 2/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class IndexTableViewController: UITableViewController {

    
    let animals = ["Bear", "Black Swan","Buffalo","Camel","Cockatoo","Dog","Donkey","Duck","Elephant","Emu", "Giraffe", "Greater Rhea", "Guinea_pig","Hippopotamus", "Horse","Koala","Lion","Llama","Manatus","Meerkat","Panda","Peacock","Pig","Platypus","Polar Bear", "Rhinoceros","Seagull","Tasmania Devil","Whale", "Whale Shark", "Wombat"]
    
    
    var animalsDict = [String: [String]]()
    var animalSectionTitles = [String]()
    
    func createAnimalDict(){
        
        for animal in animals {
            let animalKey = animal.substring(to: animal.index(animal.startIndex, offsetBy: 1))
            if var animalValues = animalsDict[animalKey] {
                animalValues.append(animal)
                animalsDict[animalKey] = animalValues
            } else {
                animalsDict[animalKey] = [animal]
            }
        }
        animalSectionTitles = [String](animalsDict.keys)
        animalSectionTitles.sort()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnimalDict()

    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return animalSectionTitles.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let animalKey = animalSectionTitles[section]
        if let animalVables = animalsDict[animalKey] {
            return animalVables.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! IndexTableViewCell

        let animalKey = animalSectionTitles[indexPath.section]
        if let animalValues = animalsDict[animalKey] {
            cell.animalName.text = animalValues[indexPath.row]
            let imageName = animalValues[indexPath.row].lowercased().replacingOccurrences(of: " ", with: "_")
            cell.imageView?.image = UIImage(named: imageName)
        }

        return cell
    }


    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return animalSectionTitles
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.textColor = UIColor.orange
        headerView.textLabel?.font = UIFont(name: "Avenir", size: 25.0)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
