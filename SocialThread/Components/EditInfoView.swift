//
//  EditInfoViwe.swift
//  SocialThread
//
//  Created by Alec Smith on 3/28/25.
//

import SwiftUI

struct EditInfoView: View {
    @Binding var text: String
    var heading: String
    var placeHolder: String?
    var isTextEditor: Bool
    
    var body: some View {
        
            VStack(alignment: .leading, spacing: 8) {
                // HEADING
                Text(heading)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                if isTextEditor {
                    TextEditor(text: $text)
                        .frame(height: 90)
                        .padding()
                        .scrollContentBackground(.hidden)
                        .background(Color.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                else {
                    TextField(placeHolder ?? "", text: $text)
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
            .padding()
            .foregroundStyle(.white)
            .background(RoundedRectangle(cornerRadius: 20).opacity(0.4))
        
    }
}

#Preview {
    EditInfoView(text: .constant(""), heading: "Name", placeHolder: "Enter Name", isTextEditor: false)
}
