# [Petunjuk Penyelesaian Project](https://academy.dqlab.id/main/projectcode/16/109/516)


library(arules)

transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv", 
                                       format="single", sep="\t", cols=c(1,2), skip=1)
write(transaksi_tabular, file="test_project_retail_1.txt", sep=",")


# [Output Awal: Statistik Top 10](https://academy.dqlab.id/main/projectcode/16/109/517)


library(arules)

data <- read.transactions(file = "transaksi_dqlab_retail.tsv", 
                          format = "single", sep = "\t", cols = c(1,2), skip = 1)
top_10 <- sort(itemFrequency(data, type="absolute"), decreasing = TRUE)[1:10]
hasil <- data.frame("Nama Produk" = names(top_10), "Jumlah" = top_10, row.names = NULL)
write.csv(hasil, file="top_10.txt")


# [Output Awal: Statistik Bottom 10](https://academy.dqlab.id/main/projectcode/16/109/518)


library(arules)

data <- read.transactions(file = "transaksi_dqlab_retail.tsv", 
                          format = "single", sep = "\t", cols = c(1,2), skip = 1)
bottom_10 <- sort(itemFrequency(data, type = "absolute"), decreasing = FALSE)[1:10]
hasil <- data.frame("Nama Produk" = names(bottom_10), "Jumlah" = bottom_10, row.names = NULL)
write.csv(hasil, file="bottom10_item_retail.txt")


# [Mendapatkan Kombinasi Produk yang menarik](https://academy.dqlab.id/main/projectcode/16/109/519)


library(arules)

nama_file <- "transaksi_dqlab_retail.tsv"
transaksi_tabular <- read.transactions(file=nama_file, format="single", sep="\t", cols=c(1,2), skip=1)
apriori_rules <- apriori(transaksi_tabular, 
                         parameter=list(supp=10/length(transaksi_tabular), conf=0.5, minlen=2, maxlen=3))

Apriori

Parameter specification:
 confidence minval smax arem  aval originalSupport maxtime     support minlen
        0.1    0.1    1 none FALSE            TRUE       5 0.002898551      2
 maxlen target   ext
      3  rules FALSE

Algorithmic control:
 filter tree heap memopt load sort verbose
    0.1 TRUE TRUE  FALSE TRUE    2    TRUE

Absolute minimum support count: 10 

set item appearances ...[0 item(s)] done [0.00s].
set transactions ...[69 item(s), 3450 transaction(s)] done [0.00s].
sorting and recoding items ... [68 item(s)] done [0.00s].
creating transaction tree ... done [0.00s].
checking subsets of size 1 2 3 done [0.01s].
writing ... [39832 rule(s)] done [0.01s].
creating S4 object  ... done [0.01s].

apriori_rules <- head(sort(apriori_rules, by='lift', decreasing = T),n=10)
inspect(apriori_rules)

 lhs                             rhs                              support confidence    coverage     lift count
[1]  {Tas Makeup,                                                                                                  
      Tas Pinggang Wanita}        => {Baju Renang Anak Perempuan} 0.010434783  0.8780488 0.011884058 24.42958    36
[2]  {Tas Makeup,                                                                                                  
      Tas Travel}                 => {Baju Renang Anak Perempuan} 0.010144928  0.8139535 0.012463768 22.64629    35
[3]  {Tas Makeup,                                                                                                  
      Tas Ransel Mini}            => {Baju Renang Anak Perempuan} 0.011304348  0.7358491 0.015362319 20.47322    39
[4]  {Sunblock Cream,                                                                                              
      Tas Pinggang Wanita}        => {Kuas Makeup }               0.016231884  0.6913580 0.023478261 20.21343    56
[5]  {Baju Renang Anak Perempuan,                                                                                  
      Tas Pinggang Wanita}        => {Tas Makeup}                 0.010434783  0.8000000 0.013043478 19.57447    36
[6]  {Baju Renang Anak Perempuan,                                                                                  
      Tas Ransel Mini}            => {Tas Makeup}                 0.011304348  0.7959184 0.014202899 19.47460    39
