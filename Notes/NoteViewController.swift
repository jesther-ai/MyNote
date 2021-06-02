//
//  NoteViewController.swift
//  Notes
//
//  Created by Jesther Silvestre on 5/26/21.
//

import SwiftUI
class NoteViewController: UIViewController {
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var noteLabel:UITextView!
    
    public var noteTitle:String = ""
    public var note:String = "" 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
}
