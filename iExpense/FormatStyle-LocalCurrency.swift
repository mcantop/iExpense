//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Maciej on 07/08/2022.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
