import React, { useState } from 'react';
import styles from './css/EntradaArticulos.module.css';
import { useNavigate } from 'react-router-dom';

const EntradaArticulos = () => {
  const [articuloActual, setArticuloActual] = useState({ id: '', nombre: '', cantidad: '', precio: '' });
  const [listaArticulos, setListaArticulos] = useState([]);
  const [entradasRegistradas, setEntradasRegistradas] = useState(0);
  const navigate = useNavigate();

  const handleChange = (e) => {
    setArticuloActual({ ...articuloActual, [e.target.name]: e.target.value });
  };

  const obtenerDatosArticulo = async () => {
    try {
      const response = await fetch(`http://localhost:3000/api/articulos/${articuloActual.id}`);
      const data = await response.json();

      if (response.ok) {
        setArticuloActual({ 
          ...articuloActual, 
          nombre: data.nombre, 
          precio: data.precio_unitario 
        });
      } else {
        alert('Artículo no encontrado');
      }
    } catch (error) {
      console.error('Error al obtener artículo:', error);
      alert('Error al buscar artículo');
    }
  };

  const agregarArticulo = () => {
    if (!articuloActual.id || !articuloActual.nombre || !articuloActual.cantidad || !articuloActual.precio) return;
    setListaArticulos([...listaArticulos, articuloActual]);
    setArticuloActual({ id: '', nombre: '', cantidad: '', precio: '' });
  };

  const calcularTotal = () => {
    return listaArticulos.reduce((acc, item) => acc + parseFloat(item.cantidad) * parseFloat(item.precio), 0).toFixed(2);
  };

  const enviarEntrada = async () => {
    try {
      const response = await fetch('http://localhost:3000/api/entrada', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(listaArticulos)
      });

      const data = await response.json();

      if (response.ok) {
        alert(`Entrada registrada con éxito. Total: $${calcularTotal()}`);
        setEntradasRegistradas(prev => prev + 1);
        setListaArticulos([]);
        setArticuloActual({ id: '', nombre: '', cantidad: '', precio: '' });
      } else {
        alert('Error al registrar entrada: ' + data.message);
      }
    } catch (error) {
      console.error('Error al enviar entrada:', error);
      alert('Error al registrar entrada');
    }
  };

  const nuevaEntrada = () => {
    setListaArticulos([]);
    setArticuloActual({ id: '', nombre: '', cantidad: '', precio: '' });
  };

  return (
    <div className={styles.entradaContainer}>
      <h2>Entrada de Artículos</h2>
      <p className={styles.contadorEntradas}>Entradas registradas: {entradasRegistradas}</p>

      <div className={styles.formGroup}>
        <input
          type="text"
          name="id"
          placeholder="ID del Artículo"
          value={articuloActual.id}
          onChange={handleChange}
        />
        <button type="button" onClick={obtenerDatosArticulo}>Buscar</button>
      </div>

      <div className={styles.formGroup}>
        <input
          type="text"
          name="nombre"
          placeholder="Nombre"
          value={articuloActual.nombre}
          onChange={handleChange}
        />
        <input
          type="number"
          name="cantidad"
          placeholder="Cantidad"
          value={articuloActual.cantidad}
          onChange={handleChange}
        />
        <input
          type="number"
          name="precio"
          placeholder="Precio"
          step="0.01"
          value={articuloActual.precio}
          onChange={handleChange}
        />
        <button type="button" onClick={agregarArticulo}>Agregar Artículo</button>
      </div>

      {listaArticulos.length > 0 && (
        <>
          <table className={styles.tablaArticulos}>
            <thead>
              <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Total</th>
              </tr>
            </thead>
            <tbody>
              {listaArticulos.map((articulo, index) => (
                <tr key={index}>
                  <td>{articulo.id}</td>
                  <td>{articulo.nombre}</td>
                  <td>{articulo.cantidad}</td>
                  <td>${parseFloat(articulo.precio).toFixed(2)}</td>
                  <td>${(parseFloat(articulo.cantidad) * parseFloat(articulo.precio)).toFixed(2)}</td>
                </tr>
              ))}
            </tbody>
          </table>

          <p className={styles.total}>Total Artículos: {listaArticulos.length}</p>
          <p className={styles.total}>Total Valor Mercancía: ${calcularTotal()}</p>

          <div className={styles.botonesEntrada}>
            <button className={styles.botonAgregarEntrada} onClick={enviarEntrada}>
              Registrar Entrada
            </button>
            <button className={styles.botonNuevaEntrada} onClick={nuevaEntrada}>
              Nueva Entrada
            </button>
          </div>
        </>
      )}

      <button className={styles.botonRegresar} onClick={() => navigate('/inventario')}>
        Regresar al Menú
      </button>
    </div>
  );
};

export default EntradaArticulos;

