import React,{Component} from "react";
import { MDBFooter } from 'mdb-react-ui-kit';

class Footer extends Component{
    render(){
        return(
            <MDBFooter bgColor='light' className='text-center text-lg-left'>
                <div className='text-center p-3' style={{ backgroundColor: '#F588E0' }}>
                    &copy; {new Date().getFullYear()} Copyright
                </div>
            </MDBFooter>
        );
    }
}

export default Footer;