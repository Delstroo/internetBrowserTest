//
//  TestTableViewCell.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var snippetLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var result: OrganicQuestions? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let result = result else { return }
        
        urlLabel.text = result.link
        headerLabel.text = result.title
        snippetLabel.text = result.snippet
        
        SearchModelController.fetchPhotosForResult(photoURL: result.thumbnail ?? "") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let photoURL):
                    self.postImageView.image = photoURL
                case .failure(_):
                    self.postImageView.image = UIImage(named: "square")
                }
            }
        }
    }
    
    
}
