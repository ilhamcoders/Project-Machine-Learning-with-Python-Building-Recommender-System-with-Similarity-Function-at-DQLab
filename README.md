# Project Machine Learning with Python Building Recommender System with Similarity Function at DQLab

**Introduction**

Membuat sebuah sistem rekomendasi berdasarkan konten dari sebuah film.

**Task 1 - Unloading and Checking Datasets**

Pada bagian ini akan dilakukan import library yang dibutuhkan dan pembacaan dataset yang digunakan.

**Task 2 - Cleaning and Processing Table Cast**

Membuang kolom-kolom yang tidak digunakan dan menghapus nilai NULL.

**Task 3 - Nesting primaryName group by knownForTitles**

Melakukan grouping kembali pada kolom player karena yang kita inginkan adalah level movie untuk melakukan movie recommendation.

**Task 4 - Joining with Movie Table**

Join table, cleaning data dan reformat table base_df.

**Task 5 - Creating Content-based Recommender System**

Klasifikasi metadata, membuat fungsi untuk strip spaces dari setiap row dan elemennya, membuat fungsi untuk membuat metadata soup untuk setiap judulnya, menyiapkan CountVectorizer dan fit dengan soup, membuat model similarity antara count matrix dan membuat count based recommender system.

referensi:

https://academy.dqlab.id/main/package/project/214?pf=0
