module TreeSitter.Internal.Types(
  Language(..)
, Node(..)
, Tree(..)
, Parser(..)
, Symbol(..)
, SymbolType(..)
, Field(..)
, TreeCursor(..)
, InputEdit(..)
, Point(..)
) where

import Foreign
import TreeSitter.Raw.Tree
import TreeSitter.Raw.Types

newtype Language = Language ({- Not owned by Haskell -} Ptr TSLanguage)
newtype Node = Node (ForeignPtr TSNode)
newtype Tree = Tree (ForeignPtr TSTree)
newtype Parser = Parser (ForeignPtr TSParser)

newtype Symbol = Symbol TSSymbol
newtype SymbolType = SymbolType TSSymbolType
newtype Field = FieldId TSFieldId
newtype Point = Point (ForeignPtr TSPoint)
newtype InputEdit = InputEdit (ForeignPtr TSInputEdit)

newtype TreeCursor = TreeCursor (ForeignPtr TSTreeCursor)