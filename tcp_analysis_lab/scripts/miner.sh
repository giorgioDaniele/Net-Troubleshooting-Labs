#!/bin/bash

CSVS="../csvs"
DATA="../data"
IMG="../img"

# Source file (from 0 to 15)
SERVER_SIDE_CSV_015="0_15_server_side.csv"
SERVER_SIDE_SEQ_015="0_15_server_side_seq.txt"
SERVER_SIDE_SEQ_015_IMG="0_15_server_side_seq.png"
SERVER_SIDE_ACK_015="0_15_server_side_ack.txt"
SERVER_SIDE_ACK_015_IMG="0_15_server_side_ack.png"

# Source file (from 15 to 30)
SERVER_SIDE_CSV_1530="15_30_server_side.csv"
SERVER_SIDE_SEQ_1530="15_30_server_side_seq.txt"
SERVER_SIDE_SEQ_1530_IMG="15_30_server_side_seq.png"

# Source file (from 15 to 30, only first connection)
SERVER_SIDE_CSV_1530_FST="15_30_server_side_fst_conn.csv"
SERVER_SIDE_ACK_1530_FST="15_30_server_side_ack_fst_conn.txt"
SERVER_SIDE_ACK_1530_FST_IMG="15_30_server_side_ack_fst_conn.png"

# Source file (from 15 to 30, only second connection)
SERVER_SIDE_CSV_1530_SND="15_30_server_side_snd_conn.csv"
SERVER_SIDE_ACK_1530_SND="15_30_server_side_ack_snd_conn.txt"
SERVER_SIDE_ACK_1530_SND_IMG="15_30_server_side_ack_snd_conn.png"

# Source file (from 15 to 30)
SERVER_SIDE_CSV_30inf="30_inf_server_side.csv"
SERVER_SIDE_SEQ_30inf="30_inf_server_side_seq.txt"
SERVER_SIDE_SEQ_30inf_IMG="30_inf_server_side_seq.png"

# Source file (from 15 to 30, only first connection)
SERVER_SIDE_CSV_30inf_FST="30_inf_server_side_fst_conn.csv"
SERVER_SIDE_ACK_30inf_FST="30_inf_server_side_ack_fst_conn.txt"
SERVER_SIDE_ACK_30inf_FST_IMG="30_inf_server_side_ack_fst_conn.png"

# Source file (from 15 to 30, only second connection)
SERVER_SIDE_CSV_30inf_SND="30_inf_server_side_snd_conn.csv"
SERVER_SIDE_ACK_30inf_SND="30_inf_server_side_ack_snd_conn.txt"
SERVER_SIDE_ACK_30inf_SND_IMG="30_inf_server_side_ack_snd_conn.png"

SERVER_SIDE_CSV_SIZES_FST="server_sizes_fst_conn.csv"
SERVER_SIDE_WIN_FST="server_win_fst_conn.txt"
SERVER_SIDE_PKT_FST="server_pkt_fst_conn.txt"
SERVER_SIDE_SIZES_IMG_FST="server_sizes_fst_conn.png"

SERVER_SIDE_CSV_SIZES_SND="server_sizes_snd_conn.csv"
SERVER_SIDE_WIN_SND="server_win_snd_conn.txt"
SERVER_SIDE_PKT_SND="server_pkt_snd_conn.txt"
SERVER_SIDE_SIZES_IMG_SND="server_sizes_snd_conn.png"

CLIENT_SIDE_CSV_SIZES_FST="client_sizes_fst_conn.csv"
CLIENT_SIDE_WIN_FST="client_win_fst_conn.txt"
CLIENT_SIDE_PKT_FST="client_pkt_fst_conn.txt"
CLIENT_SIDE_SIZES_IMG_FST="client_sizes_fst_conn.png"

CLIENT_SIDE_CSV_SIZES_SND="client_sizes_snd_conn.csv"
CLIENT_SIDE_WIN_SND="client_win_snd_conn.txt"
CLIENT_SIDE_PKT_SND="client_pkt_snd_conn.txt"
CLIENT_SIDE_SIZES_IMG_SND="client_sizes_snd_conn.png"

