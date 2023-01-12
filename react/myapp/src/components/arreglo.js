import React from 'react';

function arreglo() {
    return (
    <>
    <table className='table'>
        <thead>
            <tr>
                <th scope='col'>#</th>
                <th scope='col'>Marca</th>
                <th scope='col'>Color</th>
                <th scope='col'>Propietario</th>
            </tr>
        </thead>
        <tbody>
            {
                autos.map(auto =>
                <tr>
                    <td>{auto.id}</td>
                    <td>{auto.marca}</td>
                    <td>{auto.color}</td>
                    <td>{auto.usuario.nombre} {auto.usuario.apellido}</td>
                    <hr/>
                </tr>
                )
            }
        </tbody>
    </table>
    </>
    )
}

export default arreglo;