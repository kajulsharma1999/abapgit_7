*&---------------------------------------------------------------------*
*& Include          ZR_07_ADR_UPDATE_TOP
*&---------------------------------------------------------------------*


 DATA: ls_addr1_sel   TYPE ADDR1_SEL,
        ls_addr1_value TYPE ADDR1_VAL,
        ls_addr1_data  TYPE ADDR1_DATA,
         lt_return   TYPE TABLE OF ADDR_ERROR,
        lv_return_code TYPE AD_RETCODE.
