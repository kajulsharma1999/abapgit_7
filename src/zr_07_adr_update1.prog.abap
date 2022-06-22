*&---------------------------------------------------------------------*
*& Report ZR_07_ADR_UPDATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZR_07_ADR_UPDATE1.

INCLUDE ZR_07_ADR_UPDATE_TOP1.
*include ZR_07_ADR_UPDATE_top.
INCLUDE ZR_07_ADR_UPDATE_SCR1.
*include ZR_07_ADR_UPDATE_scr.
INCLUDE ZR_07_ADR_UPDATE_FRM1.
*include ZR_07_ADR_UPDATE_frm.

START-OF-SELECTION.
PERFORM update_we_address_region using p_region.
