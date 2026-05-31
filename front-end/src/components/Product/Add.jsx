import React from "react";
import { create } from "../../api/fetch-wrapper";
import { useNavigate } from "react-router";
import ProductForm from "./Form";

export default function ProductAdd() {

    const navigate = useNavigate();
    const handleSubmit = async (productData) => {
        const newProduct = await create("products", productData);
        if (newProduct?.productID) {
            navigate(`/products/${newProduct.productID}`);
        } else {
            navigate("/products");
        }

    };
    return (
        <div>
            <h2>Add Product</h2>
            <ProductForm onSubmit={handleSubmit} />
        </div>
    );
}