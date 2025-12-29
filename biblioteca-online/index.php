<?php
include 'includes/conexao.php';
include 'includes/header.php';



// Buscar livros (últimos cadastrados)
$stmt = $pdo->query("
    SELECT l.id, l.titulo, l.autor, l.capa,
    CASE 
        WHEN EXISTS (
            SELECT 1 FROM alugueis a 
            WHERE a.livro_id = l.id AND a.devolvido = 0
        ) THEN 'Alugado'
        ELSE 'Disponível'
    END AS status
    FROM livros l
    ORDER BY l.id DESC
    LIMIT 8
");
$livros = $stmt->fetchAll(PDO::FETCH_ASSOC);


?>

<!-- CAROUSEL -->
<div id="carouselBiblioteca" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">

        <div class="carousel-item active">
            <img src="assets/images/banner1.jpg" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Novas Aquisições</h2>
                <p>Conheça os novos títulos disponíveis na biblioteca</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/images/banner2.jpg" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Início das Atividades 2026</h2>
                <p>Biblioteca aberta para novos leitores</p>
            </div>
        </div>

        <div class="carousel-item">
            <img src="assets/images/banner3.jpg" class="d-block w-100">
            <div class="carousel-caption">
                <h2>Calendário de Feriados</h2>
                <p>Confira os dias de funcionamento especial</p>
            </div>
        </div>

    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselBiblioteca" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselBiblioteca" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-------Buscar Livros Por Nome---------->

<section class="card-livro busca-livro py-4">
  <div class="container">
    <input type="text" id="buscarLivro"
           class="form-control form-control-lg"
           placeholder="🔍 Buscar livro pelo nome...">
    
    <div id="resultadoBusca" class="mt-3"></div>
  </div>
</section>  

<?php
// Buscar livros mais alugados
$stmt = $pdo->query("
    SELECT 
        li.id,
        li.titulo,
        li.capa,
        li.autor,
        COUNT(a.id) AS total_alugueis,
        CASE 
            WHEN EXISTS (
                SELECT 1 FROM alugueis 
                WHERE livro_id = li.id AND devolvido = 0
            ) THEN 'Alugado'
            ELSE 'Disponível'
        END AS status
    FROM livros li
    LEFT JOIN alugueis a ON a.livro_id = li.id
    GROUP BY li.id, li.titulo, li.capa
    ORDER BY total_alugueis DESC
    LIMIT 10
    ");
$livros = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<section class="mais-alugados">
    <h2>Livros mais alugados</h2>

    <div class="slider-container">

        <button class="slider-btn left" id="btnPrev">&#10094;</button>

        <div class="slider-viewport" id="sliderLivros">
            <?php foreach ($livros as $livro): ?>
                <div class="livro-card">
                    <img src="../sistema-biblioteca/assets/capas/<?= $livro['capa'] ?>" alt="<?= $livro['titulo'] ?>">

                    <div class="livro-info">
                        <h4><?= $livro['titulo'] ?></h4>
                        <br>
                        <p class="mb-1 text-muted"><?= $livro['autor'] ?></p>
                        <br>
                        <span class="status <?= strtolower($livro['status']) ?>">
                            <?= $livro['status'] ?>
                        </span>

                        <!-- <small><?= $livro['total_alugueis'] ?> aluguéis</small> -->
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <button class="slider-btn right" id="btnNext">&#10095;</button>

    </div>
</section>




<!-- LISTAGEM DE LIVROS -->
<div class="container my-5">
    <h3 class="mb-4 text-center">Acervo da Biblioteca</h3>

    <div class="row g-4">
        <?php foreach ($livros as $livro): ?>
            
        <div class="col-md-3 col-sm-6">
            <a href="livro.php?id=<?= $livro['id'] ?>" class="card-livro-link">
            <div class="card card-livro shadow-sm h-100">
                <img src="../sistema-biblioteca/assets/capas/<?= $livro['capa'] ?? 'sem-capa.jpg' ?>" class="card-img-top">

                <div class="card-body">
                    <h6 class="card-title"><?= $livro['titulo'] ?></h6>
                    <p class="mb-1 text-muted"><?= $livro['autor'] ?></p>

                    <?php if ($livro['status'] == 'Disponível'): ?>
                        <span class="status-disponivel">🟢 Disponível</span>
                    <?php else: ?>
                        <span class="status-alugado">🔴 Alugado</span>
                    <?php endif; ?>
                </div>
            </a>
        </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>




<script src="assets/js/scripts.js"></script>




<?php include 'includes/footer.php'; ?>
