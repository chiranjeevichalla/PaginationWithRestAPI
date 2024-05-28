//
//  ViewController.swift
//  TemplateProject
//
// Created by chiranjeevi on 28/05/24
//

import UIKit

class UserViewController: UIViewController, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView : UITableView! 
    
    let dataSource = CurrencyDataSource()
    var currentPage = 1
    var isLoading = false
    
    lazy var viewModel : UserViewModel = {
        let viewModel = UserViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "User list"
        
        self.tableView.dataSource = self.dataSource
        
        
        self.tableView.delegate = self
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        
        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        self.viewModel.fetchCurrencies(currentPage: currentPage)
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cucurrentRate = viewModel.selectedData(at: indexPath)
        self.performSegue(withIdentifier: "ViewToDetails", sender: cucurrentRate)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSource.data.value.count - 10, !isLoading  {
            currentPage += 1
            isLoading = true
            self.viewModel.fetchCurrencies(currentPage: currentPage)
            isLoading = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! UserDetailViewController
        if let userDetails = sender as? User {
            
            destinationVC.userDetails = userDetails
        }
    }
}






