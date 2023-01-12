import React,{Component} from "react";
import Footer from "./footer";
import SubCom from "./subcom";

class Conteiner extends Component{
    render(){
        return(
            <div>
                <div id="bloqueAzul">
                    <h1>{this.props.nombre}</h1>
                    <SubCom/>
                    <Footer/>
                </div>
            </div>
        );
    }
}

export default Conteiner;