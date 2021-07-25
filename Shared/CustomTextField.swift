//
//  TextField.swift
//  CustomTextfieldSwiftui
//
//  Created by Chaudhery on 25/07/2021.
//

import SwiftUI

struct CustomTextField: View {
    let textFieldHeight: CGFloat = 70
    private let placeHolderText: String
    @Binding var text: String
    @State private var isEditing = false
    public init(placeHolder: String,
                text: Binding<String>) {
        self._text = text
        self.placeHolderText = placeHolder
    }
    var shouldPlaceHolderMove: Bool {
        isEditing || (text.count != 0)
    }
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text, onEditingChanged: { (edit) in
                isEditing = edit
            })
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(isEditing ? Color(UIColor.colors.primerycolor) : Color(UIColor.colors.color_gray), lineWidth: 1)
                        .frame(height: textFieldHeight))
            .foregroundColor(isEditing ? Color(UIColor.colors.primerycolor) : Color(UIColor.colors.color_gray))
            .accentColor(isEditing ? Color(UIColor.colors.primerycolor) : Color(UIColor.colors.color_gray))
            .animation(.linear)
            ///Floating Placeholder
            Text(placeHolderText).padding([.leading,.trailing],5)
            .foregroundColor(isEditing ? Color(UIColor.colors.primerycolor) : Color(UIColor.colors.color_gray))
                .background(Color(UIColor.systemBackground))
            .padding(shouldPlaceHolderMove ?
                     EdgeInsets(top: 0, leading:15, bottom: textFieldHeight, trailing: 0) :
                     EdgeInsets(top: 0, leading:15, bottom: 0, trailing: 0))
            .scaleEffect(shouldPlaceHolderMove ? 1.0 : 1.2)
            .animation(.linear)
        }
    }
}

extension UIColor {
    
    struct colors {
    static let primerycolor = UIColor(red: 0.94, green: 0.53, blue: 0.75, alpha: 1.00)
    static let color_gray = UIColor(red: 0.49, green: 0.49, blue: 0.49, alpha: 1.00)
    static let color_white = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    }
}
