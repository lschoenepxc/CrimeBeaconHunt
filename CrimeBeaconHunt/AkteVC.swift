//
//  AkteVC.swift
//  CrimeBeaconHunt
//
//  Created by Laura Schöne on 13.06.24.
//

import UIKit

class AkteVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // Table view with scrollable collection view inside to create a carousel. Inspired by: https://www.youtube.com/watch?v=9N4o98SQHGM
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModels: [CollectionTableViewCellViewModel] = []
    
    private let viewModelsSuspects: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels:[
                TileCollectionViewCellViewModel(name: "Mr. Blue", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Mr. Pink", backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Mr. Yellow", backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Mr. Green", backgroundColor: .systemGreen),
                TileCollectionViewCellViewModel(name: "Mr. Gray", backgroundColor: .systemGray),
            ]
        )
    ]
    private let viewModelsPlaces: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels:[
                TileCollectionViewCellViewModel(name: "Ort Blue", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Ort Pink", backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Ort Yellow", backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Ort Green", backgroundColor: .systemGreen),
                TileCollectionViewCellViewModel(name: "Ort Gray", backgroundColor: .systemGray),
            ]
        )
    ]
    private let viewModelsWeapons: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels:[
                TileCollectionViewCellViewModel(name: "Waffe Blue", backgroundColor: .systemBlue),
                TileCollectionViewCellViewModel(name: "Waffe Pink", backgroundColor: .systemPink),
                TileCollectionViewCellViewModel(name: "Waffe Yellow", backgroundColor: .systemYellow),
                TileCollectionViewCellViewModel(name: "Waffe Green", backgroundColor: .systemGreen),
                TileCollectionViewCellViewModel(name: "Waffe Gray", backgroundColor: .systemGray),
            ]
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)

        // Do any additional setup after loading the view.
        
        // To-Do: Start: Selected Segment = Verdächtige
        viewModels = viewModelsSuspects
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath)
                as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width/0.6
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func changeSC(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewModels = viewModelsSuspects
            tableView.reloadData()
        case 1:
            viewModels = viewModelsWeapons
            tableView.reloadData()
        case 2:
            viewModels = viewModelsPlaces
            tableView.reloadData()
        default:
            print("Nothing new")
        }
    }
}

extension AkteVC: CollectionTableViewDelegate {
    func collectionTableViewDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        let alert = UIAlertController(title: viewModel.name, message: "You clicked!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
