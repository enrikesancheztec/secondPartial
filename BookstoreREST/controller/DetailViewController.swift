//
//  DetailViewController.swift
//  BookstoreREST
//
//  Created by user168039 on 5/1/20.
//  Copyright © 2020 Tec. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var delegate : BookDelegate?
    
    func configureView() {
        // Update the user interface for the detail item.
        if let book = detailItem {
            titleLabel.text = book.title
            authorLabel.text = book.author
            descriptionTextView.text = book.description
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: Book? {
        didSet {
            // Update the view.
        }
    }

    @IBAction func deleteBook(_ sender: UIBarButtonItem) {
        delegate?.deleteBook(self)
    }
}

