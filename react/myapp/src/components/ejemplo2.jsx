import { useState } from "react";

function Ejemplo2(){
//useState
    //const [variable, state] =useState(se le asigna valor)
    const [texto, setTexto] = useState("");

    const[ingreso, setIngreso] = useState(null);
    
    //funcion para modficar texto
    function modificarParrafo(){
        //setTexto("texto modificado")
        setTexto(ingreso);
    }
    // e = de evento
    function capturarDatos(e){
        //e.target.value=> captura cada uno de los caracteres ingresados
        console.log(e.target.value);
        //setTexto(e.target.value);
        setIngreso(e.target.value)
    }


    return(
        <>
            <p>Parrafo 1 {texto} </p>
            <input type="text"  className="form-control" onChange={capturarDatos} />
            <button className="btn btn-outline-success" onClick={modificarParrafo}>Modificar</button>
        </>
    );
}
export default Ejemplo2;