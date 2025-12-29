<?php
include 'includes/conexao.php';
include 'includes/header.php';

$id = $_GET['id'] ?? null;

if (!$id) {
  header('Location: index.php');
  exit;
}

$stmt = $pdo->prepare("
  SELECT l.*,
  CASE
    WHEN l.id IN (SELECT livro_id FROM alugueis WHERE devolvido = 0)
    THEN 0 ELSE 1
  END AS disponivel
  FROM livros l
  WHERE l.id = ?
");
$stmt->execute([$id]);
$livro = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$livro) {
  header('Location: index.php');
  exit;
}
?>

<div class="container py-5">

  <div class="row g-4">
    
    <!-- CAPA -->
    <div class="col-md-4 text-center">
      <img src="../sistema-biblioteca/assets/capas/<?= $livro['capa'] ?>"
           class="img-fluid shadow"
           alt="<?= $livro['titulo'] ?>">
    </div>

    <!-- INFORMAÇÕES -->
    <div class="col-md-8">
      <h2><?= $livro['titulo'] ?></h2>
      <h5 class="text-muted"><?= $livro['autor'] ?></h5>

      <p class="mt-3">
        <strong>Categoria:</strong> <?= $livro['categoria'] ?><br>
        <strong>Código da Prateleira:</strong> <?= $livro['codigo_localizacao'] ?>
      </p>

      <p>
        <strong>Status:</strong>
        <span class="<?= $livro['disponivel'] ? 'text-success' : 'text-danger' ?>">
          <?= $livro['disponivel'] ? 'Disponível' : 'Alugado' ?>
        </span>
      </p>

      <hr>

      <h5>Sinopse</h5>
      <p style="text-align: justify;">
        <?= nl2br($livro['sinopse']) ?>
      </p>

      <a href="index.php" class="btn btn-outline-secondary mt-3">
        ← Voltar ao catálogo
      </a>
    </div>

  </div>
</div>

