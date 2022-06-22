*&---------------------------------------------------------------------*
*& Include          ZR_07_ADR_UPDATE_FRM
*&---------------------------------------------------------------------*
FORM update_we_address_region USING p_region.

*  FIELD-SYMBOLS: <fs_badr> LIKE xvbadr,
*                 <fs_vbpa> LIKE xvbpa.
*
*  DATA: ls_addr1_sel   TYPE ADDR1_SEL,
*        ls_addr1_value TYPE ADDR1_VAL,
*        ls_addr1_data  TYPE ADDR1_DATA,
*  data:  lt_return      TYPE TABLE OF ADDR_ERROR,
*        lv_return_code TYPE AD_RETCODE.

*  LOOP AT xvbpa[] ASSIGNING <fs_vbpa> WHERE parvw = 'WE'.
*    READ TABLE xvbadr[] ASSIGNING <fs_badr> WITH KEY adrnr = <fs_vbpa>-adrnr.
*    IF sy-subrc eq 0.

*   clear: ls_addr1_sel, ls_addr1_value, ls_addr1_data, lv_return_code.

   ls_addr1_sel-addrnumber  =  p_addnum.
*   ls_addr1_sel-nation      =  <fs_badr>-land1.

   CALL FUNCTION 'ADDR_GET'
     EXPORTING
       address_selection = ls_addr1_sel

     importing
       address_value     = ls_addr1_value
     EXCEPTIONS
       parameter_error   = 1
       address_not_exist = 2
       version_not_exist = 3
       internal_error    = 4
       OTHERS            = 5.

   IF sy-subrc EQ 0.
        MOVE-CORRESPONDING ls_addr1_value TO ls_addr1_data.
        ls_addr1_data-region = p_region.
        ls_addr1_data-POST_CODE1 = p_postal.
        REFRESH lt_return.
        CALL FUNCTION 'ADDR_UPDATE'
          EXPORTING
            address_data              = ls_addr1_data
            address_number            = ls_addr1_value-addrnumber
            nation                    = ls_addr1_value-nation
            check_empty_address       = ' '
            check_address             = ' '
          IMPORTING
            returncode                = lv_return_code
          TABLES
            error_table               = lt_return
          EXCEPTIONS
            address_not_exist         = 1
            parameter_error           = 2
            version_not_exist         = 3
            internal_error            = 4
            OTHERS                    = 5.
        IF sy-subrc EQ 0 AND lv_return_code NE 'E'.
          CALL FUNCTION 'ADDR_MEMORY_SAVE'
            EXCEPTIONS
              address_number_missing       = 1
              person_number_missing        = 2
              internal_error               = 3
              database_error               = 4
              reference_missing            = 5
            OTHERS                         = 6.
          IF sy-subrc EQ 0.
            MESSAGE : 'saved successfully' type 'I'.
            CALL FUNCTION 'ADDR_MEMORY_CLEAR'
             EXCEPTIONS
               unsaved_data_exist       = 1
               internal_error           = 2
               OTHERS                   = 3.
            IF sy-subrc <> 0.
            ENDIF.
          ENDIF.
        ENDIF.
     ENDIF.


*  ENDLOOP.






ENDFORM.
