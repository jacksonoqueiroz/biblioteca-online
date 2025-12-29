<?php
include 'includes/conexao.php';

$nome = $_GET['nome'] ?? '';

$stmt = $pdo->prepare("
  SELECT l.id, l.titulo, l.autor, l.capa,
  CASE
    WHEN l.id IN (SELECT livro_id FROM alugueis WHERE devolvido = 0)
    THEN 0 ELSE 1
  END AS disponivel
  FROM livros l
  WHERE l.titulo LIKE ?
  ORDER BY l.titulo
  LIMIT 20
");

$stmt->execute(["%$nome%"]);
echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
