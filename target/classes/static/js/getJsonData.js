function getJsonData(request){
    fetch(request).then(
        response => response.json().then(
            data => {
                return data;
            }
        )
    )
}

export default getJsonData;

function getJsonData(url,RequestInit){
    fetch(url,RequestInit).then(
        response => response.json().then(
            data=>{
                return data;
            }
        )
    )
}

export default getJsonData;
