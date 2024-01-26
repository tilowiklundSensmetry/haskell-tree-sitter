module TreeSitter.Raw.Parser
( TSParser
--, withParser
--, withParseTree
, ts_parser_new
, ts_parser_parse_string
, ts_parser_delete
, p_ts_parser_delete
, ts_parser_set_language
, ts_parser_timeout_micros
, ts_parser_set_timeout_micros
-- , ts_parser_log_to_stderr
, ts_parser_print_dot_graphs
, ts_parser_reset
, ts_parser_set_cancellation_flag
, ts_parser_set_included_ranges
, ts_parser_set_logger_p
, ts_parser_logger_pr
) where

import Foreign
import Foreign.C
import TreeSitter.Raw.Tree
import TreeSitter.Raw.Types

foreign import ccall safe "ts_parser_new" ts_parser_new :: IO (Ptr TSParser)
foreign import ccall safe "ts_parser_parse_string" ts_parser_parse_string :: Ptr TSParser -> Ptr TSTree -> CString -> Int -> IO (Ptr TSTree)

-- foreign import ccall safe "src/bridge.c ts_parser_log_to_stderr" ts_parser_log_to_stderr :: Ptr TSParser -> IO ()

-- Plain

foreign import ccall safe "ts_parser_delete" ts_parser_delete :: Ptr TSParser -> IO ()
foreign import ccall safe "ts_parser_print_dot_graphs" ts_parser_print_dot_graphs :: Ptr TSParser -> Int -> IO ()
foreign import ccall safe "ts_parser_reset" ts_parser_reset :: Ptr TSParser -> IO ()
foreign import ccall safe "ts_parser_set_cancellation_flag" ts_parser_set_cancellation_flag :: Ptr TSParser -> Ptr CSize -> IO ()
foreign import ccall safe "ts_parser_set_included_ranges" ts_parser_set_included_ranges :: Ptr TSParser -> Ptr TSRange -> Word32 -> IO Bool
foreign import ccall safe "ts_parser_set_language" ts_parser_set_language :: Ptr TSParser -> Ptr TSLanguage -> IO Bool
foreign import ccall safe "ts_parser_set_timeout_micros" ts_parser_set_timeout_micros :: Ptr TSParser -> Word64 -> IO ()
foreign import ccall safe "ts_parser_timeout_micros" ts_parser_timeout_micros :: Ptr TSParser -> IO Word64

-- Call by value wrap

foreign import ccall safe "ts_parser_set_logger_p" ts_parser_set_logger_p :: Ptr TSParser -> {- Call by value -} Ptr TSLogger -> IO ()

-- Return by value wrap

foreign import ccall safe "ts_parser_logger_pr" ts_parser_logger_pr :: Ptr TSParser -> {- Out -} Ptr TSLogger -> IO ()

-- Function pointers

foreign import ccall safe "&ts_parser_delete" p_ts_parser_delete :: FunPtr (Ptr TSParser -> IO ())

