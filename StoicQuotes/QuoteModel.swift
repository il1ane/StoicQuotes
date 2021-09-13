//
//  QuoteModel.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import Foundation

struct Quote: Codable {
    let data: QuoteData
}

struct QuoteData: Codable {
    let author, quote: String
}
