//
//  ImageTableViewController.swift
//  DemoCassiniSetImage
//
//  Created by Tran Ngoc Nam on 4/23/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class ImageTableViewController: UITableViewController {

    var photos = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()

        photos = DataServices.share.photo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        
        cell.spinner.startAnimating()
        download(with: photos[indexPath.row].photo) { image in
            cell.spinner.stopAnimating()
            cell.spinner.isHidden = true
            cell.photo.image = image ?? #imageLiteral(resourceName: "doraemon")
        }
        
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ImaViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell
            controller?.photoDetail = cell?.photo.image
        }
    }

}

// MARK: Download image

extension ImageTableViewController {
    func download(with urlString : String, complete: @escaping(UIImage?)->Void) {
        if let url = URL(string: urlString) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        complete(image)
                    }
                }
            }
        } else {
            complete(nil)
        }
    }

}
