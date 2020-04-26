1. Написати R script для завантаження даних в R.
```r
> install.package("readr")
> library(readr)
> if(!file.exists("drinks.zip")) {
     download.file("https://github.com/fivethirtyeight/data/tree/master/alcohol-consumption","drinks.zip", mode = "wb")
 }
> if(!file.exists("drinks")){
     unzip("drinks.zip", files = NULL, exdir=".")
 }
> drinks <- read_csv("/cloud/project/drinks.csv")
> drinks
# A tibble: 193 x 5
   country     beer_servings spirit_servings wine_servings total_litres_of_pu…
   <chr>               <dbl>           <dbl>         <dbl>               <dbl>
 1 Afghanistan             0               0             0                 0  
 2 Albania                89             132            54                 4.9
 3 Algeria                25               0            14                 0.7
 4 Andorra               245             138           312                12.4
 5 Angola                217              57            45                 5.9
 6 Antigua & …           102             128            45                 4.9
 7 Argentina             193              25           221                 8.3
 8 Armenia                21             179            11                 3.8
 9 Australia             261              72           212                10.4
10 Austria               279              75           191                 9.7
# … with 183 more rows
```
3. Якщо необхідно, підготувати дані для аналізу.
```r
> install.packages("dplyr")
> library(dplyr)
> drinks_without_total <- drinks %>% select(-total_litres_of_pure_alcohol)
> drinks_without_total
# A tibble: 193 x 4
   country           beer_servings spirit_servings wine_servings
   <chr>                     <dbl>           <dbl>         <dbl>
 1 Afghanistan                   0               0             0
 2 Albania                      89             132            54
 3 Algeria                      25               0            14
 4 Andorra                     245             138           312
 5 Angola                      217              57            45
 6 Antigua & Barbuda           102             128            45
 7 Argentina                   193              25           221
 8 Armenia                      21             179            11
 9 Australia                   261              72           212
10 Austria                     279              75           191
# … with 183 more rows
> tidy_dataset <- drinks_without_total %>% pivot_longer(names_to = "type", values_to = "servings", cols = -country)
> tidy_dataset
# A tibble: 579 x 3
   country     type            servings
   <chr>       <chr>              <dbl>
 1 Afghanistan beer_servings          0
 2 Afghanistan spirit_servings        0
 3 Afghanistan wine_servings          0
 4 Albania     beer_servings         89
 5 Albania     spirit_servings      132
 6 Albania     wine_servings         54
 7 Algeria     beer_servings         25
 8 Algeria     spirit_servings        0
 9 Algeria     wine_servings         14
10 Andorra     beer_servings        245
# … with 569 more rows
```
4. Провести огляд даних.
```r
> head(tidy_dataset, n=3)
# A tibble: 3 x 3
  country     type            servings
  <chr>       <chr>              <dbl>
1 Afghanistan beer_servings          0
2 Afghanistan spirit_servings        0
3 Afghanistan wine_servings          0

> tail(tidy_dataset, n=3)
# A tibble: 3 x 3
  country  type            servings
  <chr>    <chr>              <dbl>
1 Zimbabwe beer_servings         64
2 Zimbabwe spirit_servings       18
3 Zimbabwe wine_servings          4

> summary(tidy_dataset)
   country              type              servings     
 Length:579         Length:579         Min.   :  0.00  
 Class :character   Class :character   1st Qu.:  4.50  
 Mode  :character   Mode  :character   Median : 36.00  
                                       Mean   : 78.87  
                                       3rd Qu.:128.50  
                                       Max.   :438.00  
> str(tidy_dataset)
tibble [579 × 3] (S3: tbl_df/tbl/data.frame)
 $ country : chr [1:579] "Afghanistan" "Afghanistan" "Afghanistan" "Albania" ...
 $ type    : chr [1:579] "beer_servings" "spirit_servings" "wine_servings" "beer_servings" ...
 $ servings: num [1:579] 0 0 0 89 132 54 25 0 14 245 ...

> quantile(tidy_dataset$servings)
   0%   25%   50%   75%  100% 
  0.0   4.5  36.0 128.5 438.0 
```