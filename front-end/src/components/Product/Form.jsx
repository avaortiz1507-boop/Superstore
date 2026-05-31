import { useEffect, useState } from "react";
import { read } from "../../api/fetch-wrapper";

const emptyForm = {
  productName: "",
  categoryID: "",
  subCategoryID: "",
  unitPrice: "",
  inventory: "",
};

export default function ProductForm({ initialValues = emptyForm, onSubmit }) {
  const [form, setForm] = useState(initialValues); // form = emptyForm
  const [error, setError] = useState(null);
  const [submitting, setSubmitting] = useState(false);
  const [categories, setCategories] = useState([]);
  const [subCategories, setSubCategories] = useState([]);

  const handleCancel = () => {
    window.history.back();
  };

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const data = await read("categories");
        setCategories(data);
      } catch (err) {
        setError(err.message);
      }
    };

    const fetchSubCategories = async () => {
      try {
        const data = await read("subcategories");
        setSubCategories(data);
      } catch (err) {
        setError(err.message);
      }
    };

    fetchCategories();
    fetchSubCategories();
  }, []);

    const handleChange = event => {
      const { name, value } = event.target;
      setForm(prevForm => ({
        ...prevForm,
        [name]: value
      }));
    };

    const handleSubmit = async event => {
        event.preventDefault();

        setError(null);
        setSubmitting(true);

        try {
            await onSubmit({
                productName: form.productName,
                categoryID: parseInt(form.categoryID),
                subCategoryID: parseInt(form.subCategoryID),
                unitPrice: parseFloat(form.unitPrice),
                inventory: parseInt(form.inventory)
            });
        } catch (err) {
            setError(err.message);
        } finally {
            setSubmitting(false);
        }
    };
  return (
    <form onSubmit={handleSubmit}>
      {error && <p style={{ color: "red" }}>{error}</p>}
      <div>
        <label htmlFor="productName">Product Name</label>
        <input
            type="text"
            name="productName"
            value={form.productName}
            onChange={handleChange} 
            required
        />
      </div>
      <div>
        <label htmlFor="categoryID">Category</label>
        <select name="categoryID" value={form.categoryID} onChange={handleChange} required>
          <option value="">Select a category</option>
          {categories.map((category) => (
            <option key={category.categoryID} value={category.categoryID}>
              {category.categoryName}
            </option>
          ))}
        </select>
      </div>

      <div>
        <label htmlFor="subCategoryID">Subcategory</label>
        <select name="subCategoryID" value={form.subCategoryID} onChange={handleChange} required>
          <option value="">Select a subcategory</option>
          {subCategories.map((subCategory) => (
            <option
              key={subCategory.subCategoryID}
              value={subCategory.subCategoryID}
            >
              {subCategory.subCategoryName}
            </option>
          ))}
        </select>
      </div>

      <div>
        <label htmlFor="unitPrice">Unit Price</label>
        <input
            type="number"
            name="unitPrice"
            step="0.01"
            min="0"
            value={form.unitPrice}
            onChange={handleChange} 
            required
        />
      </div>

         <div>
        <label htmlFor="inventory">Inventory</label>
        <input
            type="number"
            name="inventory"
            min="0"
            value={form.inventory}
            onChange={handleChange} 
            required
        />
      </div>
       <div>
        <button type="submit" disabled={submitting}>
          {submitting ? "Submitting..." : "Submit"}
        </button>
        <button type="button" onClick={handleCancel}>
          Cancel
        </button>
      </div>
    </form>
    
  );
}