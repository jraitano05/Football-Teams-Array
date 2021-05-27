//
//  ViewController.swift
//  Array - Sports Teams
//
//  Created by period4 on 2/19/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    @IBOutlet weak var footballTeamsTableView: UITableView!
    
    var footballTeams = ["Carolina Panthers", "Chicago Bears", "Buffalo Bills", "LA Rams", "Washington Football Team", "Huston Texans", "Cleveland Browns", "LA Chargers"]
    var footballPlayers = ["Christian McCaffrey", "Khalil Mack", "Stefon Diggs", "Jalen Ramsey", "Terry Mclaurin", "Deshaun Watson", "Nick Chubb", "Derwin James"]
    var pics = [UIImage(named: "Panthers")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = URL(string: "https://www.panthers.com/")
        
        let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true
        
        let vc = SFSafariViewController(url: url!, configuration: config)
        present(vc, animated: true)
    }
    func alert(){
        let alertController = UIAlertController(title: "ENTER A TEAM", message: "FAVORTIE PLAYER", preferredStyle: .alert)
        alertController.addTextField { (teamTF) in
        alertController.addTextField { (playersTF) in
            teamTF.placeholder = "Enter a team"
            playersTF.placeholder = "Favorite player from team above"
            
            let addButton = UIAlertAction(title: "Done", style: .default) { (action) in
                self.footballTeams.append(teamTF.text!)
                self.footballPlayers.append(playersTF.text!)
                self.footballTeamsTableView.reloadData()
            }
            alertController.addAction(addButton)
            
        }
    }
    
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func addFootballTeamButton(_ sender: Any) {
        alert()
    
    }
    //telling the computer how many rows you want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballTeams.count
    }
    
   //telling the computer what data goes into the row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "footballCell")
        cell?.textLabel?.text = footballTeams[indexPath.row]
        cell?.detailTextLabel?.text = footballPlayers[indexPath.row]
        cell?.imageView?.image = UIImage(named: "Panthers")
        
        
        return cell!
        
        
    }

}



