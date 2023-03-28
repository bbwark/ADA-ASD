//
//  SearchNumberView.swift
//  Binary Search Tree Demo
//
//  Created by Bruno De Vivo on 27/03/23.
//

import SwiftUI

@available(iOS 16.1, *)
struct SearchNumberView: View {
    var model : ContentViewViewModel?
    
    @State var textContent = ""
    @State var textContentCopy = ""
    @State var foundAlert = false
    @State var notFoundAlert = false
    @State var insertedNotValid = false
    
    var body: some View {
        VStack{
            CaptionView()
            
            TextField("Example: 420", text: $textContent)
                .padding(.horizontal, 50.0)
            
            if textContent.isValidSearching() || textContent == ""{
                Text("You are searching for:\n\(textContent.filter({$0 != "."}))")
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .foregroundColor(textContent == "" ? .gray : .accentColor)
            }
            else{
                Text("This input is not valid\n")
                    .padding(.top)
            }
            
            Button {
                var found = false
                do{
                    try found = searchIntoBinaryTree(number: textContent)
                    if found{
                        foundAlert.toggle()
                        textContentCopy = textContent
                        textContent = ""
                    }
                    else{
                        notFoundAlert.toggle()
                        textContentCopy = textContent
                        textContent = ""
                    }
                }
                catch InsertionError.invalidNumber{
                    insertedNotValid.toggle()
                    textContent = ""
                }
                catch {
                    print("something wrong")
                }
            } label: {
                ConfirmButtonView()
            }
            .alert("Number \(textContentCopy.filter({$0 != "."})) has been found!", isPresented: $foundAlert){}
            .alert("Number \(textContentCopy.filter({$0 != "."})) not found.", isPresented: $notFoundAlert){}
            .alert("Inserted value is not valid", isPresented: $insertedNotValid){}

            
        }
        .textFieldStyle(.roundedBorder)
    }
}

@available(iOS 16.1, *)
struct SearchNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNumberView()
    }
}

private struct CaptionView: View {
    var body: some View{
            Text("Insert here the number you are searching for:")
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50.0)
                .offset(y: -20)
    }
}

private struct ConfirmButtonView: View{
    var body: some View{
            ZStack {
                Rectangle()
                    .frame(width: 120, height: 50)
                    .cornerRadius(10)
                    .shadow(radius: 2)
                Text("Confirm")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
            }
            .padding(.top, 20.0)
    }
}
