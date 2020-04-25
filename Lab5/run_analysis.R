
> if(!file.exists("UCIdata.zip")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCIdata.zip", mode = "wb")
}
> if(!file.exists("UCI HAR Dataset")){
unzip("UCIdata.zip", files = NULL, exdir=".")
}
> subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
> subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
> x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
> x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
> y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
> y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
> activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
> features <- read.table("UCI HAR Dataset/features.txt")

1. Об’єднує навчальний та тестовий набори, щоб створити один набір даних

> dataSet <- rbind(x_train, x_test)
> dataSet

         V1          V2         V3         V4         V5         V6
1 0.2885845 -0.02029417 -0.1329051 -0.9952786 -0.9831106 -0.9135264
          V7         V8        V9        V10        V11        V12       V13
1 -0.9951121 -0.9831846 -0.923527 -0.9347238 -0.5673781 -0.7444125 0.8529474
        V14       V15        V16        V17       V18        V19        V20
1 0.6858446 0.8142628 -0.9655228 -0.9999446 -0.999863 -0.9946122 -0.9942308
         V21      V22        V23        V24        V25       V26        V27
1 -0.9876139 -0.94322 -0.4077471 -0.6793375 -0.6021219 0.9292935 -0.8530111
        V28         V29       V30        V31       V32         V33       V34
1 0.3599098 -0.05852638 0.2568915 -0.2248476 0.2641057 -0.09524563 0.2788514
         V35      V36        V37       V38       V39       V40       V41
1 -0.4650846 0.491936 -0.1908836 0.3763139 0.4351292 0.6607903 0.9633961
         V42       V43        V44        V45       V46        V47        V48
1 -0.1408397 0.1153749 -0.9852497 -0.9817084 -0.877625 -0.9850014 -0.9844162
         V49       V50        V51       V52       V53        V54        V55
1 -0.8946774 0.8920545 -0.1612655 0.1246598 0.9774363 -0.1232134 0.05648273
        V56       V57        V58        V59        V60        V61        V62
1 -0.375426 0.8994686 -0.9709052 -0.9755104 -0.9843254 -0.9888491 -0.9177426
  V63 V64       V65       V66       V67        V68       V69        V70
1  -1  -1 0.1138061 -0.590425 0.5911463 -0.5917735 0.5924693 -0.7454488
        V71        V72    V73        V74       V75        V76       V77
1 0.7208617 -0.7123724 0.7113 -0.9951116 0.9956749 -0.9956676 0.9916527
        V78       V79       V80        V81         V82         V83        V84
1 0.5702216 0.4390273 0.9869131 0.07799634 0.005000803 -0.06783081 -0.9935191
       V85       V86        V87        V88        V89        V90        V91
1 -0.98836 -0.993575 -0.9944876 -0.9862066 -0.9928183 -0.9851801 -0.9919942
         V92       V93       V94       V95       V96        V97        V98
1 -0.9931189 0.9898347 0.9919569 0.9905192 -0.993522 -0.9999349 -0.9998204
         V99      V100       V101       V102       V103       V104       V105
1 -0.9998785 -0.994364 -0.9860249 -0.9892336 -0.8199492 -0.7930464 -0.8888529
  V106      V107      V108      V109      V110        V111      V112
1    1 -0.220747 0.6368308 0.3876436 0.2414015 -0.05225285 0.2641772
       V113      V114       V115      V116       V117       V118       V119
1 0.3734395 0.3417775 -0.5697912 0.2653988 -0.4778749 -0.3853005 0.03364394
        V120         V121        V122      V123       V124       V125
1 -0.1265108 -0.006100849 -0.03136479 0.1077254 -0.9853103 -0.9766234
        V126       V127       V128       V129       V130      V131       V132
1 -0.9922053 -0.9845863 -0.9763526 -0.9923616 -0.8670437 -0.933786 -0.7475662
      V133      V134      V135       V136       V137       V138       V139
1 0.847308 0.9148953 0.8308405 -0.9671843 -0.9995783 -0.9993543 -0.9997634
        V140      V141       V142       V143      V144       V145       V146
1 -0.9834381 -0.978614 -0.9929656 0.08263168 0.2022676 -0.1687567 0.09632324
        V147      V148       V149 V150       V151      V152      V153
1 -0.2749851 0.4986442 -0.2203169    1 -0.9729714 0.3166545 0.3757264
       V154      V155      V156      V157      V158      V159      V160
1 0.7233992 -0.771112 0.6902132 -0.331831 0.7095838 0.1348734 0.3010995
        V161        V162       V163       V164       V165       V166
1 -0.0991674 -0.05551737 -0.0619858 -0.9921107 -0.9925193 -0.9920553
        V167       V168      V169       V170       V171       V172      V173
1 -0.9921648 -0.9949416 -0.992619 -0.9901558 -0.9867428 -0.9920416 0.9944288
       V174      V175       V176       V177       V178       V179       V180
1 0.9917558 0.9893519 -0.9944534 -0.9999375 -0.9999535 -0.9999229 -0.9922997
        V181      V182      V183      V184       V185      V186      V187
1 -0.9969389 -0.992243 -0.589851 -0.688459 -0.5721069 0.2923763 -0.361998
       V188        V189      V190       V191      V192      V193      V194
1 0.4055427 -0.03900695 0.9892838 -0.4145605 0.3916025 0.2822509 0.9272698
      V195      V196      V197      V198        V199      V200       V201
1 -0.57237 0.6916192 0.4682898 -0.131077 -0.08715969 0.3362475 -0.9594339
        V202       V203       V204       V205       V206       V207
1 -0.9505515 -0.9579929 -0.9463052 -0.9925557 -0.9594339 -0.9984928
        V208       V209       V210        V211       V212      V213
1 -0.9576374 -0.2325816 -0.1731787 -0.02289666 0.09483157 0.1918171
        V214       V215       V216       V217       V218       V219
1 -0.9594339 -0.9505515 -0.9579929 -0.9463052 -0.9925557 -0.9594339
        V220       V221       V222       V223        V224       V225
1 -0.9984928 -0.9576374 -0.2325816 -0.1731787 -0.02289666 0.09483157
       V226       V227       V228       V229      V230       V231       V232
1 0.1918171 -0.9933059 -0.9943364 -0.9945004 -0.992784 -0.9912085 -0.9933059
        V233       V234       V235      V236       V237       V238
1 -0.9998919 -0.9929337 -0.8634148 0.2830852 -0.2373087 -0.1054322
         V239       V240       V241       V242       V243       V244
1 -0.03821231 -0.9689591 -0.9643352 -0.9572448 -0.9750599 -0.9915537
        V245       V246       V247       V248      V249       V250      V251
1 -0.9689591 -0.9992865 -0.9497658 0.07257904 0.5725114 -0.7386022 0.2125778
      V252       V253       V254      V255       V256      V257       V258
1 0.433405 -0.9942478 -0.9913676 -0.993143 -0.9889356 -0.993486 -0.9942478
       V259       V260       V261      V262       V263       V264       V265
1 -0.999949 -0.9945472 -0.6197676 0.2928405 -0.1768892 -0.1457792 -0.1240723
        V266       V267       V268       V269      V270      V271       V272
1 -0.9947832 -0.9829841 -0.9392687 -0.9954217 -0.983133 -0.906165 -0.9968886
        V273      V274       V275       V276       V277       V278       V279
1 -0.9845193 -0.932082 -0.9937563 -0.9831629 -0.8850542 -0.9939619 -0.9934461
        V280       V281       V282       V283       V284      V285       V286
1 -0.9234277 -0.9747327 -0.9999684 -0.9996891 -0.9948915 -0.995926 -0.9897089
        V287       V288       V289       V290 V291 V292 V293      V294
1 -0.9879912 -0.9463569 -0.9047478 -0.5913025   -1   -1   -1 0.2524829
       V295        V296      V297       V298       V299       V300      V301
1 0.1318358 -0.05205025 0.1420506 -0.1506825 -0.2205469 -0.5587385 0.2467687
          V302       V303       V304       V305       V306       V307
1 -0.007415521 -0.9999628 -0.9999865 -0.9999791 -0.9999624 -0.9999322
        V308       V309       V310       V311       V312       V313
1 -0.9997251 -0.9996704 -0.9999858 -0.9999687 -0.9999769 -0.9998697
        V314       V315       V316       V317       V318      V319      V320
1 -0.9997761 -0.9999712 -0.9999193 -0.9996568 -0.9998605 -0.999867 -0.999863
        V321       V322       V323       V324       V325       V326
1 -0.9997378 -0.9997322 -0.9994926 -0.9998136 -0.9996818 -0.9998394
        V327      V328       V329       V330       V331       V332      V333
1 -0.9997382 -0.999612 -0.9996872 -0.9998386 -0.9935923 -0.9994758 -0.999662
        V334       V335       V336       V337       V338       V339
1 -0.9996423 -0.9992934 -0.9978922 -0.9959325 -0.9951464 -0.9947399
        V340       V341       V342       V343       V344       V345
1 -0.9996883 -0.9989246 -0.9956713 -0.9948773 -0.9994544 -0.9923325
        V346       V347       V348       V349       V350       V351
1 -0.9871699 -0.9896961 -0.9958207 -0.9909363 -0.9970517 -0.9938055
        V352       V353       V354       V355       V356       V357
1 -0.9905187 -0.9969928 -0.9967369 -0.9919752 -0.9932417 -0.9983491
        V358       V359      V360       V361       V362       V363       V364
1 -0.9911084 -0.9598854 -0.990515 -0.9999347 -0.9998205 -0.9998845 -0.9930263
        V365       V366 V367 V368 V369 V370  V371 V372      V373     V374
1 -0.9913734 -0.9962396   -1   -1   -1    1 -0.24   -1 0.8703845 0.210697
       V375       V376       V377       V378       V379       V380       V381
1 0.2637079 -0.7036858 -0.9037425 -0.5825736 -0.9363101 -0.5073447 -0.8055359
        V382       V383       V384       V385       V386       V387
1 -0.9999865 -0.9999796 -0.9999748 -0.9999551 -0.9999186 -0.9996401
        V388       V389       V390       V391      V392       V393       V394
