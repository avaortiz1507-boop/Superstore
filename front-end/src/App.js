import { BrowserRouter, Link, Routes, Route } from 'react-router';
import './App.css';
import AddressList from './components/Address/List';
import ProductList from './components/Product/List';
import ProductAdd from './components/Product/Add';
import ProductDetail from './components/Product/Detail';
import EditList from './components/Product/Edit';
import AddressTypesList from './components/AddressTypes/List';

function App() {
  return (
  <BrowserRouter>
    <div className="App">
      <header className="App-header">
       <nav>
        <Link to="/products">Products</Link>
        <Link to="/addresses">Addresses</Link>
        <Link to="/address-types">Address Types</Link>
       </nav>
      </header>
     <main>
      <Routes>
        <Route path="/products" element={<ProductList />} />
        <Route path="/products/add" element={<ProductAdd />} />
        <Route path="/products/:id" element={<ProductDetail />} />
        <Route path="/products/:id/edit" element={<EditList />} />
        <Route path="/addresses" element={<AddressList />} />
        <Route path="/address-types" element={<AddressTypesList />} />
      </Routes>
     </main>
    </div>
  </BrowserRouter>
  );
}

export default App;