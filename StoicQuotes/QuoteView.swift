//
//  QuoteView.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import SwiftUI

struct QuoteView: View {
    
    @ObservedObject var viewModel:QuotesViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.quote?.data.quote ?? "")
            
            Spacer().frame(height: 10)
            
            Text(viewModel.quote?.data.author ?? "")
                .bold()
            
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(viewModel: QuotesViewModel())
    }
}
