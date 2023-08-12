-- To select db connection: Ctrl + Shift + q

-- SELECT * FROM pagamento_pedido

-- SELECT DATE(dtPedido) as dtPedido,
--     COUNT(*) as qtdPedido 
-- FROM pedido
-- GROUP BY 1
-- ORDER BY dtPedido


SELECT *
FROM pedido
WHERE dtPedido >= '2017-07-01'
    AND dtPedido < '2018-01-01'
