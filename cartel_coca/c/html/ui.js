const leaf = document.getElementById('barra1')
const gas = document.getElementById('barra2')
const acid = document.getElementById('barra3')
const confirm = document.getElementById('confirm')
const close = document.getElementById('close')


//DISPLAY CARALHO

function display(bool) {
    if (bool) {
        document.getElementById('container').style.display = ''; //mostra 
    } else {
        document.getElementById('container').style.display = 'none'; //esconde
    }
}

display(false)



//Função de enviar para o client

function production(leaf,gas,acid) {
    fetch('http://cartel_coca/production', {  //função que passa o callback (givecar no caso)
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            qtdleaf: leaf, //atribui o valor do "id" ao "passaporte" que é passado ao client
            qtdgas: gas, //atribui o valor do "carrin" a "carro" que é passado ao client
            qtdacid: acid //atribui o valor do "carrin" a "carro" que é passado ao client
        })
    })
 
}



function fail(mensagem) {
    fetch('http://cartel_coca/fail', {  //função que passa o callback (fail no caso) -- FUNÇÃO RESPONSÁVEL POR CHARMAR UM NOTIFY COM ERRO
        method: 'POST', //post é usado para dizer que vai enviar a informação
        body: JSON.stringify({
            msg: mensagem, //atribui o valor do objeto a "arma" que é passado ao client
        })
    })
}

//message recebida do client


addEventListener('message', function(event) //recebe a msg do client
{
    var item = event.data;  //data é a variável que está na function do client

    if (item.type === "ui") // type enviado pelo client
    {
        if (item.status == true){ //status enviado pelo client
            display(true) //seta display como true

                confirm.addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão confirm 
            
                        if(!leaf.value || !acid.value || !gas.value) {  //checa se o valor é vazio, caso seja, retorna a função de erro   
                            fail('Precisa estar preenchido.') 
                        }else if(isNaN(gas.value) || isNaN(acid.value) || isNaN(leaf.value)){  //checa se é um número
                            fail('Os valores precisam ser numéricos.')
                        }else{ //caso esteja tudo certo, ele executa a função
                            production(leaf.value,gas.value,acid.value)                
                        }

                })

                close.addEventListener('click', function() { //função responsável por ouvir os clicks no primeiro botão close
                    closeNUI()              
                })  
        } else {
            display(false) //seta display como false
        }             
    } 
})



function closeNUI() {
    fetch('http://cartel_coca/fechar', {
        method: 'POST',
        body: JSON.stringify({
       
        })
    })
    display(false)
    window.location.reload()
}
