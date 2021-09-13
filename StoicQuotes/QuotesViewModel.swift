//
//  QuoteViewModel.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import Foundation

class QuotesViewModel: ObservableObject {
    
    @Published var quote:Quote?
    @Published var isLoadingAQuote = false
    
    func getData() {
        
        isLoadingAQuote = true
        
        let url = URL(string: "https://api.themotivate365.com/stoic-quote")
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: url!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("error")
                return
            }
            
            var result: Quote?
    
            result = try? decoder.decode(Quote.self, from: data)
        
            guard let json = result else { return }
            
            DispatchQueue.main.async {
                self.quote = json
                self.isLoadingAQuote = false
            }
            
        })
        .resume()
    }
}
