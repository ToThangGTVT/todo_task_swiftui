//
//  SwiftUIView.swift
//  task
//
//  Created by ThangTQ on 28/10/2022.
//

import SwiftUI
import MarkupEditor

struct NoteCreateView: View {
    @EnvironmentObject var noteViewModel: NoteViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var idNote: Int = -1
    @State private var content: String = "<pre>Hello World</pre>"
    @State private var title: String = ""
    
    func saveNote() {
        if title.isEmpty || content.isEmpty {
            AlertManager.share.show(type: .inputIsNotEmpty)
        } else {
            noteViewModel.saveNote(title: title, content: content) {  id in
                guard let id = id else { return }
                idNote = id
                AlertManager.share.show(type: .saveSuccess, action1: { alert in
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
    
    init() {
        UITableView.appearance().sectionHeaderHeight = .zero
    }
    
    var body: some View {
        GeometryReader { geo in
            Form {
                Section(header: Text("Tiêu đề ghi chú:") ) {
                    TextField("Nhập vào đây...", text: $title)
                }.padding([.bottom], 0)
                Section(header: Text("Tiêu đề ghi chú:") ) {
                    MarkupEditorView(html: $content).frame(height: geo.size.height - 250)
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Text("Close").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                        }.frame(height: 40.0).background(.red)
                            .cornerRadius(8)
                            .padding([.leading, .trailing], 8)
                            .accessibilityIdentifier("close")
                            .buttonStyle(BorderlessButtonStyle())
                        
                        
                        Button(action: {
                            saveNote()
                        }) {
                            Text(idNote != -1 ? "Update" :"Save").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                        }.frame(height: 40.0).background(.blue)
                            .cornerRadius(8)
                            .padding([.leading, .trailing], 8)
                            .buttonStyle(BorderlessButtonStyle())
                    }
                    
                }
            }.environment(\.defaultMinListRowHeight, 20) 
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteCreateView()
//    }
//}
