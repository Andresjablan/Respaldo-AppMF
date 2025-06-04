// Importación de las librerías principales de React y ReactDOM
import React from 'react';
import ReactDOM from 'react-dom/client';
// Importación de componentes para el manejo de rutas
import { BrowserRouter, Routes, Route } from 'react-router-dom';

// Importación de componentes personalizados
import Login from './Login.jsx';
import MenuPrincipal from './MenuPrincipal.jsx';
import RegistroUsuario from './RegistroUsuario.jsx';
import Usuarios from './Usuarios.jsx';
import Inventario from './Inventario.jsx'; 
import GestionArticulos from './componentes/GestionArticulos.jsx';
import EntradaArticulos from './componentes/EntradaArticulos.jsx';

// Renderiza el componente principal en el elemento con id 'root' en el HTML
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/menu" element={<MenuPrincipal />} />
        <Route path="/register" element={<RegistroUsuario />} />
        <Route path="/UserList" element={<Usuarios />} />
        <Route path="/inventario" element={<Inventario />} />
        <Route path="/gestion-articulos" element={<GestionArticulos />} />
        <Route path="/nueva-entrada" element={<EntradaArticulos />} />
         </Routes>
    </BrowserRouter>
  </React.StrictMode>
);

