module Interpreter where

import Data


-- evaluate expressions
evalExpr :: Expr -> hash -> MAYBE Int

evalExpr (Value v) _ = v
evalExpr (Var s) hash = ValueOf hash s

evalExpr (Add e1 e2) hash = do
    r1 <- evalExpr e1 hash
    r2 <- evalExpr e2 hash
    return $ r1 + r2

evalExpr (Enclose e) hash = do
    r <- evalExpr e hash
    return r

--- BExpr  / use the same function => 0/1?     
--- TODO Maybe
--- 2 FUNCTIONS

evalExpr (And b1 b2) hash = do
	r1 <- evalExpr b1 hash
	r2 <- evalExpr b2 hash
	return $ it (r1 && r2) then 1 else 0


-- evaluate stmt
-- REturn new hash ???
evalStmt :: Stmt -> hash -> MAYBE hash

evalStmt (Assign var expr) hash = do
    res <- evalExpr expr hash
    return $ (var, res):hash


evalStmt (Seq s1 s2) hash = do
    c1 <- evalStmt p1 hash
    c2 <- evalStmt p2 c2
return $ c2