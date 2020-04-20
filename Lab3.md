```r
> install.packages("rvest")
> install.packages('xml2')
> library('xml2')
> html <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature")
> install.packages('selectr')
> rank_html <- rvest::html_nodes(url,'.text-primary')
> rank_data <- rvest::html_text(html)
> rank_data <- as.numeric(rank_data)
> title_html <- html_nodes(url,'.lister-item-header a')
> title_data <- html_text(title_html)
> runtime_html <- html_nodes(url,'.text-muted .runtime')
> runtime_data <- html_text(runtime_html)
> runtime_data <- gsub(" min", "", runtime)
> runtime_data <- as.numeric(runtime)
> movies <- data.frame(Rank = rank_data, Title = title_data, Runtime = runtime_data, stringsAsFactors = FALSE)
```
1. Виведіть перші 6 назв фільмів дата фрейму
```r
> head(movies$Title, 6)
[1] "Molly's Game"                 "Call Me by Your Name"        
[3] "Blade Runner 2049"            "The Greatest Showman"        
[5] "Thor: Ragnarok"               "The Killing of a Sacred Deer"
```
2. Виведіть всі назви фільмів с тривалістю більше 120 хв.
```r
> movies[movies$Runtime > 120, ]$Title
 [1] "Molly's Game"                                    
 [2] "Call Me by Your Name"                            
 [3] "Blade Runner 2049"                               
 [4] "Thor: Ragnarok"                                  
 [5] "The Killing of a Sacred Deer"                    
 [6] "It"                                              
 [7] "Guardians of the Galaxy Vol. 2"                  
 [8] "Star Wars: Episode VIII - The Last Jedi"         
 [9] "Lady Bird"                                       
[10] "Spider-Man: Homecoming"                          
[11] "Pirates of the Caribbean: Dead Men Tell No Tales"
[12] "Beauty and the Beast"                            
[13] "War for the Planet of the Apes"                  
[14] "The Shape of Water"                              
[15] "Logan"                                           
[16] "What Happened to Monday"                         
[17] "Wonder Woman"                                    
[18] "Mother!"                                         
[19] "John Wick: Chapter 2"                            
[20] "Alien: Covenant"                                 
[21] "King Arthur: Legend of the Sword"                
[22] "Transformers: The Last Knight"                   
[23] "Darkest Hour"                                    
[24] "Papillon"                                        
[25] "The Upside"                                      
[26] "Phantom Thread"                                  
[27] "Kingsman: The Golden Circle"                     
[28] "Valerian and the City of a Thousand Planets"     
[29] "Ghost Stories"                                   
[30] "The Fate of the Furious"                         
[31] "Pitch Perfect 3"                                 
[32] "Power Rangers"                                   
[33] "You Were Never Really Here"                      
[34] "Hostiles"                                        
[35] "It Comes At Night"                               
[36] "The Babysitter"                                  
[37] "Sniper: Ultimate Kill"                           
[38] "The Dark Tower"                                  
[39] "The Ritual"                                      
[40] "47 Meters Down"                                  
[41] "The Shack"                                       
[42] "Downsizing"                                      
[43] "All the Money in the World"                      
[44] "2:22"                                            
[45] "Shot Caller"                                     
[46] "Happy Death Day"                                 
[47] "Aftermath"
```
3. Скільки фільмів мають тривалість менше 100 хв.
```r
> length(movies[movies$Runtime < 100, ]$Title)
[1] 0
```