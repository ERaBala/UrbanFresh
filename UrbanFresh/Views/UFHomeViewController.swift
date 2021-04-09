//
//  UFHomeViewController.swift
//  UrbanFresh
//
//  Created by WorkSpace on 08/04/21.
//

import UIKit

class UFHomeViewController: UIViewController {
    
    @IBOutlet weak var tableList: UITableView!
    
    let service = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        config()
    }
    
}

extension UFHomeViewController {
    
    private func config(){
        
        tableList.delegate = self
        tableList.dataSource = self
            
        addNavBarImage()
        
        service.viewAccount(categoryID: "2") { result in
            switch result {
            case .success(let value):
                print(value as Any)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    private func addNavBarImage() {
        
        let navController = navigationController!
        
        let image = UIImage(named: "navbar-background")
        let imageView = UIImageView(image: image)
        
        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height
        
        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
        
        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
}

extension UFHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as UITableViewCell
        return cell
    }
    
    
}
