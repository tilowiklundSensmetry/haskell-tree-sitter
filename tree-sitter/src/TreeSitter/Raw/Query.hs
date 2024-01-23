module TreeSitter.Raw.Query (
  ts_query_capture_count
, ts_query_cursor_delete
, ts_query_cursor_did_exceed_match_limit
, ts_query_cursor_match_limit
, ts_query_cursor_next_capture
, ts_query_cursor_next_match
, ts_query_cursor_remove_match
, ts_query_cursor_set_byte_range
, ts_query_cursor_set_match_limit
, ts_query_delete
, ts_query_disable_capture
, ts_query_disable_pattern
, ts_query_is_pattern_guaranteed_at_step
, ts_query_is_pattern_non_local
, ts_query_is_pattern_rooted
, ts_query_pattern_count
, ts_query_start_byte_for_pattern
, ts_query_string_count
, ts_query_cursor_exec_p
, ts_query_cursor_set_point_range_p
, ts_query_capture_quantifier_for_id_pr
, p_ts_query_cursor_delete
, p_ts_query_delete
) where

import Foreign
import Foreign.C

import TreeSitter.Raw.Types

-- Plain

foreign import ccall safe "ts_query_capture_count" ts_query_capture_count :: Ptr TSQuery -> IO Word32
foreign import ccall safe "ts_query_cursor_delete" ts_query_cursor_delete :: Ptr TSQueryCursor -> IO ()
foreign import ccall safe "ts_query_cursor_did_exceed_match_limit" ts_query_cursor_did_exceed_match_limit :: Ptr TSQueryCursor -> IO Bool
foreign import ccall safe "ts_query_cursor_match_limit" ts_query_cursor_match_limit :: Ptr TSQueryCursor -> IO Word32
foreign import ccall safe "ts_query_cursor_next_capture" ts_query_cursor_next_capture :: Ptr TSQueryCursor -> Ptr TSQueryMatch -> Ptr Word32 -> IO Bool
foreign import ccall safe "ts_query_cursor_next_match" ts_query_cursor_next_match :: Ptr TSQueryCursor -> Ptr TSQueryMatch -> IO Bool
foreign import ccall safe "ts_query_cursor_remove_match" ts_query_cursor_remove_match :: Ptr TSQueryCursor -> Word32 -> IO ()
foreign import ccall safe "ts_query_cursor_set_byte_range" ts_query_cursor_set_byte_range :: Ptr TSQueryCursor -> Word32 -> Word32 -> IO ()
foreign import ccall safe "ts_query_cursor_set_match_limit" ts_query_cursor_set_match_limit :: Ptr TSQueryCursor -> Word32 -> IO ()
foreign import ccall safe "ts_query_delete" ts_query_delete :: Ptr TSQuery -> IO ()
foreign import ccall safe "ts_query_disable_capture" ts_query_disable_capture :: Ptr TSQuery -> CString -> Word32 -> IO ()
foreign import ccall safe "ts_query_disable_pattern" ts_query_disable_pattern :: Ptr TSQuery -> Word32 -> IO ()
foreign import ccall safe "ts_query_is_pattern_guaranteed_at_step" ts_query_is_pattern_guaranteed_at_step :: Ptr TSQuery -> Word32 -> IO Bool
foreign import ccall safe "ts_query_is_pattern_non_local" ts_query_is_pattern_non_local :: Ptr TSQuery -> Word32 -> IO Bool
foreign import ccall safe "ts_query_is_pattern_rooted" ts_query_is_pattern_rooted :: Ptr TSQuery -> Word32 -> IO Bool
foreign import ccall safe "ts_query_pattern_count" ts_query_pattern_count :: Ptr TSQuery -> IO Word32
foreign import ccall safe "ts_query_start_byte_for_pattern" ts_query_start_byte_for_pattern :: Ptr TSQuery -> Word32 -> IO Word32
foreign import ccall safe "ts_query_string_count" ts_query_string_count :: Ptr TSQuery -> IO Word32

-- Call by value wrap

foreign import ccall safe "ts_query_cursor_exec_p" ts_query_cursor_exec_p :: Ptr TSQueryCursor -> Ptr TSQuery -> {- Call by value -} Ptr TSNode -> IO ()
foreign import ccall safe "ts_query_cursor_set_point_range_p" ts_query_cursor_set_point_range_p :: Ptr TSQueryCursor -> {- Call by value -} Ptr TSPoint -> {- Call by value -} Ptr TSPoint -> IO ()

-- Return by value wrap

foreign import ccall safe "ts_query_capture_quantifier_for_id_pr" ts_query_capture_quantifier_for_id_pr :: Ptr TSQuery -> Word32 -> Word32 -> {- Out -} Ptr TSQuantifier -> IO ()

-- Function pointers

foreign import ccall safe "&ts_query_cursor_delete" p_ts_query_cursor_delete :: FunPtr (Ptr TSQueryCursor -> IO ())
foreign import ccall safe "&ts_query_delete" p_ts_query_delete :: FunPtr (Ptr TSQuery -> IO ())
