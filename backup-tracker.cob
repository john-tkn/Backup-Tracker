       IDENTIFICATION DIVISION.
       PROGRAM-ID. BACKUP-TRACKER.
       AUTHOR. JOHN CHIRPICH.
       DATE-WRITTEN. OCTOBER 1ST, 2024.
       ENVIRONMENT DIVISION.
            CONFIGURATION SECTION.
            SPECIAL-NAMES.
             class function-keys is 3, 9.
             crt status is key-status.
             source-computer. x86.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT DB-DAT ASSIGN TO 'DB.dat'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS FD-ASSET-NUM.

      *    SELECT print-file ASSIGN TO 'reports.txt'.

       DATA DIVISION.
       FILE SECTION.
       FD DB-DAT.
       01 FD-BACKUP-STRUCT.
           88 EOF VALUE HIGH-VALUE.
           02 FD-ASSET-NUM PIC 9(6).
           02 FD-DATE-CREATED PIC 9(8).
           02 FD-DATE-FROM PIC 9(8).
           02 FD-DATE-TO PIC 9(8).
           02 FD-MEDIUM PIC X(10).
           02 FD-MEDIUM-SERIAL PIC X(50).
           02 FD-LOCATION PIC X(20).
           02 FD-BACKUP-CONTENTS PIC X(200).
           
      *FD print-file REPORT IS TXT-REPORT.
       
       WORKING-STORAGE SECTION.
       01 WS-MENU-SEL PIC 9.
       01 WS-BACKUP-STRUCT.
           02 WS-ASSET-NUM PIC 9(6).
           02 WS-DATE-CREATED PIC 9(8).
           02 WS-DATE-FROM PIC 9(8).
           02 WS-DATE-TO PIC 9(8).
           02 WS-MEDIUM PIC X(10).
           02 WS-MEDIUM-SERIAL PIC X(50).
           02 WS-LOCATION PIC X(20).
           02 WS-BACKUP-CONTENTS PIC X(200).

       01 key-status PIC 9(4).
       01 WS-TERM-MSG PIC X(80).    
       01 WS-TERM-INST PIC X(80).
       SCREEN SECTION.
       01 CLEAR-SCREEN.
           05 BLANK SCREEN.
       01 MENU-SCREEN.
           05 LINE 1 COL 35 VALUE IS "MASTER MENU".
           05 LINE 6 COL 20 VALUE IS "1 - ADD BACKUP".
           05 LINE 7 COL 20 VALUE IS "2 - FILE MAINTNENCE".
           05 LINE 8 COL 20 VALUE IS "3 - REPORTS".
           05 LINE 9 COL 20 VALUE IS "4 - OPTIONS".
           05 LINE 11 COL 20 VALUE IS "9 - LOGOFF".
           05 LINE 13 COL 20 VALUE IS "SELECTION:".
           05 SELECTION UNDERLINE PIC 9 USING WS-MENU-SEL.
       01 TERM-MSG.
           05 LINE 24 COL 1 PIC X(80) USING WS-TERM-MSG.
       01 TERM-INSTUCT.
           05 LINE 23 COL 1 PIC X(80) USING WS-TERM-INST.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY MENU-SCREEN
           ACCEPT MENU-SCREEN
           display key-status.
           STOP RUN.
