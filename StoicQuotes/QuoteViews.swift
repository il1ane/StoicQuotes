//
//  QuoteView.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import SwiftUI

struct QuoteViews: View {
    
    @ObservedObject var viewModel = QuoteViewModel()
    @State private var buttonIsDisabled = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    if viewModel.quote != nil {
                        ExtractedView()
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

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteViews()
    }
}



struct ExtractedView: View {
    var body: some View {
        VStack {
            Text(viewModel.quote?.data.quote ?? "N/A")
            
            Spacer().frame(height: 10)
            
            Text(viewModel.quote?.data.author ?? "N/A")
                .bold()
            
        }
    }
}
