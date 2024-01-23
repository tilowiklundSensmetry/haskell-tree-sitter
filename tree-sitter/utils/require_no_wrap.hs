ts_language_field_count :: Ptr TSLanguage -> IO Word32
ts_language_symbol_count :: Ptr TSLanguage -> IO Word32
ts_language_version :: Ptr TSLanguage -> IO Word32
ts_node_edit :: Ptr TSNode -> Ptr TSInputEdit -> IO ()
ts_parser_delete :: Ptr TSParser -> IO ()
ts_parser_print_dot_graphs :: Ptr TSParser -> int -> IO ()
ts_parser_reset :: Ptr TSParser -> IO ()
ts_parser_set_cancellation_flag :: Ptr TSParser -> Ptr size_t -> IO ()
ts_parser_set_included_ranges :: Ptr TSParser -> Ptr TSRange -> Word32 -> IO Bool
ts_parser_set_language :: Ptr TSParser -> Ptr TSLanguage -> IO Bool
ts_parser_set_timeout_micros :: Ptr TSParser -> Word64 -> IO ()
ts_parser_timeout_micros :: Ptr TSParser -> IO Word64
ts_query_capture_count :: Ptr TSQuery -> IO Word32
ts_query_cursor_delete :: Ptr TSQueryCursor -> IO ()
ts_query_cursor_did_exceed_match_limit :: Ptr TSQueryCursor -> IO Bool
ts_query_cursor_match_limit :: Ptr TSQueryCursor -> IO Word32
ts_query_cursor_next_capture :: Ptr TSQueryCursor -> Ptr TSQueryMatch -> Ptr Word32 -> IO Bool
ts_query_cursor_next_match :: Ptr TSQueryCursor -> Ptr TSQueryMatch -> IO Bool
ts_query_cursor_remove_match :: Ptr TSQueryCursor -> Word32 -> IO ()
ts_query_cursor_set_byte_range :: Ptr TSQueryCursor -> Word32 -> Word32 -> IO ()
ts_query_cursor_set_match_limit :: Ptr TSQueryCursor -> Word32 -> IO ()
ts_query_delete :: Ptr TSQuery -> IO ()
ts_query_disable_capture :: Ptr TSQuery -> CString -> Word32 -> IO ()
ts_query_disable_pattern :: Ptr TSQuery -> Word32 -> IO ()
ts_query_is_pattern_guaranteed_at_step :: Ptr TSQuery -> Word32 -> IO Bool
ts_query_is_pattern_non_local :: Ptr TSQuery -> Word32 -> IO Bool
ts_query_is_pattern_rooted :: Ptr TSQuery -> Word32 -> IO Bool
ts_query_pattern_count :: Ptr TSQuery -> IO Word32
ts_query_start_byte_for_pattern :: Ptr TSQuery -> Word32 -> IO Word32
ts_query_string_count :: Ptr TSQuery -> IO Word32
ts_set_allocator :: ()Ptr  (Ptr  new_malloc)(size_t) -> ()Ptr  (Ptr  new_calloc)(size_t, size_t) -> ()Ptr  (Ptr  new_realloc)(()Ptr  , size_t) -> () (Ptr  new_free)(()Ptr  ) -> IO ()
ts_tree_cursor_delete :: Ptr TSTreeCursor -> IO ()
ts_tree_cursor_goto_first_child_for_byte :: Ptr TSTreeCursor -> Word32 -> IO Int64
ts_tree_cursor_goto_first_child :: Ptr TSTreeCursor -> IO Bool
ts_tree_cursor_goto_next_sibling :: Ptr TSTreeCursor -> IO Bool
ts_tree_cursor_goto_parent :: Ptr TSTreeCursor -> IO Bool
ts_tree_delete :: Ptr TSTree -> IO ()
ts_tree_edit :: Ptr TSTree -> Ptr TSInputEdit -> IO ()
ts_tree_print_dot_graph :: Ptr TSTree -> int -> IO ()
