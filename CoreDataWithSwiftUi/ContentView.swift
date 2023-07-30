//
//  ContentView.swift
//  CoreDataWithSwiftUi
//
//  Created by Gaurav Tak on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.brand)
    ]) var products: FetchedResults<Product>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        HStack {
                           // EmojiRatingView(rating: book.rating)
                           //     .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(product.title ?? "Unknown Product")
                                    .font(.headline)

                                Text(product.brand ?? "Unknown Brand")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteProducts)
            }
            .navigationTitle("Products@Store")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Product", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddProductView()
            }
        }
    }

    func deleteProducts(at offsets: IndexSet) {
        for offset in offsets {
            let product = products[offset]
            moc.delete(product)
        }

//        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
