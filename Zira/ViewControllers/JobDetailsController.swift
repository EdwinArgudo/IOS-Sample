//
//  JobDetailsController.swift
//  Zira
//
//  Created by Vienna Zhang on 9/28/20.
//

import UIKit

struct JobDetails {
    var employer = "Blue Bottle Cafe"
    var role = "Cashier"
    var attire = "Please wear the black uniform so that the customers can identify you."
    var instructions = "The cashier shift requires you to get to the location exactly on time"
}

class JobDetailsController: UIViewController {
    
    
    @IBOutlet weak var UIemployer: UITextField!
    @IBOutlet weak var UIrole: UITextField!
    @IBOutlet weak var UIattire: UITextView!
    @IBOutlet weak var UIinstructions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jobDetails = JobDetails()
        UIemployer.text = jobDetails.employer
        UIrole.text = jobDetails.role
        UIattire.text = jobDetails.attire
        UIinstructions.text = jobDetails.instructions
    }
}