CLIENT_SIDE_CSV="client_side.csv"
CLIENT_SIDE_SEQ="client_side_seq.txt"
CLIENT_SIDE_ACK="client_side_ack.txt"
CLIENT_SIDE_SEQ_IMG="client_side_seq.png"
CLIENT_SIDE_ACK_IMG="client_side_ack.png"

echo "##########################################"


#######################################################
#           SEQ NUMBERS AND ACK NUMBER ANALYSIS
#######################################################

#######################################################
#                    0 - 15 (SERVER)
#######################################################
echo "Extracting 'Seq Numbers against Time', from instant 0 to 15"
cat "$CSVS/$SERVER_SIDE_CSV_015" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_SEQ_015"

echo "Extracting 'Ack Numbers against Time', from instant 0 to 15"
cat "$CSVS/$SERVER_SIDE_CSV_015" | tail -n +2 | cut -d "," -f1,4 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_ACK_015"

gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_SEQ_015_IMG'; \
set title 'Server Sequence Number (from 0s to 15s)';\
set xlabel 'time [s]'; \
set ylabel 'seq num'; \
set grid;\
plot '$DATA/$SERVER_SIDE_SEQ_015' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_ACK_015_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Server Acknowledgment Number (from 0s to 15s)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_ACK_015' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
#######################################################
#######################################################

                                                                                                                                      
#######################################################
#                    15 - 30 (SERVER)
#######################################################

echo "Extracting 'Seq Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_1530" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_SEQ_1530"

echo "Extracting 'Ack Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_1530_FST" | tail -n +2 | cut -d "," -f1,4 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_ACK_1530_FST"

echo "Extracting 'Ack Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_1530_SND" | tail -n +2 | cut -d "," -f1,4 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_ACK_1530_SND"

gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_SEQ_1530_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'seq num'; \
set title 'Server Sequence Number on parallel connections (from 15s to 30s)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_SEQ_1530' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"

gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_ACK_1530_FST_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Server Acknowledgment Number on first connection (from 15s to 30s)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_ACK_1530_FST' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_ACK_1530_SND_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Server Acknowledgment Number on second connection (from 15s to 30s)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_ACK_1530_SND' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
#######################################################
#######################################################



                                                                                                                                                                            
#######################################################
#                  30 - inf (SERVER)
#######################################################

echo "Extracting 'Seq Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_30inf" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_SEQ_30inf"

echo "Extracting 'Ack Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_30inf_FST" | tail -n +2 | cut -d "," -f1,4 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_ACK_30inf_FST"

echo "Extracting 'Ack Numbers against Time', from instant 15 to 30"
cat "$CSVS/$SERVER_SIDE_CSV_30inf_SND" | tail -n +2 | cut -d "," -f1,4 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_ACK_30inf_SND"


 gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_SEQ_30inf_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'seq num'; \
set title 'Server Sequence Number on parallel connections (from 30s onward)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_SEQ_30inf' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_ACK_30inf_FST_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Server Acknowledgment Number on first connection (from 30s onward)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_ACK_30inf_FST' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"
gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_ACK_30inf_SND_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Server Acknowledgment Number on second connection (from 30s onward)'; \
set grid;\
plot '$DATA/$SERVER_SIDE_ACK_30inf_SND' using 1:2 with points title ''\
lc rgb 'red' lt 1 \
"

#######################################################
#######################################################

#######################################################
#                       CLIENT
#######################################################

echo "Extracting 'Seq Numbers against Time', from instant 0 to 15"
cat "$CSVS/$CLIENT_SIDE_CSV" | tail -n +2 | cut -d "," -f1,2 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_SEQ"

echo "Extracting 'Ack Numbers against Time', from instant 0 to 15"
cat "$CSVS/$CLIENT_SIDE_CSV" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_ACK"

 gnuplot -e "\
set term png; \
set output '$IMG/$CLIENT_SIDE_SEQ_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'seq num'; \
set title 'Client Sequence Number'; \
set grid;\
plot '$DATA/$CLIENT_SIDE_SEQ' using 1:2 with points title ''\
lc rgb 'green' lt 1 \
"
gnuplot -e "\
set term png; \
set output '$IMG/$CLIENT_SIDE_ACK_IMG'; \
set xlabel 'time [s]'; \
set ylabel 'ack num'; \
set title 'Client Acknowledgment Number'; \
set grid;\
plot '$DATA/$CLIENT_SIDE_ACK' using 1:2 with points title ''\
lc rgb 'magenta' lt 1 \
"


