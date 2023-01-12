import React, {Component} from "react";


class Ejemplo extends Component{
// eventos sinteticos
//onClick(), onBlur(mouse encima), onChange(input para cambiar lo que hay dentro)
// state, permiten realizar modificaciones

    constructor(props){
        super(props);
        this.state={
            //declaracion de variable
            //las variables en el state son inmutables, no se le puede cambiar directamente el valor
            encendido: "on",
            valor : 0
        }
    }
    cambiarEstado = ()=>{
        //realizar el cambio con set
        //alert("click en boton 2");
        // la forma de cambiar una variable es con setState
        if(this.state.encendido==="on"){
            this.setState({encendido:"off"});
        }else{
            this.setState({encendido:"on"});
        }
    }
    aumentar = ()=>{
        this.setState({valor : this.state.valor + 1});
    }
    

    render(){
        return(
            <div>
                <p>Estado de la luz : {this.state.encendido} </p>
                <p>Valor : {this.state.valor}</p>
                <button onClick={()=> alert("Hi world!")} type="button" className="btn btn-outline-primary"> Click me</button>
                <button onClick={this.cambiarEstado} type="button" className="btn btn-outline-primary"> Click me 2</button>
                <button onClick={this.aumentar} type="button" className="btn btn-outline-primary">Incrementar</button>
            </div>
        );
    }
}

export default Ejemplo;