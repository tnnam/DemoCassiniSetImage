//
//  ImaViewController.swift
//  DemoCassiniSetImage
//
//  Created by Tran Ngoc Nam on 4/24/18.
//  Copyright © 2018 Tran Ngoc Nam. All rights reserved.
//

import UIKit

class ImaViewController: UIViewController, UIScrollViewDelegate {

    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var photoDetail: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scrollView.delegate = self
        imageView.image = photoDetail
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
        // Do any additional setup after loading the view.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
