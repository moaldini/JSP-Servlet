let count;
window.onload = function (){
    count = document.getElementById("count");
    document.getElementById("add").addEventListener('click',updateCount);
    document.querySelector("#about-us>h1").addEventListener('click', aboutUs)
}
function add(id){
    console.log('id: ', id);
    let prodId = id;
    fetch('shopping', {
        method: 'POST',
        headers: {
            'Content-Type': 'text/plain;charset=UTF-8',
        },
        body: prodId,
    })
        .then(response => response.text())
        .then(()=> updateCount())
        .catch((error) => {
            console.error('Error:', error);
        });

}

function updateCount(){
    count.innerText = ''+(parseInt(count.innerText) + 1);
}

async function aboutUs(){

        let res = await fetch('https://api.mocki.io/v1/91b3df4f');
        let about = await res.json();

        //console.log(about);
        let p = document.querySelector("#about-us>p");
        p.innerHTML = about.about;


}