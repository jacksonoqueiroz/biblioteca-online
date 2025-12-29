
//Scripts para os mais alugados
const slider = document.getElementById('sliderLivros');
const btnNext = document.getElementById('btnNext');
const btnPrev = document.getElementById('btnPrev');

btnNext.addEventListener('click', () => {
    slider.scrollLeft += 320;
});

btnPrev.addEventListener('click', () => {
    slider.scrollLeft -= 320;
});

// DRAG (mouse)
let isDown = false;
let startX;
let scrollLeft;

slider.addEventListener('mousedown', (e) => {
    isDown = true;
    startX = e.pageX - slider.offsetLeft;
    scrollLeft = slider.scrollLeft;
});

slider.addEventListener('mouseleave', () => {
    isDown = false;
});

slider.addEventListener('mouseup', () => {
    isDown = false;
});

slider.addEventListener('mousemove', (e) => {
    if (!isDown) return;
    e.preventDefault();
    const x = e.pageX - slider.offsetLeft;
    const walk = (x - startX) * 1.3;
    slider.scrollLeft = scrollLeft - walk;
});




//ServiceWorker
if ("serviceWorker" in navigator) {
    navigator.serviceWorker.register("/service-worker.js")
    .then(() => console.log("PWA ativo 🚀"))
    .catch(err => console.log("Erro PWA", err));
}





//Buscar Livro por nome
const input = document.getElementById('buscarLivro');
const resultado = document.getElementById('resultadoBusca');

input.addEventListener('keyup', () => {
  const termo = input.value.trim();

  if (termo.length < 3) {
    resultado.innerHTML = '';
    return;
  }

  fetch('buscar-livros.php?nome=' + termo)
    .then(res => res.json())
    .then(dados => {
      resultado.innerHTML = '';

      if (dados.length === 0) {
        resultado.innerHTML = '<p>Nenhum livro encontrado.</p>';
        return;
      }

      dados.forEach(livro => {
        resultado.innerHTML += `
          <div class="card-livro">
            <img src="../sistema-biblioteca/assets/capas/${livro.capa}" alt="">
            <div class="info">
              <strong>${livro.titulo}</strong><br>
              <small>${livro.autor}</small><br>
              <span class="${livro.disponivel == 1 ? 'status-disponivel' : 'status-alugado'}">
                ${livro.disponivel == 1 ? 'Disponível' : 'Alugado'}
              </span>
            </div>
          </div>
        `;
      });
    });
});