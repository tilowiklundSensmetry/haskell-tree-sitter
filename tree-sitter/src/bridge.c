#include "tree_sitter/api.h"
#include "alloc.h"
#include <stdio.h>

// Call by value wrap

const char* ts_node_type_p(TSNode* node) {
  return ts_node_type(*node);
}

uint32_t ts_node_child_count_p(TSNode *x) {
    return ts_node_child_count(*x);
}

uint32_t ts_node_end_byte_p(TSNode *x) {
    return ts_node_end_byte(*x);
}

bool ts_node_eq_p(TSNode *x, TSNode *y) {
    return ts_node_eq(*x, *y);
}

bool ts_node_has_changes_p(TSNode *x) {
    return ts_node_has_changes(*x);
}

bool ts_node_has_error_p(TSNode *x) {
    return ts_node_has_error(*x);
}

bool ts_node_is_extra_p(TSNode *x) {
    return ts_node_is_extra(*x);
}

bool ts_node_is_missing_p(TSNode *x) {
    return ts_node_is_missing(*x);
}

bool ts_node_is_named_p(TSNode *x) {
    return ts_node_is_named(*x);
}

bool ts_node_is_null_p(TSNode *x) {
    return ts_node_is_null(*x);
}

uint32_t ts_node_named_child_count_p(TSNode *x) {
    return ts_node_named_child_count(*x);
}

uint32_t ts_node_start_byte_p(TSNode *x) {
    return ts_node_start_byte(*x);
}

void ts_parser_set_logger_p(TSParser *x, TSLogger *y) {
    ts_parser_set_logger(x, *y);
}

void ts_query_cursor_exec_p(TSQueryCursor *x, TSQuery *y, TSNode *z) {
    ts_query_cursor_exec(x, y, *z);
}

void ts_query_cursor_set_point_range_p(TSQueryCursor *x, TSPoint *y, TSPoint *z) {
    ts_query_cursor_set_point_range(x, *y, *z);
}

int64_t ts_tree_cursor_goto_first_child_for_point_p(TSTreeCursor *x, TSPoint *y) {
    return ts_tree_cursor_goto_first_child_for_point(x, *y);
}

void ts_tree_cursor_reset_p(TSTreeCursor *x, TSNode *y) {
    ts_tree_cursor_reset(x, *y);
}

const char* ts_node_string_p(const TSNode* node) {
  return ts_node_string(*node);
}

TSSymbol ts_node_symbol_p(TSNode *wx) {
    return ts_node_symbol(*wx);
}

// Return by value wrap

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

// Call by value and return by value

void ts_language_symbol_type_pr(TSLanguage *x, TSSymbol *wy,  TSSymbolType *ret) {
    *ret = ts_language_symbol_type(x, *wy);
}

void ts_node_child_by_field_id_pr(TSNode *wx,  TSFieldId y,  TSNode *ret) {
    *ret = ts_node_child_by_field_id(*wx, y);
}

void ts_node_child_by_field_name_pr(TSNode *wx,  char *y, uint32_t z, TSNode *ret) {
    *ret = ts_node_child_by_field_name(*wx, y, z);
}

void ts_node_child_pr(TSNode *wx,  uint32_t y, TSNode *ret) {
    *ret = ts_node_child(*wx, y);
}

void ts_node_descendant_for_byte_range_pr(TSNode *wx,  uint32_t y, uint32_t z, TSNode *ret) {
    *ret = ts_node_descendant_for_byte_range(*wx, y, z);
}

void ts_node_descendant_for_point_range_pr(TSNode *wx,  TSPoint *wy,  TSPoint *wz,  TSNode *ret) {
    *ret = ts_node_descendant_for_point_range(*wx, *wy, *wz);
}

void ts_node_end_point_pr(TSNode *wx,  TSPoint *ret) {
    *ret = ts_node_end_point(*wx);
}

void ts_node_first_child_for_byte_pr(TSNode *wx,  uint32_t y, TSNode *ret) {
    *ret = ts_node_first_child_for_byte(*wx, y);
}

void ts_node_first_named_child_for_byte_pr(TSNode *wx,  uint32_t y, TSNode *ret) {
    *ret = ts_node_first_named_child_for_byte(*wx, y);
}

void ts_node_named_child_pr(TSNode *wx,  uint32_t y, TSNode *ret) {
    *ret = ts_node_named_child(*wx, y);
}

void ts_node_named_descendant_for_byte_range_pr(TSNode *wx,  uint32_t y, uint32_t z, TSNode *ret) {
    *ret = ts_node_named_descendant_for_byte_range(*wx, y, z);
}

void ts_node_named_descendant_for_point_range_pr(TSNode *wx,  TSPoint *wy,  TSPoint *wz,  TSNode *ret) {
    *ret = ts_node_named_descendant_for_point_range(*wx, *wy, *wz);
}

void ts_node_next_named_sibling_pr(TSNode *wx,  TSNode *ret) {
    *ret = ts_node_next_named_sibling(*wx);
}

void ts_node_next_sibling_pr(TSNode *wx,  TSNode *ret) {
    *ret = ts_node_next_sibling(*wx);
}

void ts_node_parent_pr(TSNode *wx,  TSNode *ret) {
    *ret = ts_node_parent(*wx);
}

void ts_node_prev_named_sibling_pr(TSNode *wx,  TSNode *ret) {
    *ret = ts_node_prev_named_sibling(*wx);
}

void ts_node_prev_sibling_pr(TSNode *wx,  TSNode *ret) {
    *ret = ts_node_prev_sibling(*wx);
}

void ts_node_start_point_pr(TSNode *wx,  TSPoint *ret) {
    *ret = ts_node_start_point(*wx);
}

void ts_tree_cursor_new_pr(TSNode *wx,  TSTreeCursor *ret) {
    *ret = ts_tree_cursor_new(*wx);
}

void ts_tree_root_node_pr(TSTree *tree, TSNode *outNode) {
  *outNode = ts_tree_root_node(tree);
}

void ts_tree_root_node_with_offset_pr(TSTree *x, uint32_t y, TSPoint *wz,  TSNode *ret) {
    *ret = ts_tree_root_node_with_offset(x, y, *wz);
}

// Allocation functions

void* the_ts_malloc(size_t sz) {
  return ts_malloc(sz);
}

void* the_ts_calloc(size_t sz, size_t cnt) {
  return ts_calloc(sz, cnt);
}

void* the_ts_realloc(void* ptr, size_t sz) {
  return ts_realloc(ptr, sz);
}

void the_ts_free(void* ptr) {
  ts_free(ptr);
}

TSNode* malloc_node() {
  return (TSNode*)ts_malloc(sizeof(TSNode));
}

TSPoint* malloc_point() {
  return (TSPoint*)ts_malloc(sizeof(TSPoint));
}

TSRange* malloc_range() {
  return (TSRange*)ts_malloc(sizeof(TSRange));
}

TSPoint* new_point(uint32_t row, uint32_t column) {
    TSPoint* point = malloc_point();
    if(!point) return point;
    
    point->row = row;
    point->column = column;
    
    return point;
}

TSRange* new_range(TSPoint* start_point, TSPoint* end_point, uint32_t start_byte, uint32_t end_byte) {
    TSRange* range = malloc_range();
    if(!range) return range;

    range->start_point = *start_point;
    range->end_point = *end_point;
    range->start_byte = start_byte;
    range->end_byte = end_byte;
    
    return range;
}