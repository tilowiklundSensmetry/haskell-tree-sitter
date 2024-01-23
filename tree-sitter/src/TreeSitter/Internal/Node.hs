module TreeSitter.Internal.Node (Node(..)) where

import TreeSitter.Raw.Allocation
import TreeSitter.Raw.Node
import Foreign.ForeignPtr
-- import Foreign.C

newtype Node = Node (ForeignPtr TSNode)
{- 
newNode :: IO Node
newNode = do
    nodePtr <- malloc_node
    Node <$> newForeignPtr p_ts_free nodePtr -}