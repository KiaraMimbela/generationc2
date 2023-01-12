//axios
import axios from 'axios';
//libreria que se encarga de buscar las peticiones

// establecer la ruta por default
const rutaBase = "http://localhost:9080/api2/";
const usuarioId = 1;
// funcion de llamado
// async => asincrono, await => se encarga de esperar la respuesta de la ruta
const getAllAutos = async()=>{
    // peticion de tipo get
    // concatenada el resto de la ruta de la funcion
    const respuesta = await axios.get(rutaBase + "autos/getall");
    console.log(respuesta.data);
    return respuesta.data;
}
const getAuto = async(id)=>{
    // peticion de tipo get
    // concatenada el resto de la ruta de la funcion
    const respuesta = await axios.get(rutaBase + "obtener/auto/"+id);
    console.log(respuesta.data);
    return respuesta.data;
}
const eliminarAuto = async(id)=>{
    //eliminarAuto(1)
    //peticion con valores en path
    const respuesta = await axios.post(rutaBase+"eliminar/auto?id="+id);
    console.log("llamando al metodo")
    //axios.post(http://localhost:9080/api/eliminar/auto/1)
    return respuesta.data;
}
const guardarAuto = async(auto)=>{
    //peticion con valor desde body
    const respuesta = await axios.post(rutaBase +"guardar/auto?usuarioId=" + usuarioId, auto);
    return respuesta.data;
}

export{getAllAutos, getAuto, eliminarAuto, guardarAuto}