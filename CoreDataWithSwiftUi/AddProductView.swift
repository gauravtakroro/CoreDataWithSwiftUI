//
//  AddProductView.swift
//  CoreDataWithSwiftUi
//
//  Created by Gaurav Tak on 29/07/23.
//


import SwiftUI

struct AddProductView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var productTitle = ""
    @State private var productBrand = ""
    @State private var rating = 3
    @State private var productCategory = ""
    @State private var review = ""

    let categories = ["Electroics", "Beauty", "Kitchen", "Fashion"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Product", text: $productTitle)
                    TextField("Product's Brand", text: $productBrand)

                    Picker("Category", selection: $productCategory) {
                        ForEach(categories, id: \.self) {
                            Text($0)
                        }
                    }.onAppear {
                        productCategory = categories[0]
                    }
                }

                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }

                Section {
                    Button("Save") {
                        let newProduct = Product(context: moc)
                        newProduct.id = UUID()
                        newProduct.title = productTitle
                        newProduct.brand = productBrand
                        newProduct.rating = Double(rating)
                        newProduct.review = review
                        newProduct.category = productCategory

                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Product")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}

