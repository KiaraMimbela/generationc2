import React ,{useState, useEffect} from 'react';
//useEffectcatigalla la accion de ir a la api
import {getAllAutos, eliminarAuto, guardarAuto} from "../services/AutoServices";
import ModalComponent from './modal';
import ModalAutoEditar from './modelAutoEditar';

//creando e insialiciando un objeto que esperamos como respuesta, esta como arreglo porque vamos a buscar todos los autos
// una variable
const autoInicial=[{
    id: 1,
    marca: "",
    color: "",
    usuario:{}
}];
// creando la estructura
const AutoComponent = ()=>{
    // aplicando useSate
    const[autos, setAutos]= useState(autoInicial);
    const [autoEditado, setAutoEditado] = useState(null);
    // creanso una funcion que va a buscar la funcion getAllAutos en el service
    // para obtener toda la lista de autos
    const obtenerAutos= async () =>{
        setAutos( await getAllAutos());
    }
    // para eliminar auto
    const eliminaAuto=async(autoId)=>{
        console.log("elimina")
        await eliminarAuto(autoId)
        setAutos(await getAllAutos())
    }
    // para guardar un auto
    const autoAgregar = async (auto) => {
        await guardarAuto(auto)
        setAutos(await getAllAutos())
    }
    /* editar auto - ale
    const autoEditar=(autoEditado)=>{
        const actualizarAuto = autos.map(auto => (auto.id === autoEditado.key ? autoEditado : auto))
        setAutos(actualizarAuto)
    }*/
    // editar auto - profe
    const handleShowEdit = (auto) =>{
        setAutoEditado(auto);
    }


    // useEffect => ejecuta una funcion segun el momento de cliclo de vida, se encarga de llamar la funcion
    useEffect(()=>{obtenerAutos()},[]);
    return(
        <>
            <h1>respuesta de la api: </h1>
                <ModalAutoEditar autoAgregar={autoAgregar} autoEditado={autoEditado}></ModalAutoEditar>
                <div className='card col-3'>
                    <div className='card-body d-flex justify-content-center'>
                        <ModalComponent //llamando al modal
                        autoAgregar={autoAgregar}/>
                    </div>
                </div>

                {
                //investigar el uso de map en react y 
                //traspaso de objeto a un componente e imprimir en la pagina
                autos.map(auto => 
                    <div className="card" key={auto.id}>
                        <div className="card-body">
                            <h5 className="card-title">{auto.marca}</h5>
                            <p className="card-text">{auto.id} {auto.color}</p>
                            <hr/>
                            <div className="d-flex justify-content-end">
                                <button className="btn btn-sm btn-outline-primary me-2" onClick={()=>handleShowEdit(auto)} >Editar</button>
                                <button className="btn btn-sm btn-outline-danger" onClick={() => eliminaAuto(auto.id)}>Eliminar</button>
                            </div>
                        </div>
                    </div>
                )
                }
        </>
    );
}

export default AutoComponent;