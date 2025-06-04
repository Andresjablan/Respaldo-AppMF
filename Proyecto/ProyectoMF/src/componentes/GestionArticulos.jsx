// importacion de librerias necesarias y estilos
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import styles from './css/Articulos.module.css';

// Componente para gestionar artículos  
function GestionArticulos() {
  const [articulos, setArticulos] = useState([]);
  const [nuevoArticulo, setNuevoArticulo] = useState({
    nombre: '',
    descripcion: '',
    precio: '',
    stock: ''
  });
  const [editandoId, setEditandoId] = useState(null);
  const [mensaje, setMensaje] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    obtenerArticulos();
  }, []);

  const obtenerArticulos = async () => {
    try {
      const response = await axios.get('http://localhost:3001/articulos');
      setArticulos(response.data);
    } catch (error) {
      console.error('Error al obtener artículos:', error);
    }
  };

  const handleEliminar = async (id) => {
    if (window.confirm('¿Estás seguro de que quieres eliminar este artículo?')) {
      try {
        await axios.delete(`http://localhost:3001/articulos/${id}`);
        setMensaje('Artículo eliminado correctamente');
        obtenerArticulos();
      } catch (error) {
        console.error('Error al eliminar artículo:', error);
      }
    }
  };

  const handleEditar = (id) => {
    setEditandoId(id);
  };

  const handleCancelar = () => {
    setEditandoId(null);
    setMensaje('');
  };

  const handleGuardar = async (id) => {
    const articuloEditado = articulos.find(a => a.id_articulo === id);
    if (!articuloEditado.nombre || !articuloEditado.descripcion || !articuloEditado.precio || !articuloEditado.stock) {
      setMensaje('Todos los campos son obligatorios para actualizar');
      return;
    }

    try {
      await axios.put(`http://localhost:3001/articulos/${id}`, articuloEditado);
      setMensaje('Artículo actualizado correctamente');
      setEditandoId(null);
      obtenerArticulos();
    } catch (error) {
      console.error('Error al actualizar artículo:', error);
    }
  };

  const handleInputChange = (e, id, campo) => {
    const nuevosArticulos = articulos.map(a => {
      if (a.id_articulo === id) {
        return { ...a, [campo]: e.target.value };
      }
      return a;
    });
    setArticulos(nuevosArticulos);
  };

  const handleNuevoInputChange = (e) => {
    const { name, value } = e.target;
    setNuevoArticulo({ ...nuevoArticulo, [name]: value });
  };

  const handleCrearArticulo = async () => {
    const { nombre, descripcion, precio, stock } = nuevoArticulo;
    if (!nombre || !descripcion || !precio || !stock) {
      setMensaje('Todos los campos son obligatorios');
      return;
    }

    try {
      await axios.post('http://localhost:3001/articulos', nuevoArticulo);
      setMensaje('Artículo creado correctamente');
      setNuevoArticulo({ nombre: '', descripcion: '', precio: '', stock: '' });
      obtenerArticulos();
    } catch (error) {
      console.error('Error al crear artículo:', error);
    }
  };
//
  return (
    <div className={styles.gestionContainer}>
      <h2>Gestión de Artículos</h2>
      {mensaje && <p className="mensaje">{mensaje}</p>}

      <div className={styles.formularioCrear}>
        <h3>Crear nuevo artículo</h3>
        <input
          type="text"
          name="nombre"
          placeholder="Nombre"
          value={nuevoArticulo.nombre}
          onChange={handleNuevoInputChange}
        />
        <input
          type="text"
          name="descripcion"
          placeholder="Descripción"
          value={nuevoArticulo.descripcion}
          onChange={handleNuevoInputChange}
        />
        <input
          type="number"
          name="precio"
          placeholder="Precio"
          value={nuevoArticulo.precio}
          onChange={handleNuevoInputChange}
        />
        <input
          type="number"
          name="stock"
          placeholder="Stock"
          value={nuevoArticulo.stock}
          onChange={handleNuevoInputChange}
        />
        <button onClick={handleCrearArticulo}>Crear</button>
      </div>

      <table className="articulos-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {articulos.map((articulo) => (
            <tr key={articulo.id_articulo}>
              {editandoId === articulo.id_articulo ? (
                <>
                  <td>{articulo.id_articulo}</td>
                  <td>
                    <input
                      value={articulo.nombre}
                      onChange={(e) => handleInputChange(e, articulo.id_articulo, 'nombre')}
                    />
                  </td>
                  <td>
                    <input
                      value={articulo.descripcion}
                      onChange={(e) => handleInputChange(e, articulo.id_articulo, 'descripcion')}
                    />
                  </td>
                  <td>
                    <input
                      type="number"
                      value={articulo.precio}
                      onChange={(e) => handleInputChange(e, articulo.id_articulo, 'precio')}
                    />
                  </td>
                  <td>
                    <input
                      type="number"
                      value={articulo.stock}
                      onChange={(e) => handleInputChange(e, articulo.id_articulo, 'stock')}
                    />
                  </td>
                  <td>
                    <button onClick={() => handleGuardar(articulo.id_articulo)}>Guardar</button>
                    <button onClick={handleCancelar}>Cancelar</button>
                  </td>
                </>
              ) : (
                <>
                  <td>{articulo.id_articulo}</td>
                  <td>{articulo.nombre}</td>
                  <td>{articulo.descripcion}</td>
                  <td>${articulo.precio}</td>
                  <td>{articulo.stock}</td>
                  <td>
                    <button onClick={() => handleEditar(articulo.id_articulo)}>Editar</button>
                    <button onClick={() => handleEliminar(articulo.id_articulo)}>Eliminar</button>
                  </td>
                </>
              )}
            </tr>
          ))}
        </tbody>
      </table>

      <button onClick={() => navigate(-1)} className="btn-regresar">⬅️ Regresar</button>
    </div>
  );
}

export default GestionArticulos;