[7]  {Baju Renang Anak Perempuan,                                                                                  
      Celana Pendek Green/Hijau}  => {Tas Makeup}                 0.010144928  0.7777778 0.013043478 19.03073    35
[8]  {Tas Makeup,                                                                                                  
      Tas Waist Bag}              => {Baju Renang Anak Perempuan} 0.004347826  0.6818182 0.006376812 18.96994    15
[9]  {Celana Pendek Green/Hijau,                                                                                   
      Tas Makeup}                 => {Baju Renang Anak Perempuan} 0.010144928  0.6730769 0.015072464 18.72674    35
[10] {Dompet Flip Cover,                                                                                           
      Sunblock Cream}             => {Kuas Makeup }               0.016231884  0.6292135 0.025797101 18.39650    56
      
write(apriori_rules, file="kombinasi_retail.txt")


# [Mencari Paket Produk yang bisa dipasangkan dengan Item Slow-Moving](https://academy.dqlab.id/main/projectcode/16/109/520)


library(arules)

nama_file <- "transaksi_dqlab_retail.tsv"
transaksi_tabular <- read.transactions(file=nama_file, format="single", sep="\t", cols=c(1,2), skip=1)
jumlah_transaksi<-length(transaksi_tabular)
jumlah_kemunculan_minimal <- 10
apriori_rules <- apriori(
  transaksi_tabular,
  parameter= list(supp=jumlah_kemunculan_minimal/jumlah_transaksi,
                  conf=0.1, minlen=2, maxlen=3))

Apriori

Parameter specification:
 confidence minval smax arem  aval originalSupport maxtime     support minlen
        0.1    0.1    1 none FALSE            TRUE       5 0.002898551      2
 maxlen target  ext
      3  rules TRUE

Algorithmic control:
 filter tree heap memopt load sort verbose
    0.1 TRUE TRUE  FALSE TRUE    2    TRUE

Absolute minimum support count: 10 

set item appearances ...[0 item(s)] done [0.00s].
set transactions ...[69 item(s), 3450 transaction(s)] done [0.00s].
sorting and recoding items ... [68 item(s)] done [0.00s].
creating transaction tree ... done [0.00s].
checking subsets of size 1 2 3 done [0.00s].
writing ... [39832 rule(s)] done [0.00s].
creating S4 object  ... done [0.01s].

# Filter
apriori_rules1 <- subset(apriori_rules, lift > 1 & rhs %in% "Tas Makeup")
apriori_rules1 <- sort(apriori_rules1, by='lift', decreasing = T)[1:3]
apriori_rules2 <- subset(apriori_rules, lift > 1 & rhs %in% "Baju Renang Pria Anak-anak")
apriori_rules2 <- sort(apriori_rules2, by='lift', decreasing = T)[1:3]
apriori_rules <- c(apriori_rules1, apriori_rules2)
inspect(apriori_rules)

 lhs                             rhs                              support confidence   coverage     lift count
[1] {Baju Renang Anak Perempuan,                                                                                 
     Tas Pinggang Wanita}        => {Tas Makeup}                 0.010434783  0.8000000 0.01304348 19.57447    36
[2] {Baju Renang Anak Perempuan,                                                                                 
     Tas Ransel Mini}            => {Tas Makeup}                 0.011304348  0.7959184 0.01420290 19.47460    39
[3] {Baju Renang Anak Perempuan,                                                                                 
     Celana Pendek Green/Hijau}  => {Tas Makeup}                 0.010144928  0.7777778 0.01304348 19.03073    35
[4] {Gembok Koper,                                                                                               
     Tas Waist Bag}              => {Baju Renang Pria Anak-anak} 0.004057971  0.2745098 0.01478261 29.59559    14
[5] {Flat Shoes Ballerina,                                                                                       
     Gembok Koper}               => {Baju Renang Pria Anak-anak} 0.004057971  0.1866667 0.02173913 20.12500    14
[6] {Celana Jeans Sobek Wanita,                                                                                  
     Jeans Jumbo}                => {Baju Renang Pria Anak-anak} 0.005507246  0.1210191 0.04550725 13.04737    19
     
write(apriori_rules,file="kombinasi_retail_slow_moving.txt")
