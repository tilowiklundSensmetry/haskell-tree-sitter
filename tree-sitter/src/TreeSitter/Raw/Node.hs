module TreeSitter.Raw.Node (
  TSNode , TSFieldId
--, sizeOfTSNode
, ts_node_child_count_p
, ts_node_named_child_count_p
, ts_node_eq_p
, ts_node_has_changes_p
, ts_node_has_error_p
, ts_node_is_extra_p
, ts_node_is_missing_p
, ts_node_is_named_p
, ts_node_is_null_p
, ts_node_string_p
, ts_node_type_p
, ts_node_edit
, ts_node_end_byte_p
, ts_node_start_byte_p
, ts_node_child_by_field_id_pr
, ts_node_child_by_field_name_pr
, ts_node_child_pr
, ts_node_descendant_for_byte_range_pr
, ts_node_descendant_for_point_range_pr
, ts_node_end_point_pr
, ts_node_first_child_for_byte_pr
, ts_node_first_named_child_for_byte_pr
, ts_node_named_child_pr
, ts_node_named_descendant_for_byte_range_pr
, ts_node_named_descendant_for_point_range_pr
, ts_node_next_named_sibling_pr
, ts_node_next_sibling_pr
, ts_node_parent_pr
, ts_node_prev_named_sibling_pr
, ts_node_prev_sibling_pr
, ts_node_start_point_pr
, ts_node_symbol_pr
) where

import Foreign
import Foreign.C

import TreeSitter.Symbol

import TreeSitter.Raw.Types

--foreign import ccall safe "sizeof_tsnode" sizeof_tsnode :: Word32

--sizeOfTSNode :: Num a => a
--sizeOfTSNode = fromIntegral sizeof_tsnode

-- Plain

foreign import ccall safe "ts_node_edit" ts_node_edit :: Ptr TSNode -> Ptr TSInputEdit -> IO ()

-- Call by value wrap

foreign import ccall safe "ts_node_child_count_p" ts_node_child_count_p :: {- Call by value -} Ptr TSNode -> IO Word32
foreign import ccall safe "ts_node_end_byte_p" ts_node_end_byte_p :: {- Call by value -} Ptr TSNode -> IO Word32
foreign import ccall safe "ts_node_eq_p" ts_node_eq_p :: {- Call by value -} Ptr TSNode -> {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_has_changes_p" ts_node_has_changes_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_has_error_p" ts_node_has_error_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_is_extra_p" ts_node_is_extra_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_is_missing_p" ts_node_is_missing_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_is_named_p" ts_node_is_named_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_is_null_p" ts_node_is_null_p :: {- Call by value -} Ptr TSNode -> IO Bool
foreign import ccall safe "ts_node_named_child_count_p" ts_node_named_child_count_p :: {- Call by value -} Ptr TSNode -> IO Word32
foreign import ccall safe "ts_node_start_byte_p" ts_node_start_byte_p :: {- Call by value -} Ptr TSNode -> IO Word32
foreign import ccall safe "ts_node_string_p" ts_node_string_p :: {- Call by value -} Ptr TSNode -> IO CString
foreign import ccall safe "ts_node_type_p" ts_node_type_p     :: {- Call by value -} Ptr TSNode -> IO CString
foreign import ccall safe "ts_node_symbol_pr" ts_node_symbol_pr :: {- Call by value -} Ptr TSNode -> IO TSSymbol

-- Both call by value and return by value

foreign import ccall safe "ts_node_child_by_field_id_pr" ts_node_child_by_field_id_pr :: {- Call by value -} Ptr TSNode -> TSFieldId -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_child_by_field_name_pr" ts_node_child_by_field_name_pr :: {- Call by value -} Ptr TSNode -> CString -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_child_pr" ts_node_child_pr :: {- Call by value -} Ptr TSNode -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_descendant_for_byte_range_pr" ts_node_descendant_for_byte_range_pr :: {- Call by value -} Ptr TSNode -> Word32 -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_descendant_for_point_range_pr" ts_node_descendant_for_point_range_pr :: {- Call by value -} Ptr TSNode -> {- Call by value -} Ptr TSPoint -> {- Call by value -} Ptr TSPoint -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_end_point_pr" ts_node_end_point_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSPoint -> IO ()
foreign import ccall safe "ts_node_first_child_for_byte_pr" ts_node_first_child_for_byte_pr :: {- Call by value -} Ptr TSNode -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_first_named_child_for_byte_pr" ts_node_first_named_child_for_byte_pr :: {- Call by value -} Ptr TSNode -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_named_child_pr" ts_node_named_child_pr :: {- Call by value -} Ptr TSNode -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_named_descendant_for_byte_range_pr" ts_node_named_descendant_for_byte_range_pr :: {- Call by value -} Ptr TSNode -> Word32 -> Word32 -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_named_descendant_for_point_range_pr" ts_node_named_descendant_for_point_range_pr :: {- Call by value -} Ptr TSNode -> {- Call by value -} Ptr TSPoint -> {- Call by value -} Ptr TSPoint -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_next_named_sibling_pr" ts_node_next_named_sibling_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_next_sibling_pr" ts_node_next_sibling_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_parent_pr" ts_node_parent_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_prev_named_sibling_pr" ts_node_prev_named_sibling_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_prev_sibling_pr" ts_node_prev_sibling_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_node_start_point_pr" ts_node_start_point_pr :: {- Call by value -} Ptr TSNode -> {- Out -} Ptr TSPoint -> IO ()
