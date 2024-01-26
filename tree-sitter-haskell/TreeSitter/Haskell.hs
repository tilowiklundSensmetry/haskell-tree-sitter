module TreeSitter.Haskell
( haskell
) where

import TreeSitter.Internal.Types
import TreeSitter.Raw.Haskell

haskell :: Language
haskell = Language tree_sitter_haskell