import { useEffect, useState } from 'react';
import { read } from '../../api/fetch-wrapper';
import { Link } from 'react-router';

export default function ProductList() {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function loadProducts() {
      try {
        const data = await read('Products');
        setProducts(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'Failed to load products');
      } finally {
        setLoading(false);
      }
    }

    loadProducts();
  }, []);

  return (
    <div>
      <h2>Products</h2>
      {loading && <p>Loading products...</p>}
      {error && <p style={{ color: 'red' }}>{error}</p>}
      {!loading && !error && (
        <>
          {products.length === 0 ? (
            <p>No products found.</p>
          ) : (
            <table>
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Category</th>
                  <th>Sub-category</th>
                  <th>Unit Price</th>
                  <th>Quantity</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {products.map((product) => (
                  <tr key={product.productID ?? product.ProductID}>
                    <td>
                      <Link to ={`/products/${product.productID ?? product.ProductID}`}>
                      {product.productName ?? product.ProductName}
                      </Link>
                    </td>
                    <td>{product.category ?? product.Category}</td>
                    <td>{product.subCategory ?? product.SubCategory}</td>
                    <td>${(product.unitPrice ?? product.UnitPrice).toFixed(2)}</td>
                    <td>{product.quantity ?? product.Quantity}</td>
                    <td>
                      <button>Edit</button>
                      <button>Delete</button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </>
      )}
    </div>
  );
}