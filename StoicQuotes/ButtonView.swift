//
//  ButtonView.swift
//  StoicQuotes
//
//  Created by Iliane Zedadra on 13/09/2021.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var buttonIsDisabled:Bool
    @ObservedObject var viewModel:QuotesViewModel
    var body: some View {
        Button(action: {
            
            if !viewModel.isLoadingAQuote {
                
                withAnimation(.easeInOut(duration: 1)) {
                    
                    viewModel.quote = nil
                    buttonIsDisabled = true
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                        buttonIsDisabled = false
                    }
                    
                    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
                        viewModel.getData()
                    }
                }
            }
        }, label: {
            Text("Another one")
                .foregroundColor(.white)
        })
        .disabled(buttonIsDisabled)
        .padding()
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonIsDisabled: .constant(false), viewModel: QuotesViewModel())
    }
}