1 -0.9994833 -0.9999609 -0.9999823 -0.9999707 -0.999811 -0.9994847 -0.9999808
        V395       V396       V397       V398       V399       V400
1 -0.9998519 -0.9999326 -0.9998999 -0.9998244 -0.9998598 -0.9997275
        V401       V402       V403       V404       V405       V406
1 -0.9997288 -0.9995671 -0.9997652 -0.9999002 -0.9998149 -0.9997098
        V407       V408       V409       V410       V411       V412
1 -0.9995961 -0.9998522 -0.9998221 -0.9993999 -0.9997656 -0.9999585
        V413       V414       V415       V416       V417       V418
1 -0.9999495 -0.9998385 -0.9998135 -0.9987805 -0.9985778 -0.9996197
        V419       V420       V421       V422       V423       V424
1 -0.9999836 -0.9998281 -0.9986807 -0.9998442 -0.9999279 -0.9865744
        V425       V426       V427       V428       V429       V430
1 -0.9817615 -0.9895148 -0.9850326 -0.9738861 -0.9940349 -0.9865308
        V431      V432       V433       V434       V435       V436       V437
1 -0.9836164 -0.992352 -0.9804984 -0.9722709 -0.9949443 -0.9975686 -0.9840851
        V438       V439       V440       V441       V442       V443
1 -0.9943354 -0.9852762 -0.9998637 -0.9996661 -0.9999346 -0.9903439
        V444       V445       V446       V447      V448 V449 V450 V451
1 -0.9948357 -0.9944116 -0.7124023 -0.6448424 -0.838993   -1   -1   -1
        V452       V453     V454      V455      V456     V457        V458
1 -0.2575489 0.09794711 0.547151 0.3773112 0.1340915 0.273372 -0.09126183
        V459       V460      V461       V462       V463       V464       V465
1 -0.4843465 -0.7828507 -0.999865 -0.9999318 -0.9999729 -0.9999702 -0.9999301
        V466      V467       V468       V469       V470       V471       V472
1 -0.9999586 -0.999929 -0.9999847 -0.9998633 -0.9999681 -0.9999361 -0.9999536
        V473      V474       V475       V476       V477       V478       V479
1 -0.9998644 -0.999961 -0.9994537 -0.9999781 -0.9999915 -0.9999901 -0.9999686
        V480      V481       V482       V483       V484       V485       V486
1 -0.9998066 -0.998346 -0.9989612 -0.9996187 -0.9999893 -0.9999354 -0.9983875
        V487       V488       V489       V490       V491       V492
1 -0.9996426 -0.9999727 -0.9999554 -0.9999763 -0.9999058 -0.9999855
        V493       V494       V495       V496       V497       V498
1 -0.9999372 -0.9997512 -0.9990723 -0.9999275 -0.9999516 -0.9999058
        V499       V500      V501       V502       V503      V504       V505
1 -0.9998927 -0.9994443 -0.999941 -0.9999586 -0.9521547 -0.956134 -0.9488701
        V506       V507       V508       V509       V510       V511
1 -0.9743206 -0.9257218 -0.9521547 -0.9982852 -0.9732732 -0.6463764
        V512        V513      V514       V515       V516      V517       V518
1 -0.7931035 -0.08843612 -0.436471 -0.7968405 -0.9937257 -0.993755 -0.9919757
        V519       V520       V521       V522       V523 V524       V525
1 -0.9933647 -0.9881754 -0.9937257 -0.9999184 -0.9913637   -1 -0.9365079
       V526       V527     V528       V529       V530       V531       V532
1 0.3469885 -0.5160801 -0.80276 -0.9801349 -0.9613094 -0.9736534 -0.9522638
        V533       V534       V535       V536       V537 V538       V539
1 -0.9894981 -0.9801349 -0.9992403 -0.9926555 -0.7012914   -1 -0.1289889
       V540      V541       V542       V543       V544       V545       V546
1 0.5861564 0.3746046 -0.9919904 -0.9906975 -0.9899408 -0.9924478 -0.9910477
        V547       V548       V549       V550 V551        V552       V553
1 -0.9919904 -0.9999368 -0.9904579 -0.8713058   -1 -0.07432303 -0.2986764
        V554       V555       V556       V557        V558       V559
1 -0.7103041 -0.1127543 0.03040037 -0.4647614 -0.01844588 -0.8412468
       V560        V561
1 0.1799406 -0.05862692
 [ reached 'max' / getOption("max.print") -- omitted 10298 rows ]

2. Витягує лише вимірювання середнього значення та стандартного
відхилення (mean and standard deviation) для кожного вимірювання.

