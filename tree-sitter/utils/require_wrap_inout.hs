ts_language_symbol_type :: Ptr TSLanguage -> TSSymbol -> IO TSSymbolType
ts_node_child_by_field_id :: TSNode -> TSFieldId -> IO TSNode
ts_node_child_by_field_name :: TSNode -> CString -> Word32 -> IO TSNode
ts_node_child :: TSNode -> Word32 -> IO TSNode
ts_node_descendant_for_byte_range :: TSNode -> Word32 -> Word32 -> IO TSNode
ts_node_descendant_for_point_range :: TSNode -> TSPoint -> TSPoint -> IO TSNode
ts_node_end_point :: TSNode -> IO TSPoint
ts_node_first_child_for_byte :: TSNode -> Word32 -> IO TSNode
ts_node_first_named_child_for_byte :: TSNode -> Word32 -> IO TSNode
ts_node_named_child :: TSNode -> Word32 -> IO TSNode
ts_node_named_descendant_for_byte_range :: TSNode -> Word32 -> Word32 -> IO TSNode
ts_node_named_descendant_for_point_range :: TSNode -> TSPoint -> TSPoint -> IO TSNode
ts_node_next_named_sibling :: TSNode -> IO TSNode
ts_node_next_sibling :: TSNode -> IO TSNode
ts_node_parent :: TSNode -> IO TSNode
ts_node_prev_named_sibling :: TSNode -> IO TSNode
ts_node_prev_sibling :: TSNode -> IO TSNode
ts_node_start_point :: TSNode -> IO TSPoint
ts_node_symbol :: TSNode -> IO TSSymbol
ts_tree_cursor_new :: TSNode -> IO TSTreeCursor
ts_tree_root_node_with_offset :: Ptr TSTree -> Word32 -> TSPoint -> IO TSNode
