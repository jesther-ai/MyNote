//
//  ViewController.swift
//  Notes
//
//  Created by Jesther Silvestre on 5/26/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var table:UITableView!
    @IBOutlet var label:UILabel!
    
    var models:[(title:String, note:String)] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        title = "Notes"
    }

    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {return}
        self.navigationController?.popToRootViewController(animated: true)
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.models.append((noteTitle, note))
            self.table.reloadData()
            self.label.isHidden = true
            self.table.isHidden = false
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate and UITableViewDataSource
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //will show noteController
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NoteViewController else {return}
        vc.title = "Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

