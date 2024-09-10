//
//  DiscountDetailsSectionView.swift
//  Omni
//
//  Created by ahmetAltintop on 14.08.2024.
//

import UIKit

class DiscountDetailsSectionView: UITableViewHeaderFooterView {
    // MARK: - Lifecycle -
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.prepareViews()
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    // MARK: - Internal -
    
    var onExpandButtonTapped: (() -> Void)?
    
    class var identifier: String {
        String(describing: self)
    }
    
    func configure(title: String, amount: String, totalCheck:String, isExpand: Bool){
        let totalText = "Total_Checks".translated()
        self.discountName.text = title
        self.discountAmount.text = amount
        self.totalChecks.text = "\(totalText): \(totalCheck) "
        self.iconImageView.image = (UIImage(systemName: isExpand ? "chevron.down" : "chevron.right"))
    }
    // MARK: - Private -
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titlesContainerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.discountName,
                                                       self.totalChecks,
                                                       self.discountAmount])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
      
    private lazy var discountName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var totalChecks: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
    
    private lazy var discountAmount: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Montserrat-Bold", size: 14)
        label.textColor = .white
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        return label
    }()
      
    private lazy var expandButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(self.expandButton_Tapped), for: .touchUpInside)
        return button
        }()

    private func prepareViews() {
        self.contentView.backgroundColor = .appBlue.withAlphaComponent(0.4)
        
        self.addSubview(self.iconImageView)
        self.addSubview(self.titlesContainerView)
        self.addSubview(self.expandButton)
        
        self.iconImageView.snp.makeConstraints { make in
            make.height.width.equalTo(26)
            make.leading.equalToSuperview().offset(4)
            make.centerY.equalToSuperview()
        }
        self.titlesContainerView.snp.makeConstraints { make in
            make.leading.equalTo(self.iconImageView.snp.trailing).offset(4)
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        self.expandButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    //MARK: - Action -
    
    @objc
    private func expandButton_Tapped() {
        self.onExpandButtonTapped?()
    }
    
}
