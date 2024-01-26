module TreeSitter.Internal.Types(
  Language(..)
, Node(..)
, Tree(..)
, Parser(..)
, Symbol(..)
, SymbolType(..)
, FieldId(..)
) where

import Foreign
import Foreign.ForeignPtr
import TreeSitter.Raw.Tree
import TreeSitter.Raw.Types
import TreeSitter.Raw.Allocation
import TreeSitter.Raw.Node
import TreeSitter.Raw.Parser

newtype Language = Language ({- Not owned by Haskell -} Ptr TSLanguage)
newtype Node = Node (ForeignPtr TSNode)
newtype Tree = Tree (ForeignPtr TSTree)
newtype Parser = Parser (ForeignPtr TSParser)

newtype Symbol = Symbol TSSymbol
newtype SymbolType = SymbolType TSSymbolType
newtype FieldId = FieldId TSFieldId