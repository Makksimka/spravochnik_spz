//
//  ValueСoefficientType.swift
//  spravochnik_spz
//
//  Created by Swift Learning on 26.03.2023.
//

enum ValueСoefficientType: Codable {
    case objectArea
    case lengthOfThePerimeter
    case numberOfBlockingSections
    case numberOfProtectedPremises
    case address
    
    var title: String {
        switch self {
        case .objectArea:
            return "Площадь объекта"
        case .lengthOfThePerimeter:
            return "Протяженность периметра объекта"
        case .numberOfBlockingSections:
            return "Количество участков блокировки"
        case .numberOfProtectedPremises:
            return "Количество защищаемых помещений (направлений)"
        case .address:
            return "Укажите название расчета (например, его адрес)"
        }
    }
    
    var descrp: String {
        switch self {
        case .objectArea:
            return "м²"
        case .lengthOfThePerimeter:
            return "км"
        case .numberOfBlockingSections:
            return "шт"
        case .numberOfProtectedPremises:
            return "шт"
        case .address:
            return ""
        }
    }
}

struct ValueСoefficientModel: Codable {
    let type: ValueСoefficientType
    var value: Double
    var stringValue: String?
    
    init(type: ValueСoefficientType,
         value: Double = 0.0,
         stringValue: String? = nil) {
        self.type = type
        self.value = value
        self.stringValue = stringValue
    }
}

struct ValueСoefficientViewModel {
    let title: String
    let value: Double
    let descrpt: String
    let type: ValueСoefficientType
    var delegate: ValueCoefficientTableViewCellDelegate?
}
