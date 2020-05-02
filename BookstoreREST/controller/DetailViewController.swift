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
    @IBOutlet weak var coverImageView: UIImageView!
    
    var delegate : BookDelegate?
    
    func configureView() {
        // Update the user interface for the detail item.
        if let book = detailItem {
            titleLabel.text = book.title
            authorLabel.text = book.author
            descriptionTextView.text = book.description
            
            let coverUrl = URL(string: "https://booksappsample.herokuapp.com/books/cover/" + String(book.bookId))
            getData(from: coverUrl!) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    self.coverImageView.image = UIImage(data: data)
                }
            }
            
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
    
        //MARK: Functions
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}

