
void ts_language_field_id_for_name_r(TSLanguage *x, char *y, uint32_t z, TSFieldId *ret) {
    *ret = ts_language_field_id_for_name(x, y, z);
}

void ts_language_symbol_for_name_r(TSLanguage *x, char *y, uint32_t z, bool v, TSSymbol *ret) {
    *ret = ts_language_symbol_for_name(x, y, z, v);
}

void ts_parser_logger_r(TSParser *x, TSLogger *ret) {
    *ret = ts_parser_logger(x);
}

void ts_query_capture_quantifier_for_id_r(TSQuery *x, uint32_t y, uint32_t z, TSQuantifier *ret) {
    *ret = ts_query_capture_quantifier_for_id(x, y, z);
}

void ts_tree_cursor_copy_r(TSTreeCursor *x, TSTreeCursor *ret) {
    *ret = ts_tree_cursor_copy(x);
}

void ts_tree_cursor_current_field_id_r(TSTreeCursor *x, TSFieldId *ret) {
    *ret = ts_tree_cursor_current_field_id(x);
}

void ts_tree_cursor_current_node_r(TSTreeCursor *x, TSNode *ret) {
    *ret = ts_tree_cursor_current_node(x);
}

void ts_tree_root_node_r(TSTree *x, TSNode *ret) {
    *ret = ts_tree_root_node(x);
}
