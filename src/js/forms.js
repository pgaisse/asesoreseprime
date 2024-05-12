
var inputElement = document.querySelector('#table_name');
const datosDesdeNodeString = document.currentScript.getAttribute('data-datos');
var formularioCreado = false;


document.addEventListener('DOMContentLoaded', function() {
  // Verificar si la página ya tiene la variable renderizada
  const miParrafo = document.getElementById('miParrafo');
  const variableDesdeExpress = miParrafo.textContent;

  if (variableDesdeExpress.trim() === '') {
    // Si no está presente, hacer una solicitud AJAX para obtenerla
    fetch('/ruta')
      .then(response => response.json())
      .then(data => {
        const variableDesdeExpress = data.variable;
        console.log(variableDesdeExpress);

        // Actualizar el contenido en la página
        miParrafo.textContent = variableDesdeExpress;
      });
  } else {
    // Si ya está presente, simplemente usarla
    console.log(variableDesdeExpress);
  }

alert(variableDesdeExpress)
});




function bringForm(){
 
        //let defaultDamages = document.querySelector('#defaultDamages');
        // Prevenir el envío del formulario por defect
        event.preventDefault();
        var inputElement = document.getElementById('asd');
  

        // Verificar si el formulario ya ha sido creado
        if (!formularioCreado) {
          // Obtener la tabla existente
          var tabla = document.getElementById('table');
    
          // Crear una nueva fila
          var fila = tabla.insertRow();
    
          // Crear las celdas de la fila
          for (var i = 1; i <= 6; i++) {
            var celda = fila.insertCell();
    
            // Las dos primeras celdas están libres
            if (i > 2) {
              // Crear los campos de texto
              if (i === 3 || i === 4) {
                // Crear select con dos opciones
                var select = document.createElement('select');
                for (var j = 1; j <= 2; j++) {
                  var opcion = document.createElement('option');
                  opcion.value = 'opcion' + j;
                  opcion.text = 'Opción ' + j;
                  select.appendChild(opcion);
                }
                celda.appendChild(select);
              } else if (i === 5) {
                // Crear campo numerico
                var inputNumerico = document.createElement('input');
                inputNumerico.type = 'number';
                inputNumerico.name = 'campo' + (i - 2);
                inputNumerico.placeholder = 'Campo ' + (i - 2);
                celda.appendChild(inputNumerico);
              } else if (i === 6) {
                // Crear campo de texto
                var inputTexto = document.createElement('input');
                inputTexto.type = 'text';
                inputTexto.name = 'campo' + (i - 2);
                inputTexto.placeholder = 'Campo ' + (i - 2);
                celda.appendChild(inputTexto);
              }
            }
          }
    
          // Crear el botón de envío
          var boton = document.createElement('button');
          boton.type = 'button'; // Cambiar el tipo de botón a "button"
          boton.innerHTML = 'Enviar';
          celda.appendChild(boton);
    
          // Establecer el indicador de formulario creado a true
          formularioCreado = true;
        }
    
    
}
