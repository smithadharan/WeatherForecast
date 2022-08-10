//
//  String+Extension.swift
//  WeatherForecast
//
//  Created by smitha Dharan on 08/08/2022.
//

import Foundation

extension String {
    func localizedString(_ args: CVarArg...) -> String {
        if args.count > 0 {
            return withVaList(args) {
                let format = NSLocalizedString(self, comment: "")
                return NSString(format: format, locale: NSLocale.current, arguments: $0) as String
                } as String
        }
        
        return NSLocalizedString(self, comment: "")
    }
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
}
