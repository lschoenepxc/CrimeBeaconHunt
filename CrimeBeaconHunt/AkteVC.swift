//
//  AkteVC.swift
//  CrimeBeaconHunt
//
//  Created by Laura Schöne on 13.06.24.
//

import UIKit

class AkteVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // Table view with scrollable collection view inside to create a carousel. Inspired by: https://www.youtube.com/watch?v=9N4o98SQHGM
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // To-Do: Start: Selected Segment = Verdächtige
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //tableView.rowHeight = 400
        tableView.frame = CGRect(x: 38, y: 270, width: 300, height: 400)
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
            print("Verdächtige")
        case 1:
            print("Tatwaffe")
        case 2:
            print("Tatort")
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
