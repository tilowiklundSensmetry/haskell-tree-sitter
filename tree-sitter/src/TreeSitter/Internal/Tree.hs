module TreeSitter.Internal.Tree (Tree(..)) where

import Foreign.ForeignPtr
import TreeSitter.Raw.Tree

newtype Tree = Tree (ForeignPtr TSTree)
