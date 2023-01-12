import React,{Component} from "react";

class SubCom extends Component{
    render(){
        return(
                <form>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Correo:</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="generaton@gmail.com"/>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="********"/>
                    </div>
                    <br></br>
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </form>
        );
    }
}

export default SubCom;