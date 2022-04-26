//
//  TestTableViewController.swift
//  test
//
//  Created by Delstun McCray on 4/26/22.
//

import UIKit

class TestTableViewController: UITableViewController {

//    var results: [Results] = []
//    let searchInfo: SearchInformation? = nil
    var organicQuestions: [OrganicQuestions] = []
    let orfganicQuestion: OrganicQuestions? = nil
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
    }

    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return organicQuestions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        
        let result = self.organicQuestions[indexPath.row]

        cell.result = result
        
        return cell
    
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? DetailViewController else { return }
            
            let selectedLink = organicQuestions[indexPath.row]
            destination.organicQuestion = selectedLink
        }
    }

}

extension TestTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        
        SearchModelController.fetchSearchTerm(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    self.organicQuestions = results
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}
