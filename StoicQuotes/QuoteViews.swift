//
//  QuoteView.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import SwiftUI

struct QuoteViews: View {
    
    @ObservedObject var viewModel = QuotesViewModel()
    @State private var buttonIsDisabled = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    if viewModel.quote != nil {
                        QuoteView(viewModel: viewModel)
                    }
                    
                    else {
                        ProgressView()
                            .animation(.none)
                    }
                }
                .animation(.easeInOut(duration: 1))
                
                Spacer()
                
                ButtonView(buttonIsDisabled: $buttonIsDisabled, viewModel: viewModel)
            }
            .navigationTitle("Stoic Quotes")
            .padding()
            .onAppear(perform: {
                viewModel.getData()
            })
        }
    }
}

struct QuoteViews_Previews: PreviewProvider {
    static var previews: some View {
        QuoteViews()
    }
}




