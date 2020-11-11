module CodeGen.Asm where

import Data.Text (Text)
import Data.Word
import Data.Int

data Reg = SP | BP | AX | BX | CX | DX
  deriving (Show)

data ObjOff
  = OType
  | OSize
  | OEval
  | OBody Word64
  deriving (Show)

data Loc
  = R Reg
  | I Word64
  | L Text
  | HdrSizePlus Word64
  | Index Reg Int64
  | IndexObj Reg ObjOff
  deriving (Show)

data Instruction
  = Push Loc
  | Pop Loc
  | Mov8 Loc Loc
  | Mov4 Loc Loc
  | Add Reg Word64
  | Call Loc
  | Ret
  deriving (Show)

data AsmFunc = AsmFunc Text [Instruction]
  deriving (Show)