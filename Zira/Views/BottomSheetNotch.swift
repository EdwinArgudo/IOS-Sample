//
//  BottomSheetNotch.swift
//  Zira
//
//  Created by Edwin Argudo on 9/29/20.
//

import UIKit

class BottomSheetNotch: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .systemGray2
        self.layer.cornerRadius = 10;
    }
}
