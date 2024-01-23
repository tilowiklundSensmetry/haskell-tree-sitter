module TreeSitter.Unsafe.Tree () where

{- import TreeSitter.Raw.Tree
import TreeSitter.Internal.Tree

import TreeSitter.Internal.Node
 -}
-- import Foreign.ForeignPtr

{- rootNode :: Tree -> IO Node
rootNode (Tree treeForeignPtr) = do
    n@(Node nodeForeignPtr) <- newNode
    withForeignPtr nodeForeignPtr $ \nodePtr -> 
        withForeignPtr treeForeignPtr $ \treePtr ->
            ts_tree_root_node_pr treePtr nodePtr
    return n -}