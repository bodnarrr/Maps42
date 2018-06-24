//
//  LoadingVC.swift
//  Maps42
//
//  Created by Andriy BODNAR on 6/2/18.
//  Copyright © 2018 Andriy BODNAR. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    @IBOutlet weak var rhinoImage: UIImageView!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRhinoParameters()
        activityInd.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        usleep(1000000)
        performSegue(withIdentifier: "segLoadingToMain", sender: self)
    }
    
    func setRhinoParameters() {
        rhinoImage.layer.borderWidth = 1
        rhinoImage.layer.cornerRadius = rhinoImage.frame.width / 2
        rhinoImage.clipsToBounds = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
