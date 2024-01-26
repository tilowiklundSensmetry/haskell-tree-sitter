module TreeSitter.Raw.Tree
( TSTree
, TSInputEdit
--, withRootNode
, ts_tree_delete
, p_ts_tree_delete
, ts_tree_cursor_delete_and_free
, ts_tree_cursor_goto_first_child_for_byte
, ts_tree_cursor_goto_first_child
, ts_tree_cursor_goto_next_sibling
, ts_tree_cursor_goto_parent
, ts_tree_edit
, ts_tree_print_dot_graph
, ts_tree_cursor_goto_first_child_for_point_p
, ts_tree_cursor_reset_p
, ts_tree_cursor_new_pr
, ts_tree_root_node_with_offset_pr
, ts_tree_cursor_copy_pr
, ts_tree_cursor_current_field_id
, ts_tree_cursor_current_node_r
, ts_tree_root_node_pr
, p_ts_tree_cursor_delete_and_free
) where

import Foreign
import TreeSitter.Raw.Node

import TreeSitter.Raw.Types

-- Plain

foreign import ccall safe "ts_tree_cursor_delete_and_free" ts_tree_cursor_delete_and_free :: Ptr TSTreeCursor -> IO ()
foreign import ccall safe "ts_tree_cursor_goto_first_child_for_byte" ts_tree_cursor_goto_first_child_for_byte :: Ptr TSTreeCursor -> Word32 -> IO Int64
foreign import ccall safe "ts_tree_cursor_goto_first_child" ts_tree_cursor_goto_first_child :: Ptr TSTreeCursor -> IO Bool
foreign import ccall safe "ts_tree_cursor_goto_next_sibling" ts_tree_cursor_goto_next_sibling :: Ptr TSTreeCursor -> IO Bool
foreign import ccall safe "ts_tree_cursor_goto_parent" ts_tree_cursor_goto_parent :: Ptr TSTreeCursor -> IO Bool
foreign import ccall safe "ts_tree_delete" ts_tree_delete :: Ptr TSTree -> IO ()
foreign import ccall safe "ts_tree_edit" ts_tree_edit :: Ptr TSTree -> Ptr TSInputEdit -> IO ()
foreign import ccall safe "ts_tree_print_dot_graph" ts_tree_print_dot_graph :: Ptr TSTree -> Int -> IO ()
foreign import ccall safe "ts_tree_cursor_current_field_id" ts_tree_cursor_current_field_id :: Ptr TSTreeCursor -> IO TSFieldId

-- Call by value wrap

foreign import ccall safe "ts_tree_cursor_goto_first_child_for_point_p" ts_tree_cursor_goto_first_child_for_point_p :: Ptr TSTreeCursor -> {- Call by value -} Ptr TSPoint -> IO Int64
foreign import ccall safe "ts_tree_cursor_reset_p" ts_tree_cursor_reset_p :: Ptr TSTreeCursor -> {- Call by value -} Ptr TSNode -> IO ()

-- Both call by value and return by value

foreign import ccall safe "ts_tree_cursor_new_pr" ts_tree_cursor_new_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSTreeCursor -> IO ()
foreign import ccall safe "ts_tree_root_node_with_offset_pr" ts_tree_root_node_with_offset_pr :: Ptr TSTree -> Word32 -> {- Call by value -} Ptr TSPoint -> {- Out -} Ptr TSNode -> IO ()

-- Return by value wrap

foreign import ccall safe "ts_tree_cursor_copy_pr" ts_tree_cursor_copy_pr :: Ptr TSTreeCursor -> {- Out -} Ptr TSTreeCursor -> IO ()
foreign import ccall safe "ts_tree_cursor_current_node_r" ts_tree_cursor_current_node_r :: Ptr TSTreeCursor -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_tree_root_node_pr" ts_tree_root_node_pr :: Ptr TSTree -> {- Out -} Ptr TSNode -> IO ()

-- Function pointers

foreign import ccall safe "&ts_tree_cursor_delete_and_free" p_ts_tree_cursor_delete_and_free :: FunPtr (Ptr TSTreeCursor -> IO ())
foreign import ccall safe "&ts_tree_delete" p_ts_tree_delete :: FunPtr (Ptr TSTree -> IO ())
