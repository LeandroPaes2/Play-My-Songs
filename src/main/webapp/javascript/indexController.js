function EnviarArquivo(){
    const mensagem=document.getElementById("mensagem");
    const URL_TO_FETCH = 'upload-servlet';

    var formData = new FormData(document.getElementById("fform"));
    //formData.append('acao', 'confirmar'); opcional, caso queira inserir outra informação

    fetch(URL_TO_FETCH, { method: 'post',body: formData })
        .then(response=> {return response.text();})
        .then(dados=> { mensagem.innerHTML = dados; })
        .catch(error=> mensagem.innerHTML=error);
}