//
//  ProductDetailVIew.swift
//  CoreDataWithSwiftUi
//
//  Created by Gaurav Tak on 29/07/23.
//


import SwiftUI

struct ProductDetailView: View {
    let product: Product

    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {

                Text(product.category?.uppercased() ?? "ELECTRONICS")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5).onAppear {
                        print("ProductCategory>>> \(product.category)")
                    }
            }

            Text(product.brand ?? "Unknown Brand")
                .font(.title)
                .foregroundColor(.secondary)

            Text(product.review ?? "No review")
                .padding()

            RatingView(rating: .constant(Int(product.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(product.title ?? "Unknown Brand")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete product?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteProduct)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this product", systemImage: "trash")
            }
        }
    }

    func deleteProduct() {
        moc.delete(product)

//        try? moc.save()
        dismiss()
    }
}

