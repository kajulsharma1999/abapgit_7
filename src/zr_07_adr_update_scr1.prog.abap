*&---------------------------------------------------------------------*
*& Include          ZR_07_ADR_UPDATE_SCR
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF block b1 WITH FRAME TITLE text-001.
  PARAMETERS: p_ADDNUM type adrc-ADDRNUMBER,
              p_region type adrc-PO_BOX_REG,
              p_postal type adrc-POST_CODE1.
  SELECTION-SCREEN END OF block b1.
