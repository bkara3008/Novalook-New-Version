//
//  PersonnelSalesFooterView.swift
//  Omni
//
//  Created by ahmetAltintop on 16.08.2024.
//

import UIKit

class PersonnelSalesFooterView: UITableViewHeaderFooterView {
    // MARK: - Lifecycle -
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.prepareViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal -
    
    class var identifier: String {
        String(describing: self)
    }
    
    func configure(totalPerson: String, totalAccount: String, totalAmount: String) {
        self.totalPersonLabel.text = totalPerson
        self.totalAccountLabel.text = totalAccount
        self.totalAmountLabel.text = totalAmount
    }
    
    // MARK: - Private -
    
    private lazy var titlesContainerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.TotalTitle,
                                                       self.totalPersonLabel,
                                                       self.totalAccountLabel,
                                                       self.totalAmountLabel])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        return stackView
    }()
    
    private lazy var TotalTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.text = "TOTAL".translated()
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var totalPersonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var totalAccountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var totalAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private func prepareViews() {
        self.contentView.backgroundColor = .appGreen
        
        self.addSubview(self.titlesContainerView)
        
        self.titlesContainerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(4)
        }
    }
}
