ts_node_child_count :: TSNode -> IO Word32
ts_node_end_byte :: TSNode -> IO Word32
ts_node_eq :: TSNode -> TSNode -> IO Bool
ts_node_has_changes :: TSNode -> IO Bool
ts_node_has_error :: TSNode -> IO Bool
ts_node_is_extra :: TSNode -> IO Bool
ts_node_is_missing :: TSNode -> IO Bool
ts_node_is_named :: TSNode -> IO Bool
ts_node_is_null :: TSNode -> IO Bool
ts_node_named_child_count :: TSNode -> IO Word32
ts_node_start_byte :: TSNode -> IO Word32
ts_parser_set_logger :: Ptr TSParser -> TSLogger -> IO ()
ts_query_cursor_exec :: Ptr TSQueryCursor -> Ptr TSQuery -> TSNode -> IO ()
ts_query_cursor_set_point_range :: Ptr TSQueryCursor -> TSPoint -> TSPoint -> IO ()
ts_tree_cursor_goto_first_child_for_point :: Ptr TSTreeCursor -> TSPoint -> IO Int64
ts_tree_cursor_reset :: Ptr TSTreeCursor -> TSNode -> IO ()
