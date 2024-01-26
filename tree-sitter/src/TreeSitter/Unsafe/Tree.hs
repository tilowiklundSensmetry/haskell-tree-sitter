module TreeSitter.Unsafe.Tree (
  liftUnaryTreeCursorFunction
, liftUnaryTreeFunction
, liftUnaryPointFunction
, liftUnaryNodeFunction
, cursorGotoFirstChildForByte
, cursorGotoFirstChild
, cursorGotoNextSibling
, cursorGotoParent
, cursorGotoFirstChildForPoint
, cursorReset
, rootNodeWithOffset
, cursorCurrentField
, cursorCurrentNode
, rootNode
, cursorNew
) where

import Foreign

import TreeSitter.Internal.Types

import TreeSitter.Raw.Allocation
import TreeSitter.Raw.Types
import TreeSitter.Raw.Tree

{- cursorDelete :: TreeCursor -> IO ()
cursorDelete = _f ts_tree_cursor_delete_and_free -}

liftUnaryTreeCursorFunction :: (Ptr TSTreeCursor -> IO a) -> TreeCursor -> IO a
liftUnaryTreeCursorFunction f (TreeCursor cursorForeignPtr) =
    withForeignPtr cursorForeignPtr f

liftUnaryTreeFunction :: (Ptr TSTree -> IO a) -> Tree -> IO a
liftUnaryTreeFunction f (Tree treeForeignPtr) =
    withForeignPtr treeForeignPtr f

liftUnaryPointFunction :: (Ptr TSPoint -> IO a) -> Point -> IO a
liftUnaryPointFunction f (Point pointForeignPtr) =
    withForeignPtr pointForeignPtr f

liftUnaryNodeFunction :: (Ptr TSNode -> IO a) -> Node -> IO a
liftUnaryNodeFunction f (Node nodeForeignPtr) =
    withForeignPtr nodeForeignPtr f

cursorGotoFirstChildForByte :: Word32 -> TreeCursor -> IO Int64
cursorGotoFirstChildForByte x =
    liftUnaryTreeCursorFunction (\cursorPtr -> ts_tree_cursor_goto_first_child_for_byte cursorPtr x)

cursorGotoFirstChild :: TreeCursor -> IO Bool
cursorGotoFirstChild = liftUnaryTreeCursorFunction ts_tree_cursor_goto_first_child

cursorGotoNextSibling :: TreeCursor -> IO Bool
cursorGotoNextSibling = liftUnaryTreeCursorFunction ts_tree_cursor_goto_next_sibling

cursorGotoParent :: TreeCursor -> IO Bool
cursorGotoParent = liftUnaryTreeCursorFunction ts_tree_cursor_goto_parent

{- delete :: Tree -> IO ()
delete = _f ts_tree_delete -}

{- edit :: Tree -> InputEdit -> IO ()
edit = _f ts_tree_edit -}

{- printDotGraph :: Tree -> Int -> IO ()
printDotGraph = _f ts_tree_print_dot_graph -}

cursorGotoFirstChildForPoint :: {- Call by value -} Point -> TreeCursor -> IO Int64
cursorGotoFirstChildForPoint point cursor = 
    flip liftUnaryPointFunction point $ \pointPtr -> 
        flip liftUnaryTreeCursorFunction cursor $ \cursorPtr ->
            ts_tree_cursor_goto_first_child_for_point_p cursorPtr pointPtr

cursorReset :: {- Call by value -} Node -> TreeCursor -> IO ()
cursorReset node cursor = 
    flip liftUnaryNodeFunction node $ \nodePtr ->
        flip liftUnaryTreeCursorFunction cursor $ \cursorPtr ->
            ts_tree_cursor_reset_p cursorPtr nodePtr

cursorNew :: {- Call by value -} Node -> IO TreeCursor
cursorNew node = do 
    cursorPtr <- malloc_tree_cursor
    _ <- liftUnaryNodeFunction (\nodePtr -> ts_tree_cursor_new_pr nodePtr cursorPtr) node
    TreeCursor <$> newForeignPtr p_ts_tree_cursor_delete_and_free cursorPtr

{- cursorCopy :: TreeCursor -> IO TreeCursor
cursorCopy = _f ts_tree_cursor_copy_pr -}

rootNodeWithOffset :: Tree -> Word32 -> {- Call by value -} Point -> IO Node
rootNodeWithOffset tree x point = do
    nodePtr <- malloc_node
    _ <- flip liftUnaryTreeFunction tree $ \treePtr ->
        flip liftUnaryPointFunction point $ \pointPtr ->
            ts_tree_root_node_with_offset_pr treePtr x pointPtr nodePtr
    Node <$> newForeignPtr p_ts_free nodePtr

cursorCurrentField :: TreeCursor -> IO Field
cursorCurrentField cursor = FieldId <$> liftUnaryTreeCursorFunction ts_tree_cursor_current_field_id cursor

cursorCurrentNode :: TreeCursor -> IO Node
cursorCurrentNode cursor = do
    nodePtr <- malloc_node
    _ <- liftUnaryTreeCursorFunction (\cursorPtr -> ts_tree_cursor_current_node_r cursorPtr nodePtr) cursor
    Node <$> newForeignPtr p_ts_free nodePtr

rootNode :: Tree -> IO Node
rootNode tree = do
    nodePtr <- malloc_node
    _ <- liftUnaryTreeFunction (\treePtr -> ts_tree_root_node_pr treePtr nodePtr) tree
    Node <$> newForeignPtr p_ts_free nodePtr