#######################################################
#######################################################


#######################################################
#           WINDOW AND PACKET SIZE ANALYSIS
#######################################################

#######################################################
#                       SERVER
#######################################################

echo "Extracting 'Window Size against Time'"
cat "$CSVS/$SERVER_SIDE_CSV_SIZES_FST" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_WIN_FST"
echo "Extracting 'Packet Size against Time'"
cat "$CSVS/$SERVER_SIDE_CSV_SIZES_FST" | tail -n +2 | cut -d "," -f1,2 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_PKT_FST"


gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_SIZES_IMG_FST'; \
set title 'Server Paket Size and Window Size'; \
set logscale y 2;\
set xlabel 'time [s]'; \
set ylabel 'bytes'; \
set grid;\
plot \
    '$DATA/$SERVER_SIDE_WIN_FST' with points title 'Win Size' lc rgb 'violet' lt 1, \
    '$DATA/$SERVER_SIDE_PKT_FST' with dots title 'Pkt size' lc rgb 'orange' lt 1\
"

echo "Extracting 'Window Size against Time'"
cat "$CSVS/$SERVER_SIDE_CSV_SIZES_SND" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_WIN_SND"
echo "Extracting 'Packet Size against Time'"
cat "$CSVS/$SERVER_SIDE_CSV_SIZES_SND" | tail -n +2 | cut -d "," -f1,2 | tr -d '"' | tr ',' '\t' > "$DATA/$SERVER_SIDE_PKT_SND"


gnuplot -e "\
set term png; \
set output '$IMG/$SERVER_SIDE_SIZES_IMG_SND'; \
set title 'Server Paket Size and Window Size'; \
set logscale y 2;\
set xlabel 'time [s]'; \
set ylabel 'bytes'; \
set grid;\
plot \
    '$DATA/$SERVER_SIDE_WIN_SND' with points title 'Win Size' lc rgb 'violet' lt 1, \
    '$DATA/$SERVER_SIDE_PKT_SND' with dots title 'Pkt size' lc rgb 'orange' lt 1\
"

#######################################################
#######################################################

#######################################################
#                       CLIENT
#######################################################

echo "Extracting 'Window Size against Time'"
cat "$CSVS/$CLIENT_SIDE_CSV_SIZES_FST" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_WIN_FST"
echo "Extracting 'Packet Size against Time'"
cat "$CSVS/$CLIENT_SIDE_CSV_SIZES_FST" | tail -n +2 | cut -d "," -f1,2 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_PKT_FST"


gnuplot -e "\
set term png; \
set output '$IMG/$CLIENT_SIDE_SIZES_IMG_FST'; \
set title 'Client Paket Size and Window Size'; \
set logscale y 8;\
set xlabel 'time [s]'; \
set ylabel 'bytes'; \
set grid;\
plot \
    '$DATA/$CLIENT_SIDE_WIN_FST' with points title 'Win Size' lc rgb 'violet'  lt 1, \
    '$DATA/$CLIENT_SIDE_PKT_FST' with points title 'Pkt size' lc rgb  'orange' lt 1\
"

echo "Extracting 'Window Size against Time'"
cat "$CSVS/$CLIENT_SIDE_CSV_SIZES_SND" | tail -n +2 | cut -d "," -f1,3 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_WIN_SND"
echo "Extracting 'Packet Size against Time'"
cat "$CSVS/$CLIENT_SIDE_CSV_SIZES_SND" | tail -n +2 | cut -d "," -f1,2 | tr -d '"' | tr ',' '\t' > "$DATA/$CLIENT_SIDE_PKT_SND"


gnuplot -e "\
set term png; \
set output '$IMG/$CLIENT_SIDE_SIZES_IMG_SND'; \
set title 'Client Paket Size and Window Size'; \
set logscale y 8;\
set xlabel 'time [s]'; \
set ylabel 'bytes'; \
set grid;\
plot \
    '$DATA/$CLIENT_SIDE_WIN_SND' with points title 'Win Size' lc rgb 'violet' lt 1, \
    '$DATA/$CLIENT_SIDE_PKT_SND' with points title 'Pkt size'  lc rgb 'orange' lt 1\
"

#######################################################
#######################################################

echo "Finished"
echo "##########################################"