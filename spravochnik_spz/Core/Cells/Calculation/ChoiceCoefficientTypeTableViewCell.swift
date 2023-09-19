//
//  ChoiceCoefficientTypeTableViewCell.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 24.02.2023.
//

import UIKit

// MARK: - ChoiceCoefficientTypeTableViewCell

protocol ChoiceCoefficientTypeTableViewCellDelegate: AnyObject {
    func choiceCoefficientCellPressed(value: Double,
                                      coefType: ChoiceСoefficientType,
                                      index: Int)
}

// MARK: ChoiceCoefficientTypeTableViewCell

final class ChoiceCoefficientTypeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ChoiceCoefficientTypeTableViewCell"
    
    weak var delegate: ChoiceCoefficientTypeTableViewCellDelegate?
    
    // MARK: - PrivateProperties
    
    private var value: Double = .zero
    private var coefficientType: ChoiceСoefficientType?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.b1
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = Constants.Sizes.borderWidth
        button.layer.borderColor = Constants.Colors.lightGray.cgColor
        button.setTitleColor(Constants.Colors.dark,
                             for: .normal)
        button.titleLabel?.font = Constants.Fonts.h4
        button.layer.cornerRadius = Constants.Sizes.buttonInCellCornerRadius
        button.clipsToBounds = true
        button.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        return button
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = Constants.Fonts.b1
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 4,
                                               left: 16,
                                               bottom: 4,
                                               right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupCell()
        setupContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    func configure(with viewModel: ChoiceCoefficientViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.descrpt
        coefficientType = viewModel.type
        delegate = viewModel.delegate
    }
    
    // MARK: - Actions
    
    @objc
    private func buttonPressed() {
        delegate?.choiceCoefficientCellPressed(value: value,
                                               coefType: coefficientType ?? .terrain,
                                               index: .zero)
    }
}

// MARK: - ExtensionChoiceCoefficientTypeTableViewCell

private extension ChoiceCoefficientTypeTableViewCell {
    func setupCell() {
        selectionStyle = .none
        stackView.addArrangedSubviews(titleLabel,
                                      button,
                                      descriptionLabel)
        
        contentView.addSubviews(stackView)
    }
    
    func setupContsraints() {
        let buttonWidth: CGFloat = 80
        let buttonHeight: CGFloat = 32
        let descriptionLabelWidth: CGFloat = 30
        let stackViewHeight: CGFloat = 48
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: buttonWidth),
            button.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            descriptionLabel.widthAnchor.constraint(equalToConstant: descriptionLabelWidth),
            
            stackView.heightAnchor.constraint(greaterThanOrEqualToConstant: stackViewHeight),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
