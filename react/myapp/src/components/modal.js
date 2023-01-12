import React, { useState } from "react";
import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";

const autoInicial = [
    {
    id: "",
    marca: "",
    color: "",
    usuarios: {},
    },
];

function ModalComponent({ autoAgregar }) {
    const [show, setShow] = useState(false);
    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [autoNuevo, setAuto] = useState(autoInicial);
    const { marca, color } = autoNuevo;

    const handleSubmit = (e) => {
    e.preventDefault(); //Esto es para evitar que la pagina se actualize al presionar el button
    autoAgregar(autoNuevo);
    };

    const handleInputChange = (e) => {
    //...autoNuevo-> es una condicional para que el contenido de autoNuevo se mantenga
    setAuto({ ...autoNuevo, [e.target.name]: e.target.value }); //Aqui el event.target.name toma el name de cada input para añadirle datos
    };

    return (
        <>
            <Button>
                <i class="bi bi-plus-lg" variant="success" onClick={handleShow}>
                {" "}
                Agregar Auto
                </i>
            </Button>

        <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
            <Modal.Title>Agrega un auto</Modal.Title>
        </Modal.Header>
        <Modal.Body>
            <form onSubmit={handleSubmit}>
            <div className="form-group">
                <label>Marca</label>
                <input
                type="text"
                className="form-control"
                id="Marca"
                placeholder="Marca"
                value={marca}
                name="marca"
                onChange={handleInputChange}
                />
                <br />
            </div>
            <div className="form-group">
                <label>Color</label>
                <input
                type="text"
                className="form-control"
                id="color"
                placeholder="Color"
                value={color}
                name="color"
                onChange={handleInputChange}
                />
                <br />
            </div>
            <br />
            <button type="submit" className="btn btn-outline-primary me-2">
                Agregar
            </button>
            </form>
        </Modal.Body>
        <Modal.Footer>
            <Button variant="secondary" onClick={handleClose}>
                Cerrar
            </Button>
        </Modal.Footer>
        </Modal>
    </>
    );
}

export default ModalComponent;
