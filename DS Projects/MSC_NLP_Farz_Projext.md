# UNDERSTANDING THE SPACE OF FACEBOOK POLITICAL ADVERTS USING TOPIC MODELLING- #

The aim of this project was to understand the space of Facebook political adverts (i.e. by topic), 
as well as differences by timing, party, type of source (e.g. local political actors, campaigners, national parties) 
using automated content analysis, will provide meaningful insights of the inner workings of the political ad domain to the community.
 
In the project, I implemented topic modelling on political advert texts to detect latent topics and 
temporal trends with the dataset. By conducting a series of experiments, I finally landed on the optimal topic model 
I used to answer the research questions.
 
# Introduction #

Natural Language Processing is a Machine Learning method used to teach computers how to understand natural human language. It is not an easy task to teach these languages to a computer, but with the help of **NLP** process it's possible for the computer to read, decipher, understand, and make sense of the human languages in a manner that is valuable. 

In machine learning and natural language processing, a **topic model** is a statistical model used for discovering the abstract "topics" that occur in a collection of documents or in a corpus. A topic is a collection of dominant keywords that express the general meaning of the text.

NLP could be used to extract topics from reviews, social media feeds, comments, articles, emails as well as user feedbacks. Understanding what customers are talking about in a particular product is very vital to companies especially e-commerce industry. However, since these online reviews are quite often overwhelming in terms of numbers and information, an intelligent system, capable of finding key insights (topics) from these reviews, will be of great help for both customers and companies.


I took a lot of inspiration from [Alice Zhao's](https://github.com/adashofdata/nlp-in-python-tutorial) project on Topic modeling and Sentiment Analysis

One of the most effective ways of doing topic modeling is by using Gensim LDA model. 

# Project objective #
  **Abstract**
  Political campaigns are increasingly carried out online, giving activists new opportunities to target and personalize campaign materials for different audiences. This has changed the information landscape, affecting the democratic ideal of an informed population. Therefore, decision-makers have argued that voters must receive additional information through transparent disclosures, where I found this research idea fits well. Studies with computer-aided content analysis of specifically the political text adverts to extract topics is ongoing research domain in political research which still lacks good-practice guidelines and depth. With my research I aim bridge the gap stepping up from general topic exploration following psychological research methodology to justifying the analysis procedure.

**Problem Statement**- The aim of this project is to understand the space of political adverts (ie by topic) as well as differences by timing and parties.

**Actions and final objective-**

The model will be built using political data to extract topics.
Adverts lying in outliers will be considered to be fraud.
Coherence scores will be used to evaluate model performance
  # Tools and Libraries used #

* numpy==1.20.1
* pandas==1.2.4
* matplotlib==3.3.4
* seaborn==0.11.1
* re==2.2.1
* nltk==3.6.1
* gensim==3.8.3
* spacy==3.1.1
* pyLDAvis==2.1.2
* logging==0.5.1.2
* umap==0.5.1
* texthero==1.1.0
* matplotlib==3.3.4
* pickleshare==0.7.5
* hdbscan==0.8.27
  
## Dataset ##

    Source:Fowler, E., Franz, M. King, G., Martin, G.; Mukerjee, Z.; Persily, N. (2019) "Facebook Ad Library", https://doi.org/10.7910/DVN/9OAMBW, Harvard Dataverse, V1.
    

        
    Data content:
   ![image](https://user-images.githubusercontent.com/66571017/132332987-29ae972c-67a9-4ee8-9901-570648a59053.png)
   ![image](https://user-images.githubusercontent.com/66571017/132333060-3c78d6d5-5116-4bee-977b-48dda1205344.png)

    

# Project Process #
* I got the datasets from   
   * load dataset in one dataframe
   * check the data info, type, shape and null values
* Pre-processing
   * Drop some unwanted columns
   * Do some feature engineering
   * Remove stop-words with NLTK
   * Remove number from text with regular expression function
   * Lower the text and remove words lower than 3 letters
 
* EDA
    * Do some visualization, e.g wordcloud to uderstand the common words in the ads
    * 
* LDA Model fitting for topic modeling 
   * Create a dictionatry and a corpus with the ad text  
   * Try out LDA models  to see the one with the highest coherence score and with meaningful topics from the text

* Visualization
   * Plot the the topics PyLDAviz
  
*  Communicate insights
   * Conclusion
   * Future work to improve the project
     
![image](https://github.com/farz1313/Farz-Projects/assets/66571017/8d836ea1-0b26-49b5-a04f-240d7995f637)

![image-2](https://github.com/farz1313/Farz-Projects/assets/66571017/36e02457-d7d2-434b-90cd-c0180af94a79)

![image-3](https://github.com/farz1313/Farz-Projects/assets/66571017/b8e8a1dc-76ba-45bb-adc3-d8e99ef51383)
