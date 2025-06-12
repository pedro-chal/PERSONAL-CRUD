document.addEventListener("DOMContentLoaded", function () {
 

  fetch('/personal-crud/controller/prodcutos_controlador.php?op=listar')
    .then(response => response.json())
    .then(data => {
 

      const contenedor = document.getElementById("dataTable");
      

      // Creamos tabla HTML con los datos
      let tabla = "<table  class='table table-bordered' border='1'><tr><th>Nombre</th><th>Precio</th><th>Cantidad</th><th>Accion</th></tr>";

      data.aaData.forEach(item => {
      
        tabla += `<tr>
                    <td>${item.nombre_producto}</td>
                    <td>${item.precio_producto}</td>
                    <td>${item.cantidad_producto}</td>
                    <td>
                            <a href="#" class="btn btn-success btn-circle">
                               <i class="fas fa-check"></i>
                            </a>

                             <a href="#" class="btn btn-danger btn-circle">
                                <i class="fas fa-trash"></i>
                              </a>
                      </td>
                    
                  </tr>`;

                
                              
      });

      tabla += "</table>";
      contenedor.innerHTML = tabla;
    })
    .catch(error => console.error("❌ Error al obtener datos:", error));
});


//   <tr>
//                                             <td>Tiger Nixon</td>
//                                             <td>System Architect</td>
//                                             <td>Edinburgh</td>
//                                             <td>61</td>
//                                             <td>2011/04/25</td>
//                                             <td>$320,800</td>
//                                         </tr>