module Data where

--- Choose just Expr and Prog ?
--- Do we need BVal ? 0/1

data Var = Var String
data AExpr = Var |
             Value Number |
             Add AExpr AExpr |
             Enclose AExpr deriving (Show, Read)

data Bool = True | False

data BExpr = Bool | And BExpr BExpr | Greater AExpr AExpr

data Stmt = Assign Var AExpr |
            Block Stmt |
            If BExpr Stmt Stmt
            While BExpr Stmt |
            Seq Stmt Stmt

data VarList = Var | Comma Var, VarList

data Prog = Init VarList Stmt