> dataSet2 <- grep("mean()|std()", features[, 2]) 
> dataSet2
 [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86
[19] 121 122 123 124 125 126 161 162 163 164 165 166 201 202 214 215 227 228
[37] 240 241 253 254 266 267 268 269 270 271 294 295 296 345 346 347 348 349
[55] 350 373 374 375 424 425 426 427 428 429 452 453 454 503 504 513 516 517
[73] 526 529 530 539 542 543 552

4. Відповідно присвоює змінним у наборі даних описові імена.

feature_names <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
> feature_names
  [1] "tBodyAcc-mean-X"                    "tBodyAcc-mean-Y"                   
  [3] "tBodyAcc-mean-Z"                    "tBodyAcc-std-X"                    
  [5] "tBodyAcc-std-Y"                     "tBodyAcc-std-Z"                    
  [7] "tBodyAcc-mad-X"                     "tBodyAcc-mad-Y"                    
  [9] "tBodyAcc-mad-Z"                     "tBodyAcc-max-X"                    
 [11] "tBodyAcc-max-Y"                     "tBodyAcc-max-Z"                    
 [13] "tBodyAcc-min-X"                     "tBodyAcc-min-Y"                    
 [15] "tBodyAcc-min-Z"                     "tBodyAcc-sma"                      
 [17] "tBodyAcc-energy-X"                  "tBodyAcc-energy-Y"                 
 [19] "tBodyAcc-energy-Z"                  "tBodyAcc-iqr-X"                    
 [21] "tBodyAcc-iqr-Y"                     "tBodyAcc-iqr-Z"                    
 [23] "tBodyAcc-entropy-X"                 "tBodyAcc-entropy-Y"                
 [25] "tBodyAcc-entropy-Z"                 "tBodyAcc-arCoeff-X,1"              
 [27] "tBodyAcc-arCoeff-X,2"               "tBodyAcc-arCoeff-X,3"              
 [29] "tBodyAcc-arCoeff-X,4"               "tBodyAcc-arCoeff-Y,1"              
 [31] "tBodyAcc-arCoeff-Y,2"               "tBodyAcc-arCoeff-Y,3"              
 [33] "tBodyAcc-arCoeff-Y,4"               "tBodyAcc-arCoeff-Z,1"              
 [35] "tBodyAcc-arCoeff-Z,2"               "tBodyAcc-arCoeff-Z,3"              
 [37] "tBodyAcc-arCoeff-Z,4"               "tBodyAcc-correlation-X,Y"          
 [39] "tBodyAcc-correlation-X,Z"           "tBodyAcc-correlation-Y,Z"          
 [41] "tGravityAcc-mean-X"                 "tGravityAcc-mean-Y"                
 [43] "tGravityAcc-mean-Z"                 "tGravityAcc-std-X"                 
 [45] "tGravityAcc-std-Y"                  "tGravityAcc-std-Z"                 
 [47] "tGravityAcc-mad-X"                  "tGravityAcc-mad-Y"                 
 [49] "tGravityAcc-mad-Z"                  "tGravityAcc-max-X"                 
 [51] "tGravityAcc-max-Y"                  "tGravityAcc-max-Z"                 
 [53] "tGravityAcc-min-X"                  "tGravityAcc-min-Y"                 
 [55] "tGravityAcc-min-Z"                  "tGravityAcc-sma"                   
 [57] "tGravityAcc-energy-X"               "tGravityAcc-energy-Y"              
 [59] "tGravityAcc-energy-Z"               "tGravityAcc-iqr-X"                 
 [61] "tGravityAcc-iqr-Y"                  "tGravityAcc-iqr-Z"                 
 [63] "tGravityAcc-entropy-X"              "tGravityAcc-entropy-Y"             
 [65] "tGravityAcc-entropy-Z"              "tGravityAcc-arCoeff-X,1"           
 [67] "tGravityAcc-arCoeff-X,2"            "tGravityAcc-arCoeff-X,3"           
 [69] "tGravityAcc-arCoeff-X,4"            "tGravityAcc-arCoeff-Y,1"           
 [71] "tGravityAcc-arCoeff-Y,2"            "tGravityAcc-arCoeff-Y,3"           
 [73] "tGravityAcc-arCoeff-Y,4"            "tGravityAcc-arCoeff-Z,1"           
 [75] "tGravityAcc-arCoeff-Z,2"            "tGravityAcc-arCoeff-Z,3"           
 [77] "tGravityAcc-arCoeff-Z,4"            "tGravityAcc-correlation-X,Y"       
 [79] "tGravityAcc-correlation-X,Z"        "tGravityAcc-correlation-Y,Z"       
 [81] "tBodyAccJerk-mean-X"                "tBodyAccJerk-mean-Y"               
 [83] "tBodyAccJerk-mean-Z"                "tBodyAccJerk-std-X"                
 [85] "tBodyAccJerk-std-Y"                 "tBodyAccJerk-std-Z"                
 [87] "tBodyAccJerk-mad-X"                 "tBodyAccJerk-mad-Y"                
 [89] "tBodyAccJerk-mad-Z"                 "tBodyAccJerk-max-X"                
 [91] "tBodyAccJerk-max-Y"                 "tBodyAccJerk-max-Z"                
 [93] "tBodyAccJerk-min-X"                 "tBodyAccJerk-min-Y"                
 [95] "tBodyAccJerk-min-Z"                 "tBodyAccJerk-sma"                  
 [97] "tBodyAccJerk-energy-X"              "tBodyAccJerk-energy-Y"             
 [99] "tBodyAccJerk-energy-Z"              "tBodyAccJerk-iqr-X"                
[101] "tBodyAccJerk-iqr-Y"                 "tBodyAccJerk-iqr-Z"                
[103] "tBodyAccJerk-entropy-X"             "tBodyAccJerk-entropy-Y"            
[105] "tBodyAccJerk-entropy-Z"             "tBodyAccJerk-arCoeff-X,1"          
[107] "tBodyAccJerk-arCoeff-X,2"           "tBodyAccJerk-arCoeff-X,3"          
[109] "tBodyAccJerk-arCoeff-X,4"           "tBodyAccJerk-arCoeff-Y,1"          
[111] "tBodyAccJerk-arCoeff-Y,2"           "tBodyAccJerk-arCoeff-Y,3"          
[113] "tBodyAccJerk-arCoeff-Y,4"           "tBodyAccJerk-arCoeff-Z,1"          
[115] "tBodyAccJerk-arCoeff-Z,2"           "tBodyAccJerk-arCoeff-Z,3"          
[117] "tBodyAccJerk-arCoeff-Z,4"           "tBodyAccJerk-correlation-X,Y"      
[119] "tBodyAccJerk-correlation-X,Z"       "tBodyAccJerk-correlation-Y,Z"      
[121] "tBodyGyro-mean-X"                   "tBodyGyro-mean-Y"                  
[123] "tBodyGyro-mean-Z"                   "tBodyGyro-std-X"                   
[125] "tBodyGyro-std-Y"                    "tBodyGyro-std-Z"                   
[127] "tBodyGyro-mad-X"                    "tBodyGyro-mad-Y"                   
[129] "tBodyGyro-mad-Z"                    "tBodyGyro-max-X"                   
[131] "tBodyGyro-max-Y"                    "tBodyGyro-max-Z"                   
[133] "tBodyGyro-min-X"                    "tBodyGyro-min-Y"                   
[135] "tBodyGyro-min-Z"                    "tBodyGyro-sma"                     
[137] "tBodyGyro-energy-X"                 "tBodyGyro-energy-Y"                
[139] "tBodyGyro-energy-Z"                 "tBodyGyro-iqr-X"                   
[141] "tBodyGyro-iqr-Y"                    "tBodyGyro-iqr-Z"                   
[143] "tBodyGyro-entropy-X"                "tBodyGyro-entropy-Y"               
[145] "tBodyGyro-entropy-Z"                "tBodyGyro-arCoeff-X,1"             
[147] "tBodyGyro-arCoeff-X,2"              "tBodyGyro-arCoeff-X,3"             
[149] "tBodyGyro-arCoeff-X,4"              "tBodyGyro-arCoeff-Y,1"             
[151] "tBodyGyro-arCoeff-Y,2"              "tBodyGyro-arCoeff-Y,3"             
[153] "tBodyGyro-arCoeff-Y,4"              "tBodyGyro-arCoeff-Z,1"             
[155] "tBodyGyro-arCoeff-Z,2"              "tBodyGyro-arCoeff-Z,3"             
[157] "tBodyGyro-arCoeff-Z,4"              "tBodyGyro-correlation-X,Y"         
[159] "tBodyGyro-correlation-X,Z"          "tBodyGyro-correlation-Y,Z"         
[161] "tBodyGyroJerk-mean-X"               "tBodyGyroJerk-mean-Y"              
[163] "tBodyGyroJerk-mean-Z"               "tBodyGyroJerk-std-X"               
[165] "tBodyGyroJerk-std-Y"                "tBodyGyroJerk-std-Z"               
[167] "tBodyGyroJerk-mad-X"                "tBodyGyroJerk-mad-Y"               
[169] "tBodyGyroJerk-mad-Z"                "tBodyGyroJerk-max-X"               
[171] "tBodyGyroJerk-max-Y"                "tBodyGyroJerk-max-Z"               
[173] "tBodyGyroJerk-min-X"                "tBodyGyroJerk-min-Y"               
[175] "tBodyGyroJerk-min-Z"                "tBodyGyroJerk-sma"                 
[177] "tBodyGyroJerk-energy-X"             "tBodyGyroJerk-energy-Y"            
[179] "tBodyGyroJerk-energy-Z"             "tBodyGyroJerk-iqr-X"               
[181] "tBodyGyroJerk-iqr-Y"                "tBodyGyroJerk-iqr-Z"               
[183] "tBodyGyroJerk-entropy-X"            "tBodyGyroJerk-entropy-Y"           
[185] "tBodyGyroJerk-entropy-Z"            "tBodyGyroJerk-arCoeff-X,1"         
[187] "tBodyGyroJerk-arCoeff-X,2"          "tBodyGyroJerk-arCoeff-X,3"         
[189] "tBodyGyroJerk-arCoeff-X,4"          "tBodyGyroJerk-arCoeff-Y,1"         
[191] "tBodyGyroJerk-arCoeff-Y,2"          "tBodyGyroJerk-arCoeff-Y,3"         
[193] "tBodyGyroJerk-arCoeff-Y,4"          "tBodyGyroJerk-arCoeff-Z,1"         
[195] "tBodyGyroJerk-arCoeff-Z,2"          "tBodyGyroJerk-arCoeff-Z,3"         
[197] "tBodyGyroJerk-arCoeff-Z,4"          "tBodyGyroJerk-correlation-X,Y"     
[199] "tBodyGyroJerk-correlation-X,Z"      "tBodyGyroJerk-correlation-Y,Z"     
[201] "tBodyAccMag-mean"                   "tBodyAccMag-std"                   
[203] "tBodyAccMag-mad"                    "tBodyAccMag-max"                   
[205] "tBodyAccMag-min"                    "tBodyAccMag-sma"                   
[207] "tBodyAccMag-energy"                 "tBodyAccMag-iqr"                   
[209] "tBodyAccMag-entropy"                "tBodyAccMag-arCoeff1"              
[211] "tBodyAccMag-arCoeff2"               "tBodyAccMag-arCoeff3"              
[213] "tBodyAccMag-arCoeff4"               "tGravityAccMag-mean"               
[215] "tGravityAccMag-std"                 "tGravityAccMag-mad"                
[217] "tGravityAccMag-max"                 "tGravityAccMag-min"                
[219] "tGravityAccMag-sma"                 "tGravityAccMag-energy"             
[221] "tGravityAccMag-iqr"                 "tGravityAccMag-entropy"            
[223] "tGravityAccMag-arCoeff1"            "tGravityAccMag-arCoeff2"           
[225] "tGravityAccMag-arCoeff3"            "tGravityAccMag-arCoeff4"           
[227] "tBodyAccJerkMag-mean"               "tBodyAccJerkMag-std"               
[229] "tBodyAccJerkMag-mad"                "tBodyAccJerkMag-max"               
[231] "tBodyAccJerkMag-min"                "tBodyAccJerkMag-sma"               
[233] "tBodyAccJerkMag-energy"             "tBodyAccJerkMag-iqr"               
[235] "tBodyAccJerkMag-entropy"            "tBodyAccJerkMag-arCoeff1"          
[237] "tBodyAccJerkMag-arCoeff2"           "tBodyAccJerkMag-arCoeff3"          
[239] "tBodyAccJerkMag-arCoeff4"           "tBodyGyroMag-mean"                 
[241] "tBodyGyroMag-std"                   "tBodyGyroMag-mad"                  
[243] "tBodyGyroMag-max"                   "tBodyGyroMag-min"                  
[245] "tBodyGyroMag-sma"                   "tBodyGyroMag-energy"               
[247] "tBodyGyroMag-iqr"                   "tBodyGyroMag-entropy"              
[249] "tBodyGyroMag-arCoeff1"              "tBodyGyroMag-arCoeff2"             
[251] "tBodyGyroMag-arCoeff3"              "tBodyGyroMag-arCoeff4"             
[253] "tBodyGyroJerkMag-mean"              "tBodyGyroJerkMag-std"              
[255] "tBodyGyroJerkMag-mad"               "tBodyGyroJerkMag-max"              
[257] "tBodyGyroJerkMag-min"               "tBodyGyroJerkMag-sma"              
[259] "tBodyGyroJerkMag-energy"            "tBodyGyroJerkMag-iqr"              
[261] "tBodyGyroJerkMag-entropy"           "tBodyGyroJerkMag-arCoeff1"         
[263] "tBodyGyroJerkMag-arCoeff2"          "tBodyGyroJerkMag-arCoeff3"         
[265] "tBodyGyroJerkMag-arCoeff4"          "fBodyAcc-mean-X"                   
[267] "fBodyAcc-mean-Y"                    "fBodyAcc-mean-Z"                   
[269] "fBodyAcc-std-X"                     "fBodyAcc-std-Y"                    
[271] "fBodyAcc-std-Z"                     "fBodyAcc-mad-X"                    
[273] "fBodyAcc-mad-Y"                     "fBodyAcc-mad-Z"                    
[275] "fBodyAcc-max-X"                     "fBodyAcc-max-Y"                    
[277] "fBodyAcc-max-Z"                     "fBodyAcc-min-X"                    
[279] "fBodyAcc-min-Y"                     "fBodyAcc-min-Z"                    
[281] "fBodyAcc-sma"                       "fBodyAcc-energy-X"                 
[283] "fBodyAcc-energy-Y"                  "fBodyAcc-energy-Z"                 
[285] "fBodyAcc-iqr-X"                     "fBodyAcc-iqr-Y"                    
[287] "fBodyAcc-iqr-Z"                     "fBodyAcc-entropy-X"                
[289] "fBodyAcc-entropy-Y"                 "fBodyAcc-entropy-Z"                
[291] "fBodyAcc-maxInds-X"                 "fBodyAcc-maxInds-Y"                
[293] "fBodyAcc-maxInds-Z"                 "fBodyAcc-meanFreq-X"               
[295] "fBodyAcc-meanFreq-Y"                "fBodyAcc-meanFreq-Z"               
[297] "fBodyAcc-skewness-X"                "fBodyAcc-kurtosis-X"               
[299] "fBodyAcc-skewness-Y"                "fBodyAcc-kurtosis-Y"               
[301] "fBodyAcc-skewness-Z"                "fBodyAcc-kurtosis-Z"               
[303] "fBodyAcc-bandsEnergy-1,8"           "fBodyAcc-bandsEnergy-9,16"         
[305] "fBodyAcc-bandsEnergy-17,24"         "fBodyAcc-bandsEnergy-25,32"        
[307] "fBodyAcc-bandsEnergy-33,40"         "fBodyAcc-bandsEnergy-41,48"        
[309] "fBodyAcc-bandsEnergy-49,56"         "fBodyAcc-bandsEnergy-57,64"        
[311] "fBodyAcc-bandsEnergy-1,16"          "fBodyAcc-bandsEnergy-17,32"        
[313] "fBodyAcc-bandsEnergy-33,48"         "fBodyAcc-bandsEnergy-49,64"        
[315] "fBodyAcc-bandsEnergy-1,24"          "fBodyAcc-bandsEnergy-25,48"        
[317] "fBodyAcc-bandsEnergy-1,8"           "fBodyAcc-bandsEnergy-9,16"         
[319] "fBodyAcc-bandsEnergy-17,24"         "fBodyAcc-bandsEnergy-25,32"        
[321] "fBodyAcc-bandsEnergy-33,40"         "fBodyAcc-bandsEnergy-41,48"        
[323] "fBodyAcc-bandsEnergy-49,56"         "fBodyAcc-bandsEnergy-57,64"        
[325] "fBodyAcc-bandsEnergy-1,16"          "fBodyAcc-bandsEnergy-17,32"        
[327] "fBodyAcc-bandsEnergy-33,48"         "fBodyAcc-bandsEnergy-49,64"        
[329] "fBodyAcc-bandsEnergy-1,24"          "fBodyAcc-bandsEnergy-25,48"        
[331] "fBodyAcc-bandsEnergy-1,8"           "fBodyAcc-bandsEnergy-9,16"         
[333] "fBodyAcc-bandsEnergy-17,24"         "fBodyAcc-bandsEnergy-25,32"        
[335] "fBodyAcc-bandsEnergy-33,40"         "fBodyAcc-bandsEnergy-41,48"        
[337] "fBodyAcc-bandsEnergy-49,56"         "fBodyAcc-bandsEnergy-57,64"        
[339] "fBodyAcc-bandsEnergy-1,16"          "fBodyAcc-bandsEnergy-17,32"        
[341] "fBodyAcc-bandsEnergy-33,48"         "fBodyAcc-bandsEnergy-49,64"        
[343] "fBodyAcc-bandsEnergy-1,24"          "fBodyAcc-bandsEnergy-25,48"        
[345] "fBodyAccJerk-mean-X"                "fBodyAccJerk-mean-Y"               
[347] "fBodyAccJerk-mean-Z"                "fBodyAccJerk-std-X"                
[349] "fBodyAccJerk-std-Y"                 "fBodyAccJerk-std-Z"                
[351] "fBodyAccJerk-mad-X"                 "fBodyAccJerk-mad-Y"                
[353] "fBodyAccJerk-mad-Z"                 "fBodyAccJerk-max-X"                
[355] "fBodyAccJerk-max-Y"                 "fBodyAccJerk-max-Z"                
[357] "fBodyAccJerk-min-X"                 "fBodyAccJerk-min-Y"                
[359] "fBodyAccJerk-min-Z"                 "fBodyAccJerk-sma"                  
[361] "fBodyAccJerk-energy-X"              "fBodyAccJerk-energy-Y"             
[363] "fBodyAccJerk-energy-Z"              "fBodyAccJerk-iqr-X"                
[365] "fBodyAccJerk-iqr-Y"                 "fBodyAccJerk-iqr-Z"                
[367] "fBodyAccJerk-entropy-X"             "fBodyAccJerk-entropy-Y"            
[369] "fBodyAccJerk-entropy-Z"             "fBodyAccJerk-maxInds-X"            
[371] "fBodyAccJerk-maxInds-Y"             "fBodyAccJerk-maxInds-Z"            
[373] "fBodyAccJerk-meanFreq-X"            "fBodyAccJerk-meanFreq-Y"           
[375] "fBodyAccJerk-meanFreq-Z"            "fBodyAccJerk-skewness-X"           
[377] "fBodyAccJerk-kurtosis-X"            "fBodyAccJerk-skewness-Y"           
[379] "fBodyAccJerk-kurtosis-Y"            "fBodyAccJerk-skewness-Z"           
[381] "fBodyAccJerk-kurtosis-Z"            "fBodyAccJerk-bandsEnergy-1,8"      
[383] "fBodyAccJerk-bandsEnergy-9,16"      "fBodyAccJerk-bandsEnergy-17,24"    
[385] "fBodyAccJerk-bandsEnergy-25,32"     "fBodyAccJerk-bandsEnergy-33,40"    
[387] "fBodyAccJerk-bandsEnergy-41,48"     "fBodyAccJerk-bandsEnergy-49,56"    
[389] "fBodyAccJerk-bandsEnergy-57,64"     "fBodyAccJerk-bandsEnergy-1,16"     
[391] "fBodyAccJerk-bandsEnergy-17,32"     "fBodyAccJerk-bandsEnergy-33,48"    
[393] "fBodyAccJerk-bandsEnergy-49,64"     "fBodyAccJerk-bandsEnergy-1,24"     
[395] "fBodyAccJerk-bandsEnergy-25,48"     "fBodyAccJerk-bandsEnergy-1,8"      
[397] "fBodyAccJerk-bandsEnergy-9,16"      "fBodyAccJerk-bandsEnergy-17,24"    
[399] "fBodyAccJerk-bandsEnergy-25,32"     "fBodyAccJerk-bandsEnergy-33,40"    
[401] "fBodyAccJerk-bandsEnergy-41,48"     "fBodyAccJerk-bandsEnergy-49,56"    
[403] "fBodyAccJerk-bandsEnergy-57,64"     "fBodyAccJerk-bandsEnergy-1,16"     
[405] "fBodyAccJerk-bandsEnergy-17,32"     "fBodyAccJerk-bandsEnergy-33,48"    
[407] "fBodyAccJerk-bandsEnergy-49,64"     "fBodyAccJerk-bandsEnergy-1,24"     
[409] "fBodyAccJerk-bandsEnergy-25,48"     "fBodyAccJerk-bandsEnergy-1,8"      
[411] "fBodyAccJerk-bandsEnergy-9,16"      "fBodyAccJerk-bandsEnergy-17,24"    
[413] "fBodyAccJerk-bandsEnergy-25,32"     "fBodyAccJerk-bandsEnergy-33,40"    
[415] "fBodyAccJerk-bandsEnergy-41,48"     "fBodyAccJerk-bandsEnergy-49,56"    
[417] "fBodyAccJerk-bandsEnergy-57,64"     "fBodyAccJerk-bandsEnergy-1,16"     
[419] "fBodyAccJerk-bandsEnergy-17,32"     "fBodyAccJerk-bandsEnergy-33,48"    
[421] "fBodyAccJerk-bandsEnergy-49,64"     "fBodyAccJerk-bandsEnergy-1,24"     
[423] "fBodyAccJerk-bandsEnergy-25,48"     "fBodyGyro-mean-X"                  
[425] "fBodyGyro-mean-Y"                   "fBodyGyro-mean-Z"                  
[427] "fBodyGyro-std-X"                    "fBodyGyro-std-Y"                   
[429] "fBodyGyro-std-Z"                    "fBodyGyro-mad-X"                   
[431] "fBodyGyro-mad-Y"                    "fBodyGyro-mad-Z"                   
[433] "fBodyGyro-max-X"                    "fBodyGyro-max-Y"                   
[435] "fBodyGyro-max-Z"                    "fBodyGyro-min-X"                   
[437] "fBodyGyro-min-Y"                    "fBodyGyro-min-Z"                   
[439] "fBodyGyro-sma"                      "fBodyGyro-energy-X"                
[441] "fBodyGyro-energy-Y"                 "fBodyGyro-energy-Z"                
[443] "fBodyGyro-iqr-X"                    "fBodyGyro-iqr-Y"                   
[445] "fBodyGyro-iqr-Z"                    "fBodyGyro-entropy-X"               
[447] "fBodyGyro-entropy-Y"                "fBodyGyro-entropy-Z"               
[449] "fBodyGyro-maxInds-X"                "fBodyGyro-maxInds-Y"               
[451] "fBodyGyro-maxInds-Z"                "fBodyGyro-meanFreq-X"              
[453] "fBodyGyro-meanFreq-Y"               "fBodyGyro-meanFreq-Z"              
[455] "fBodyGyro-skewness-X"               "fBodyGyro-kurtosis-X"              
[457] "fBodyGyro-skewness-Y"               "fBodyGyro-kurtosis-Y"              
[459] "fBodyGyro-skewness-Z"               "fBodyGyro-kurtosis-Z"              
[461] "fBodyGyro-bandsEnergy-1,8"          "fBodyGyro-bandsEnergy-9,16"        
[463] "fBodyGyro-bandsEnergy-17,24"        "fBodyGyro-bandsEnergy-25,32"       
[465] "fBodyGyro-bandsEnergy-33,40"        "fBodyGyro-bandsEnergy-41,48"       
[467] "fBodyGyro-bandsEnergy-49,56"        "fBodyGyro-bandsEnergy-57,64"       
[469] "fBodyGyro-bandsEnergy-1,16"         "fBodyGyro-bandsEnergy-17,32"       
[471] "fBodyGyro-bandsEnergy-33,48"        "fBodyGyro-bandsEnergy-49,64"       
[473] "fBodyGyro-bandsEnergy-1,24"         "fBodyGyro-bandsEnergy-25,48"       
[475] "fBodyGyro-bandsEnergy-1,8"          "fBodyGyro-bandsEnergy-9,16"        
[477] "fBodyGyro-bandsEnergy-17,24"        "fBodyGyro-bandsEnergy-25,32"       
[479] "fBodyGyro-bandsEnergy-33,40"        "fBodyGyro-bandsEnergy-41,48"       
[481] "fBodyGyro-bandsEnergy-49,56"        "fBodyGyro-bandsEnergy-57,64"       
[483] "fBodyGyro-bandsEnergy-1,16"         "fBodyGyro-bandsEnergy-17,32"       
[485] "fBodyGyro-bandsEnergy-33,48"        "fBodyGyro-bandsEnergy-49,64"       
[487] "fBodyGyro-bandsEnergy-1,24"         "fBodyGyro-bandsEnergy-25,48"       
[489] "fBodyGyro-bandsEnergy-1,8"          "fBodyGyro-bandsEnergy-9,16"        
[491] "fBodyGyro-bandsEnergy-17,24"        "fBodyGyro-bandsEnergy-25,32"       
[493] "fBodyGyro-bandsEnergy-33,40"        "fBodyGyro-bandsEnergy-41,48"       
[495] "fBodyGyro-bandsEnergy-49,56"        "fBodyGyro-bandsEnergy-57,64"       
[497] "fBodyGyro-bandsEnergy-1,16"         "fBodyGyro-bandsEnergy-17,32"       
[499] "fBodyGyro-bandsEnergy-33,48"        "fBodyGyro-bandsEnergy-49,64"       
[501] "fBodyGyro-bandsEnergy-1,24"         "fBodyGyro-bandsEnergy-25,48"       
[503] "fBodyAccMag-mean"                   "fBodyAccMag-std"                   
[505] "fBodyAccMag-mad"                    "fBodyAccMag-max"                   
[507] "fBodyAccMag-min"                    "fBodyAccMag-sma"                   
[509] "fBodyAccMag-energy"                 "fBodyAccMag-iqr"                   
[511] "fBodyAccMag-entropy"                "fBodyAccMag-maxInds"               
[513] "fBodyAccMag-meanFreq"               "fBodyAccMag-skewness"              
[515] "fBodyAccMag-kurtosis"               "fBodyBodyAccJerkMag-mean"          
[517] "fBodyBodyAccJerkMag-std"            "fBodyBodyAccJerkMag-mad"           
[519] "fBodyBodyAccJerkMag-max"            "fBodyBodyAccJerkMag-min"           
[521] "fBodyBodyAccJerkMag-sma"            "fBodyBodyAccJerkMag-energy"        
[523] "fBodyBodyAccJerkMag-iqr"            "fBodyBodyAccJerkMag-entropy"       
[525] "fBodyBodyAccJerkMag-maxInds"        "fBodyBodyAccJerkMag-meanFreq"      
[527] "fBodyBodyAccJerkMag-skewness"       "fBodyBodyAccJerkMag-kurtosis"      
[529] "fBodyBodyGyroMag-mean"              "fBodyBodyGyroMag-std"              
[531] "fBodyBodyGyroMag-mad"               "fBodyBodyGyroMag-max"              
[533] "fBodyBodyGyroMag-min"               "fBodyBodyGyroMag-sma"              
[535] "fBodyBodyGyroMag-energy"            "fBodyBodyGyroMag-iqr"              
[537] "fBodyBodyGyroMag-entropy"           "fBodyBodyGyroMag-maxInds"          
[539] "fBodyBodyGyroMag-meanFreq"          "fBodyBodyGyroMag-skewness"         
[541] "fBodyBodyGyroMag-kurtosis"          "fBodyBodyGyroJerkMag-mean"         
[543] "fBodyBodyGyroJerkMag-std"           "fBodyBodyGyroJerkMag-mad"          
[545] "fBodyBodyGyroJerkMag-max"           "fBodyBodyGyroJerkMag-min"          
[547] "fBodyBodyGyroJerkMag-sma"           "fBodyBodyGyroJerkMag-energy"       
[549] "fBodyBodyGyroJerkMag-iqr"           "fBodyBodyGyroJerkMag-entropy"      
[551] "fBodyBodyGyroJerkMag-maxInds"       "fBodyBodyGyroJerkMag-meanFreq"     
[553] "fBodyBodyGyroJerkMag-skewness"      "fBodyBodyGyroJerkMag-kurtosis"     
[555] "angletBodyAccMean,gravity"          "angletBodyAccJerkMean,gravityMean" 
[557] "angletBodyGyroMean,gravityMean"     "angletBodyGyroJerkMean,gravityMean"
[559] "angleX,gravityMean"                 "angleY,gravityMean"                
[561] "angleZ,gravityMean"                
> subject <- rbind(subject_train, subject_test)
> activity <- rbind(y_train, y_test)
> names(subject) <- 'subject'
> names(activity) <- 'activity'
> result <- cbind(subject,activity, dataSet2)
   subject activity        V1           V2         V3         V4         V5
1        1        5 0.2885845 -0.020294171 -0.1329051 -0.9952786 -0.9831106
2        1        5 0.2784188 -0.016410568 -0.1235202 -0.9982453 -0.9753002
3        1        5 0.2796531 -0.019467156 -0.1134617 -0.9953796 -0.9671870
4        1        5 0.2791739 -0.026200646 -0.1232826 -0.9960915 -0.9834027
5        1        5 0.2766288 -0.016569655 -0.1153619 -0.9981386 -0.9808173
6        1        5 0.2771988 -0.010097850 -0.1051373 -0.9973350 -0.9904868
7        1        5 0.2794539 -0.019640776 -0.1100221 -0.9969210 -0.9671859
8        1        5 0.2774325 -0.030488303 -0.1253604 -0.9965593 -0.9667284
9        1        5 0.2772934 -0.021750698 -0.1207508 -0.9973285 -0.9612453
10       1        5 0.2805857 -0.009960298 -0.1060652 -0.9948034 -0.9727584
11       1        5 0.2768803 -0.012721805 -0.1034383 -0.9948151 -0.9730769
12       1        5 0.2762282 -0.021441302 -0.1082023 -0.9982460 -0.9872138
           V6       V41        V42        V43        V44        V45        V46
1  -0.9135264 0.9633961 -0.1408397 0.11537494 -0.9852497 -0.9817084 -0.8776250
2  -0.9603220 0.9665611 -0.1415513 0.10937881 -0.9974113 -0.9894474 -0.9316387
3  -0.9789440 0.9668781 -0.1420098 0.10188392 -0.9995740 -0.9928658 -0.9929172
4  -0.9906751 0.9676152 -0.1439765 0.09985014 -0.9966456 -0.9813928 -0.9784764
5  -0.9904816 0.9682244 -0.1487502 0.09448590 -0.9984293 -0.9880982 -0.9787449
6  -0.9954200 0.9679482 -0.1482100 0.09190972 -0.9989793 -0.9867539 -0.9973064
7  -0.9831178 0.9679295 -0.1442821 0.09314463 -0.9993325 -0.9885747 -0.9920159
8  -0.9815853 0.9684915 -0.1467054 0.09170816 -0.9981183 -0.9729600 -0.9765688
9  -0.9836716 0.9684812 -0.1543740 0.08511826 -0.9977894 -0.9756451 -0.9689613
10 -0.9862439 0.9684180 -0.1563020 0.08087447 -0.9973622 -0.9905016 -0.9967423
11 -0.9853570 0.9692027 -0.1523614 0.08125808 -0.9972646 -0.9864879 -0.9946927
12 -0.9927266 0.9692533 -0.1500638 0.08293121 -0.9981272 -0.9948204 -0.9923011
          V81          V82          V83        V84        V85        V86
1  0.07799634  0.005000803 -0.067830808 -0.9935191 -0.9883600 -0.9935750
2  0.07400671  0.005771104  0.029376633 -0.9955481 -0.9810636 -0.9918457
3  0.07363596  0.003104037 -0.009045631 -0.9907428 -0.9809556 -0.9896866
4  0.07732061  0.020057642 -0.009864772 -0.9926974 -0.9875527 -0.9934976
5  0.07344436  0.019121574  0.016779979 -0.9964202 -0.9883587 -0.9924549
6  0.07793244  0.018684046  0.009344434 -0.9948136 -0.9887145 -0.9922663
7  0.08217077 -0.017014670 -0.015798166 -0.9952056 -0.9848308 -0.9884251
8  0.07236423  0.008747856 -0.004468135 -0.9952728 -0.9812912 -0.9903396
9  0.07528437  0.030762704  0.011211950 -0.9964789 -0.9800513 -0.9966661
10 0.07636932  0.012518906  0.003084375 -0.9911556 -0.9692003 -0.9886150
11 0.07139686  0.016842441  0.001030382 -0.9912336 -0.9732643 -0.9850175
12 0.07608451 -0.002311558 -0.007673630 -0.9981793 -0.9897883 -0.9895317
           V121        V122       V123       V124       V125       V126
1  -0.006100849 -0.03136479 0.10772540 -0.9853103 -0.9766234 -0.9922053
2  -0.016111620 -0.08389378 0.10058429 -0.9831200 -0.9890458 -0.9891212
3  -0.031698294 -0.10233542 0.09612688 -0.9762921 -0.9935518 -0.9863787
4  -0.043409983 -0.09138618 0.08553770 -0.9913848 -0.9924073 -0.9875542
5  -0.033960416 -0.07470803 0.07739203 -0.9851836 -0.9923781 -0.9874019
6  -0.028775508 -0.07039311 0.07901214 -0.9851808 -0.9921175 -0.9830768
7  -0.028600251 -0.08304673 0.09546456 -0.9881772 -0.9892057 -0.9791538
8  -0.024200262 -0.07789261 0.09409561 -0.9891072 -0.9874032 -0.9785196
9  -0.024831025 -0.06640164 0.07786298 -0.9908820 -0.9928913 -0.9872415
10 -0.023415400 -0.07092568 0.07897584 -0.9849378 -0.9873038 -0.9808440
11 -0.024708255 -0.06888458 0.08548177 -0.9846639 -0.9882156 -0.9809040
12 -0.031173158 -0.07466671 0.09157754 -0.9941693 -0.9955665 -0.9957910
          V161        V162        V163       V164       V165       V166
1  -0.09916740 -0.05551737 -0.06198580 -0.9921107 -0.9925193 -0.9920553
2  -0.11050283 -0.04481873 -0.05924282 -0.9898726 -0.9972926 -0.9938510
3  -0.10848567 -0.04241031 -0.05582883 -0.9884618 -0.9956321 -0.9915318
4  -0.09116989 -0.03633262 -0.06046466 -0.9911194 -0.9966410 -0.9933289
5  -0.09077010 -0.03763253 -0.05828932 -0.9913545 -0.9964730 -0.9945110
6  -0.09424758 -0.04335526 -0.04193600 -0.9916216 -0.9960147 -0.9930906
7  -0.09708861 -0.04158928 -0.04470456 -0.9904185 -0.9954146 -0.9904868
8  -0.10316236 -0.03554607 -0.06320893 -0.9911036 -0.9957943 -0.9907386
9  -0.10069440 -0.04771525 -0.06772005 -0.9924195 -0.9963118 -0.9939563
10 -0.09842938 -0.04354022 -0.04856291 -0.9839125 -0.9930785 -0.9843996
11 -0.09944295 -0.03251515 -0.04551265 -0.9859109 -0.9937178 -0.9847622
12 -0.09420755 -0.04031615 -0.05768204 -0.9957170 -0.9975568 -0.9965503
         V201       V202       V214       V215       V227       V228
1  -0.9594339 -0.9505515 -0.9594339 -0.9505515 -0.9933059 -0.9943364
2  -0.9792892 -0.9760571 -0.9792892 -0.9760571 -0.9912535 -0.9916944
3  -0.9837031 -0.9880196 -0.9837031 -0.9880196 -0.9885313 -0.9903969
4  -0.9865418 -0.9864213 -0.9865418 -0.9864213 -0.9930780 -0.9933808
5  -0.9928271 -0.9912754 -0.9928271 -0.9912754 -0.9934800 -0.9958537
6  -0.9942950 -0.9952490 -0.9942950 -0.9952490 -0.9930177 -0.9954243
7  -0.9874657 -0.9827460 -0.9874657 -0.9827460 -0.9913143 -0.9894478
8  -0.9774577 -0.9759967 -0.9774577 -0.9759967 -0.9908508 -0.9903883
9  -0.9836309 -0.9775137 -0.9836309 -0.9775137 -0.9933254 -0.9928875
10 -0.9867720 -0.9867024 -0.9867720 -0.9867024 -0.9853882 -0.9836431
11 -0.9880403 -0.9859017 -0.9880403 -0.9859017 -0.9844114 -0.9860252
12 -0.9947756 -0.9961178 -0.9947756 -0.9961178 -0.9927949 -0.9952714
         V240       V241       V253       V254       V266       V267
1  -0.9689591 -0.9643352 -0.9942478 -0.9913676 -0.9947832 -0.9829841
2  -0.9806831 -0.9837542 -0.9951232 -0.9961016 -0.9974507 -0.9768517
3  -0.9763171 -0.9860515 -0.9934032 -0.9950910 -0.9935941 -0.9725115
4  -0.9820599 -0.9873511 -0.9955022 -0.9952666 -0.9954906 -0.9835697
5  -0.9852037 -0.9890626 -0.9958076 -0.9952580 -0.9972859 -0.9823010
6  -0.9858944 -0.9864403 -0.9952748 -0.9952050 -0.9966567 -0.9869395
7  -0.9855007 -0.9846253 -0.9937188 -0.9952695 -0.9958491 -0.9676116
8  -0.9845056 -0.9868383 -0.9942907 -0.9952107 -0.9951928 -0.9742913
9  -0.9893698 -0.9909145 -0.9958495 -0.9955883 -0.9970999 -0.9682053
10 -0.9845244 -0.9802638 -0.9897993 -0.9907352 -0.9935193 -0.9703186
11 -0.9852507 -0.9802478 -0.9912612 -0.9903406 -0.9928863 -0.9706080
12 -0.9942867 -0.9956337 -0.9977610 -0.9978154 -0.9982393 -0.9849161
         V268       V269       V270       V271         V294        V295
1  -0.9392687 -0.9954217 -0.9831330 -0.9061650  0.252482900  0.13183575
2  -0.9735227 -0.9986803 -0.9749298 -0.9554381  0.271308550  0.04286364
3  -0.9833040 -0.9963128 -0.9655059 -0.9770493  0.124531240 -0.06461056
4  -0.9910798 -0.9963121 -0.9832444 -0.9902291  0.029044377  0.08030227
5  -0.9883694 -0.9986065 -0.9801295 -0.9919150  0.181089770  0.05798789
6  -0.9927386 -0.9976438 -0.9922637 -0.9970459  0.157383770  0.31883523
7  -0.9841233 -0.9974612 -0.9679258 -0.9828873  0.432263310  0.11041077
8  -0.9886519 -0.9972793 -0.9641019 -0.9780759  0.000771701 -0.12296974
9  -0.9906322 -0.9973676 -0.9591815 -0.9800599 -0.027979677  0.15413523
10 -0.9860957 -0.9953884 -0.9747938 -0.9865356  0.037599200  0.16076246
11 -0.9836724 -0.9958107 -0.9751099 -0.9868304  0.254522430  0.14580566
12 -0.9916394 -0.9981814 -0.9882844 -0.9931970 -0.079862491  0.28590026
          V296       V345       V346       V347       V348       V349
1  -0.05205025 -0.9923325 -0.9871699 -0.9896961 -0.9958207 -0.9909363
2  -0.01430976 -0.9950322 -0.9813115 -0.9897398 -0.9966523 -0.9820839
3   0.08267692 -0.9909937 -0.9816423 -0.9875663 -0.9912488 -0.9814148
4   0.18569468 -0.9944466 -0.9887272 -0.9913542 -0.9913783 -0.9869269
5   0.55978632 -0.9962920 -0.9887900 -0.9906244 -0.9969025 -0.9886067
6   0.60559943 -0.9948507 -0.9882443 -0.9901575 -0.9952180 -0.9901788
7   0.37958626 -0.9947551 -0.9832403 -0.9873372 -0.9962421 -0.9882634
8   0.15723362 -0.9949470 -0.9807555 -0.9908381 -0.9961277 -0.9833693
9   0.16483929 -0.9966927 -0.9801905 -0.9963072 -0.9965066 -0.9812898
10  0.25978658 -0.9915342 -0.9708485 -0.9867755 -0.9914681 -0.9693183
11  0.35600115 -0.9909857 -0.9734558 -0.9817322 -0.9923312 -0.9749290
12  0.59280773 -0.9981916 -0.9896754 -0.9889512 -0.9983171 -0.9906675
         V350       V373        V374       V375       V424       V425
1  -0.9970517 0.87038451  0.21069700 0.26370789 -0.9865744 -0.9817615
2  -0.9926268 0.60851352 -0.05367561 0.06314827 -0.9773867 -0.9925300
3  -0.9904159 0.11543400 -0.19343634 0.03825433 -0.9754332 -0.9937147
4  -0.9943908 0.03579805 -0.09303585 0.16809523 -0.9871096 -0.9936015
5  -0.9929065 0.27335020  0.07913538 0.29238418 -0.9824465 -0.9929838
6  -0.9930667 0.32883589  0.05477140 0.32094497 -0.9848902 -0.9927862
7  -0.9879085 0.35640411  0.05078586 0.20893077 -0.9860273 -0.9904991
8  -0.9881628 0.29494348  0.02293017 0.02694164 -0.9873302 -0.9900142
9  -0.9954414 0.28644948  0.15220008 0.25011504 -0.9890979 -0.9919669
10 -0.9889748 0.21177858 -0.04189474 0.02995693 -0.9817777 -0.9880011
11 -0.9870654 0.29814706 -0.11664159 0.07587141 -0.9819125 -0.9878227
12 -0.9884720 0.36242301  0.08526740 0.23596642 -0.9925839 -0.9962183
         V426       V427       V428       V429        V452        V453
1  -0.9895148 -0.9850326 -0.9738861 -0.9940349 -0.25754888  0.09794711
2  -0.9896058 -0.9849043 -0.9871681 -0.9897847 -0.04816744 -0.40160791
3  -0.9867557 -0.9766422 -0.9933990 -0.9873282 -0.21668507 -0.01726417
4  -0.9871913 -0.9928104 -0.9916460 -0.9886776  0.21686246 -0.13524536
5  -0.9886664 -0.9859818 -0.9919558 -0.9879443 -0.15334258 -0.08840273
6  -0.9807784 -0.9852871 -0.9916595 -0.9853661 -0.36303968 -0.13323831
7  -0.9784560 -0.9887881 -0.9884058 -0.9811471 -0.30712543 -0.34567235
8  -0.9803608 -0.9896004 -0.9859172 -0.9796810 -0.08813590 -0.20811515
9  -0.9840280 -0.9913759 -0.9935160 -0.9896288 -0.18405460  0.17672726
10 -0.9774530 -0.9858691 -0.9868624 -0.9837876 -0.17276785 -0.24908480
11 -0.9772719 -0.9854689 -0.9884639 -0.9839489 -0.27981371 -0.05103577
12 -0.9951279 -0.9946153 -0.9950950 -0.9963724  0.07693801 -0.10682122
          V454       V503       V504        V513       V516       V517
1   0.54715105 -0.9521547 -0.9561340 -0.08843612 -0.9937257 -0.9937550
2  -0.06817833 -0.9808566 -0.9758658 -0.04414989 -0.9903355 -0.9919603
3  -0.11072029 -0.9877948 -0.9890155  0.25789914 -0.9892801 -0.9908667
4  -0.04972798 -0.9875187 -0.9867420  0.07358150 -0.9927689 -0.9916998
5  -0.16223039 -0.9935909 -0.9900635  0.39431033 -0.9955228 -0.9943890
6   0.19483324 -0.9948360 -0.9952833  0.43796212 -0.9947329 -0.9951562
7  -0.07924550 -0.9821347 -0.9847729  0.21996177 -0.9878858 -0.9905461
8  -0.07598939 -0.9821841 -0.9751195 -0.10976272 -0.9898514 -0.9897903
9   0.21279994 -0.9831308 -0.9766829  0.08376704 -0.9920726 -0.9928901
10 -0.06097840 -0.9849940 -0.9890231  0.42582119 -0.9823168 -0.9840570
11  0.09882920 -0.9856966 -0.9871887  0.38084257 -0.9847630 -0.9866171
12  0.26552128 -0.9951378 -0.9967139  0.51963263 -0.9947294 -0.9948017
        V526       V529       V530        V539       V542       V543
1  0.3469885 -0.9801349 -0.9613094 -0.12898890 -0.9919904 -0.9906975
2  0.5320605 -0.9882956 -0.9833219 -0.27195846 -0.9958539 -0.9963995
3  0.6607950 -0.9892548 -0.9860277 -0.21272790 -0.9950305 -0.9951274
4  0.6789213 -0.9894128 -0.9878358 -0.03568420 -0.9952207 -0.9952369
5  0.5590577 -0.9914330 -0.9890594 -0.27358201 -0.9950928 -0.9954648
6  0.2469096 -0.9905000 -0.9858609 -0.29732906 -0.9951433 -0.9952387
7  0.2901766 -0.9882692 -0.9845685 -0.25703213 -0.9956415 -0.9946391
8  0.2497989 -0.9894306 -0.9870648 -0.19727152 -0.9956291 -0.9945068
9  0.2723424 -0.9916293 -0.9917587  0.07341721 -0.9952604 -0.9960072
10 0.2508836 -0.9847879 -0.9803878 -0.13996636 -0.9909812 -0.9905994
11 0.5018756 -0.9834584 -0.9811784 -0.04715901 -0.9913143 -0.9892975
12 0.6993621 -0.9965033 -0.9955226  0.09899647 -0.9976523 -0.9978751
          V552
1  -0.07432303
2   0.15807454
3   0.41450281
4   0.40457253
5   0.08775301
6   0.01995331
7   0.14584351
8   0.13638192
9   0.31403783
10  0.26738250
11  0.12050339
12  0.35144181
 [ reached 'max' / getOption("max.print") -- omitted 10287 rows ]


3. Використовує описові назви діяльностей (activity) для найменування
діяльностей у наборі даних.

> factor <- factor(result$activity)
> levels(factor) <- activity_labels[,2]
> result$activity <- factor


5. З набору даних з кроку 4 створити другий незалежний акуратний набір
даних (tidy dataset) із середнім значенням для кожної змінної для кожної
діяльності та кожного суб’єкту (subject).

install.packages("reshape2")
library("reshape2")
> meltedDataFrame <- melt(result,(id.vars=c("subject","activity")))
> secondDataSet <- dcast(meltedDataFrame, subject + activity ~ variable, mean)
> secondDataSet
subject           activity        V1           V2         V3          V4
1        1            WALKING 0.2773308 -0.017383819 -0.1111481 -0.28374026
2        1   WALKING_UPSTAIRS 0.2554617 -0.023953149 -0.0973020 -0.35470803
3        1 WALKING_DOWNSTAIRS 0.2891883 -0.009918505 -0.1075662  0.03003534
4        1            SITTING 0.2612376 -0.001308288 -0.1045442 -0.97722901
5        1           STANDING 0.2789176 -0.016137590 -0.1106018 -0.99575990
6        1             LAYING 0.2215982 -0.040513953 -0.1132036 -0.92805647
7        2            WALKING 0.2764266 -0.018594920 -0.1055004 -0.42364284
8        2   WALKING_UPSTAIRS 0.2471648 -0.021412113 -0.1525139 -0.30437641
9        2 WALKING_DOWNSTAIRS 0.2776153 -0.022661416 -0.1168129  0.04636668
10       2            SITTING 0.2770874 -0.015687994 -0.1092183 -0.98682228
11       2           STANDING 0.2779115 -0.018420827 -0.1059085 -0.98727189
12       2             LAYING 0.2813734 -0.018158740 -0.1072456 -0.97405946
             V5          V6        V41        V42         V43        V44
1   0.114461337 -0.26002790  0.9352232 -0.2821650 -0.06810286 -0.9766096
2  -0.002320265 -0.01947924  0.8933511 -0.3621534 -0.07540294 -0.9563670
3  -0.031935943 -0.23043421  0.9318744 -0.2666103 -0.06211996 -0.9505598
4  -0.922618642 -0.93958629  0.8315099  0.2044116  0.33204370 -0.9684571
5  -0.973190056 -0.97977588  0.9429520 -0.2729838  0.01349058 -0.9937630
6  -0.836827406 -0.82606140 -0.2488818  0.7055498  0.44581772 -0.8968300
7  -0.078091253 -0.42525752  0.9130173 -0.3466071  0.08472709 -0.9726932
8   0.108027280 -0.11212102  0.7907174 -0.4162149 -0.19588824 -0.9344077
9   0.262881789 -0.10283791  0.8618313 -0.3257801 -0.04388902 -0.9403618
10 -0.950704499 -0.95982817  0.9404773 -0.1056300  0.19872677 -0.9799888
11 -0.957304989 -0.94974185  0.8969286 -0.3700627  0.12974716 -0.9866858
12 -0.980277399 -0.98423330 -0.5097542  0.7525366  0.64683488 -0.9590144
          V45        V46        V81           V82          V83         V84
1  -0.9713060 -0.9477172 0.07404163  0.0282721096 -0.004168406 -0.11361560
2  -0.9528492 -0.9123794 0.10137273  0.0194863076 -0.045562545 -0.44684389
3  -0.9370187 -0.8959397 0.05415532  0.0296504490 -0.010971973 -0.01228386
4  -0.9355171 -0.9490409 0.07748252 -0.0006191028 -0.003367792 -0.98643071
5  -0.9812260 -0.9763241 0.07537665  0.0079757309 -0.003685250 -0.99460454
6  -0.9077200 -0.8523663 0.08108653  0.0038382040  0.010834236 -0.95848211
7  -0.9721169 -0.9720728 0.06180807  0.0182492679  0.007895337 -0.27753046
8  -0.9237675 -0.8780041 0.07445078 -0.0097098551  0.019481439 -0.27612189
9  -0.9400685 -0.9314383 0.11004062 -0.0032795908 -0.020935168  0.14724914
10 -0.9567503 -0.9544159 0.07225644  0.0116954511  0.007605469 -0.98805585
11 -0.9741944 -0.9459271 0.07475886  0.0103291775 -0.008371588 -0.98108572
12 -0.9882119 -0.9842304 0.08259725  0.0122547885 -0.001802649 -0.98587217
           V85        V86        V121         V122       V123       V124
1   0.06700250 -0.5026998 -0.04183096 -0.069530046 0.08494482 -0.4735355
2  -0.37827443 -0.7065935  0.05054938 -0.166170015 0.05835955 -0.5448711
3  -0.10160139 -0.3457350 -0.03507819 -0.090937129 0.09008501 -0.4580305
4  -0.98137197 -0.9879108 -0.04535006 -0.091924155 0.06293138 -0.9772113
5  -0.98564873 -0.9922512 -0.02398773 -0.059397221 0.07480075 -0.9871919
6  -0.92414927 -0.9548551 -0.01655309 -0.064486124 0.14868944 -0.8735439
7  -0.01660224 -0.5860904 -0.05302582 -0.048238232 0.08283366 -0.5615503
8  -0.18564895 -0.5737464 -0.05769126 -0.032088310 0.06883740 -0.4392531
9   0.12682801 -0.3401220 -0.11594735 -0.004823292 0.09717381 -0.3207892
10 -0.97798396 -0.9875182 -0.04547066 -0.059928680 0.04122775 -0.9857420
11 -0.97105944 -0.9828414 -0.02386239 -0.082039658 0.08783517 -0.9729986
12 -0.98317254 -0.9884420 -0.01847661 -0.111800825 0.14488285 -0.9882752
           V125       V126        V161        V162        V163       V164
1  -0.054607769 -0.3442666 -0.08999754 -0.03984287 -0.04613093 -0.2074219
2   0.004105184 -0.5071687 -0.12223277 -0.04214859 -0.04071255 -0.6147865
3  -0.126349195 -0.1247025 -0.07395920 -0.04399028 -0.02704611 -0.4870273
4  -0.966473895 -0.9414259 -0.09367938 -0.04021181 -0.04670263 -0.9917316
5  -0.987734440 -0.9806456 -0.09960921 -0.04406279 -0.04895055 -0.9929451
6  -0.951090440 -0.9082847 -0.10727095 -0.04151729 -0.07405012 -0.9186085
7  -0.538453668 -0.4810855 -0.08188334 -0.05382994 -0.05149392 -0.3895498
8  -0.466298337 -0.1639958 -0.08288580 -0.04240537 -0.04451575 -0.4648544
9  -0.415739145 -0.2794184 -0.05810385 -0.04214703 -0.07102298 -0.2439406
10 -0.978919527 -0.9598037 -0.09363284 -0.04156020 -0.04358510 -0.9897090
11 -0.971441996 -0.9648567 -0.10556216 -0.04224195 -0.05465395 -0.9793240
12 -0.982291609 -0.9603066 -0.10197413 -0.03585902 -0.07017830 -0.9932358
         V165       V166        V201        V202        V214        V215
1  -0.3044685 -0.4042555 -0.13697118 -0.21968865 -0.13697118 -0.21968865
2  -0.6016967 -0.6063320 -0.12992763 -0.32497093 -0.12992763 -0.32497093
3  -0.2388248 -0.2687615  0.02718829  0.01988435  0.02718829  0.01988435
4  -0.9895181 -0.9879358 -0.94853679 -0.92707842 -0.94853679 -0.92707842
5  -0.9951379 -0.9921085 -0.98427821 -0.98194293 -0.98427821 -0.98194293
6  -0.9679072 -0.9577902 -0.84192915 -0.79514486 -0.84192915 -0.79514486
7  -0.6341404 -0.4354927 -0.29040759 -0.42254417 -0.29040759 -0.42254417
8  -0.6454913 -0.4675960 -0.10732268 -0.20597705 -0.10732268 -0.20597705
9  -0.4693967 -0.2182663  0.08995112  0.21558633  0.08995112  0.21558633
10 -0.9908896 -0.9855423 -0.96789362 -0.95308144 -0.96789362 -0.95308144
11 -0.9834473 -0.9736101 -0.96587518 -0.95787497 -0.96587518 -0.95787497
12 -0.9895675 -0.9880358 -0.97743549 -0.97287391 -0.97743549 -0.97287391
           V227        V228        V240       V241       V253       V254
1  -0.141428809 -0.07447175 -0.16097955 -0.1869784 -0.2987037 -0.3253249
2  -0.466503446 -0.47899162 -0.12673559 -0.1486193 -0.5948829 -0.6485530
3  -0.089447481 -0.02578772 -0.07574125 -0.2257244 -0.2954638 -0.3065106
4  -0.987364196 -0.98412002 -0.93089249 -0.9345318 -0.9919763 -0.9883087
5  -0.992367791 -0.99309621 -0.97649379 -0.9786900 -0.9949668 -0.9947332
6  -0.954396265 -0.92824563 -0.87475955 -0.8190102 -0.9634610 -0.9358410
7  -0.281424154 -0.16415099 -0.44654909 -0.5530199 -0.5479120 -0.5577982
8  -0.321268911 -0.21738939 -0.21971347 -0.3775322 -0.5728164 -0.5972917
9   0.005655163  0.22961719 -0.16218859 -0.2748441 -0.4108727 -0.3431879
10 -0.986774713 -0.98447587 -0.94603509 -0.9613136 -0.9910815 -0.9895949
11 -0.980489077 -0.97667528 -0.96346634 -0.9539434 -0.9839519 -0.9772044
12 -0.987741696 -0.98551808 -0.95001157 -0.9611641 -0.9917671 -0.9897181
          V266         V267       V268        V269        V270        V271
1  -0.20279431  0.089712726 -0.3315601 -0.31913472  0.05604001 -0.27968675
2  -0.40432178 -0.190976721 -0.4333497 -0.33742819  0.02176951  0.08595655
3   0.03822918  0.001549908 -0.2255745  0.02433084 -0.11296374 -0.29792789
4  -0.97964124 -0.944084550 -0.9591849 -0.97641231 -0.91727501 -0.93446956
5  -0.99524993 -0.977070848 -0.9852971 -0.99602835 -0.97229310 -0.97793726
6  -0.93909905 -0.867065205 -0.8826669 -0.92443743 -0.83362556 -0.81289156
7  -0.34604816 -0.021904810 -0.4538064 -0.45765138 -0.16921969 -0.45522215
8  -0.26672093  0.009924459 -0.2810020 -0.32058241  0.08488028 -0.09454498
9   0.11284116  0.278345042 -0.1312908  0.01610462  0.17197397 -0.16203289
10 -0.98580384 -0.957343498 -0.9701622 -0.98736209 -0.95007375 -0.95686286
11 -0.98394674 -0.959871697 -0.9624712 -0.98905647 -0.95790884 -0.94643358
12 -0.97672506 -0.979800878 -0.9843810 -0.97324648 -0.98102511 -0.98479218
          V294        V295        V296        V345        V346       V347
1  -0.20754837  0.11309365  0.04972652 -0.17054696 -0.03522552 -0.4689992
2  -0.41873500 -0.16069721 -0.52011479 -0.47987525 -0.41344459 -0.6854744
3  -0.30739520  0.06322008  0.29432270 -0.02766387 -0.12866716 -0.2883347
4  -0.04951360  0.07594608  0.23882987 -0.98659702 -0.98157947 -0.9860531
5   0.08651536  0.11747895  0.24485859 -0.99463080 -0.98541870 -0.9907522
6  -0.15879267  0.09753484  0.08943766 -0.95707388 -0.92246261 -0.9480609
7  -0.14579549  0.19858647  0.06889952 -0.30461532 -0.07876408 -0.5549567
8  -0.28174801 -0.06188945 -0.23658909 -0.25863944 -0.18784213 -0.5227281
9  -0.27371161  0.01193096  0.09036785  0.13812068  0.09620916 -0.2714987
10  0.08519282  0.15019396  0.09606468 -0.98784879 -0.97713970 -0.9851291
11  0.10851918  0.06233781  0.10446250 -0.98097324 -0.97085134 -0.9797752
12 -0.14648279  0.25728947  0.40253255 -0.98581363 -0.98276825 -0.9861971
          V348        V349       V350        V373        V374         V375
1  -0.13358661  0.10673986 -0.5347134 -0.20926197 -0.38623714 -0.185530281
2  -0.46190703 -0.38177707 -0.7260402 -0.37702313 -0.50949553 -0.551104284
3  -0.08632790 -0.13458001 -0.4017215 -0.25316434 -0.33758970  0.009372239
4  -0.98749299 -0.98251391 -0.9883392  0.25661082  0.04754378  0.092392003
5  -0.99507376 -0.98701823 -0.9923498  0.31418294  0.03916190  0.138581479
6  -0.96416071 -0.93221787 -0.9605870  0.13241909  0.02451362  0.024387945
7  -0.31431306 -0.01533295 -0.6158982 -0.07271016 -0.26357402 -0.254846439
8  -0.36541544 -0.24355415 -0.6250910 -0.04911429 -0.28768889 -0.374218485
9   0.04995906  0.08083335 -0.4082274 -0.14389815 -0.35751450 -0.234703932
10 -0.98945911 -0.98080423 -0.9885708  0.30554682  0.02624486  0.092903063
11 -0.98300792 -0.97352024 -0.9845999  0.33144928 -0.05693683  0.039649818
12 -0.98725026 -0.98498739 -0.9893454  0.15980833  0.12120642  0.190558218
         V424        V425        V426       V427        V428       V429
1  -0.3390322 -0.10305942 -0.25594094 -0.5166919 -0.03350816 -0.4365622
2  -0.4926117 -0.31947461 -0.45359721 -0.5658925  0.15153891 -0.5717078
3  -0.3524496 -0.05570225 -0.03186943 -0.4954225 -0.18141473 -0.2384436
4  -0.9761615 -0.97583859 -0.95131554 -0.9779042 -0.96234504 -0.9439178
5  -0.9863868 -0.98898446 -0.98077312 -0.9874971 -0.98710773 -0.9823453
6  -0.8502492 -0.95219149 -0.90930272 -0.8822965 -0.95123205 -0.9165825
7  -0.4297135 -0.55477211 -0.39665991 -0.6040530 -0.53304695 -0.5598566
8  -0.3316436 -0.48808612 -0.24860112 -0.4763588 -0.45975849 -0.2180725
9  -0.1457760 -0.36191382 -0.08749447 -0.3794367 -0.45873275 -0.4229877
10 -0.9826214 -0.98210092 -0.95981482 -0.9868085 -0.97735619 -0.9635227
11 -0.9670371 -0.97257615 -0.96062770 -0.9749881 -0.97103605 -0.9697543
12 -0.9864311 -0.98332164 -0.96267189 -0.9888607 -0.98191062 -0.9631742
           V452        V453          V454        V503        V504        V513
1   0.014784499 -0.06577462  0.0007733216 -0.12862345 -0.39803259  0.19064372
2  -0.187450248 -0.47357479 -0.1333739043 -0.35239594 -0.41626010 -0.09774335
3  -0.100453729  0.08255115 -0.0756762068  0.09658453 -0.18653030  0.11918714
4   0.189153021  0.06312707 -0.0297839207 -0.94778292 -0.92844480  0.23665501
5  -0.120293021 -0.04471920  0.1006076351 -0.98535636 -0.98231380  0.28455529
6  -0.003546796 -0.09152913  0.0104581257 -0.86176765 -0.79830094  0.08640856
7   0.007279680 -0.04270093  0.1397521153 -0.32428943 -0.57710521  0.39320621
8  -0.115324434 -0.13035785 -0.0773418117 -0.14531854 -0.36672824  0.10768040
9  -0.037529802  0.07708946  0.1367749584  0.29342483 -0.02147879  0.09383213
10  0.130523121 -0.19214274  0.0409472349 -0.96127375 -0.95557560  0.13093420
11 -0.107416045 -0.17116037  0.0002268106 -0.96405217 -0.96051938  0.11964996
12  0.102611319  0.04228067  0.0552985986 -0.97511020 -0.97512139  0.26629821
          V516       V517        V526       V529       V530          V539
1  -0.05711940 -0.1034924  0.09382218 -0.1992526 -0.3210180  0.2688443675
2  -0.44265216 -0.5330599  0.08535241 -0.3259615 -0.1829855 -0.2193033761
3   0.02621849 -0.1040523  0.07649155 -0.1857203 -0.3983504  0.3496138955
4  -0.98526213 -0.9816062  0.35185220 -0.9584356 -0.9321984 -0.0002621867
5  -0.99254248 -0.9925360  0.42222010 -0.9846176 -0.9784661 -0.0286057725
6  -0.93330036 -0.9218040  0.26639115 -0.8621902 -0.8243194 -0.1397750127
7  -0.16906435 -0.1640920  0.20750093 -0.5307048 -0.6517928  0.3052838253
8  -0.18951114 -0.2604238 -0.01191682 -0.4506122 -0.4386204 -0.0227527690
9   0.22224741  0.2274807  0.01883551 -0.3208385 -0.3725768  0.1039712417
10 -0.98387470 -0.9841242  0.28006242 -0.9718406 -0.9613857 -0.1063589092
11 -0.97706530 -0.9751605  0.30487187 -0.9617759 -0.9567887 -0.0661266046
12 -0.98537411 -0.9845685  0.34175857 -0.9721130 -0.9610984  0.0185644722
         V542       V543        V552
1  -0.3193086 -0.3816019  0.19066345
2  -0.6346651 -0.6939305  0.11427734
3  -0.2819634 -0.3919199  0.19000071
4  -0.9897975 -0.9870496  0.18477593
5  -0.9948154 -0.9946711  0.33449873
6  -0.9423669 -0.9326607  0.17648591
7  -0.5832493 -0.5581046  0.12634461
8  -0.6007985 -0.6218202  0.04674340
9  -0.3801753 -0.3436990 -0.05124796
10 -0.9898620 -0.9896329  0.19472215
11 -0.9778498 -0.9777543  0.16066282
12 -0.9902487 -0.9894927  0.26480151
 [ reached 'max' / getOption("max.print") -- omitted 168 rows ]
write.table(secondDataSet, "tidy_data.txt", sep = ",")
