
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A spatial analysis of the environmental correlates of COVID-19 incidence in Spain

Antonio Paez (McMaster University)  
Fernando A. Lopez (Universidad Politecnica de Cartagena)  
Tatiane Menezes (Universidade Federal de Pernambuco)  
Renata Cavalcanti (Universidade Federal de Pernambuco)  
Maira Galdino da Rocha Pitta (Universidade Federal de Pernambuco)

## Abstract

Spreading with astonishing speed, the novel SARS-CoV2 has swept the
globe, causing enormous stress to health systems and prompting social
distance guidelines and mandates to arrest its progress. While there is
encouraging evidence that early public health interventions have slowed
the spread of the virus, this has come at a high cost as the global
economy is brought to its knees. How and when to ease restrictions to
movement hinges in part on the question whether SARS-CoV2 will display
seasonality associated with variations in temperature and humidity. In
this research, we address this question by means of a spatial analysis
of the incidence of COVID-19 in the provinces in Spain. Use of a spatial
Seemingly Unrelated Regressions (SUR) approach allows us to model the
incidence of reported cases of the disease per 100,000 population, as a
function of temperature and humidity, while controlling for GDP per
capita, population density, percentage of older adults in the
population, and presence of mass transit systems. An interesting aspect
of the spatial SUR approach is that it models incidence as a contagion
process. Our results indicate that incidence of the disease is lower at
higher temperatures. The evidence with respect to humidity is more
mixed, with coefficients for this variable that are significant in only
some equations. Our control variables also yield interesting insights,
as population density and percentage of older adults display negative
associations with incidence of COVID-19, whereas the presence of mass
transit systems in the province is associated with a greater incidence
of the disease.

## Keywords

SARS-CoV2  
COVID-19  
Temperature  
Humidity  
Spatial SUR  
Contagion  
Spain

## Introduction

From a small outbreak linked to a live animal market at the end of 2019
to a global pandemic in a matter of weeks, the SARS-CoV2 virus has
threatened to overrun health systems the world over. In efforts to
contain the spread, numerous governments in many nations and regions
have either recommended or mandated social distancing measures, and as
of this writing, millions of people in five continents shelter in place.
There are encouraging signs that these measures have arrested the spread
of the virus where they have been implemented, and have thus helped to
keep a bad situation from becoming even worse (e.g., 2020). However,
this has come at a high cost, and the consequences for all spheres of
the economy, social, and cultural life have been dire (e.g., Fernandes
2020; Luo and Tsang 2020). As a result, there is a sense of urgency to
anticipate the progression of the pandemic, in order to plan for
progressive lifting of restrictions to movement and social contact
(e.g., Kissler et al. 2020). Needless to say, this has become a
delicate, and politically charged, balancing act between public health
and the economy (Gong et al. 2020).

A salient question in the debate on how and when to ease social
distancing measures is whether the virus will display seasonal
variations. Earlier, diverse studies have shown the effect of
temperature and humidity on the incidence of influenza (e.g., Mäkainen
et al. 2009; Jaakkola et al. 2014; Kudo et al. 2019). Jaakkola et
al. (2014), for example, found that a decrease of temperature and
absolute humidity precedes the onset of symptoms of influenza A and B
viruses by 3 days in places where the temperature is low. After the
2002-2004 outbreak of SARS, researchers also began to investigate the
relationship between these factors and SARS-CoV. In this way, Casanova
et al. (2010) used two surrogates, namely the gastroenteritis (TGEV) and
mouse hepatitis viruses (MHV), to find that virus inactivation was more
rapid at temperatures of 20C than 4C, and at 40C than 20C; in terms of
humidity, these researchers reported that survival of the virus was
lower at moderate relative humidity levels. In a similar vein, but
working directly with SARS-CoV, Chan et al. (2011) found that viability
of the virus was lost at temperatures higher than 38C and relative
humidity superior to 95%.

While existing research on similar pathogens suggests that SARS-CoV is
more stable and potentially easier to transmit in conditions of low
temperature and low humidity, it is far from certain that this will also
be the case with the novel SARS-CoV2. If such is the case, there is the
possibility of easing restrictions to social contact as the weather
warms; however, weeks or possibly months of costly measures could become
undone if not, and the restrictions are lifted prematurely. Not
surprisingly, given the stakes involved, this issue has already
triggered a lively debate.

Some of what is thought about the possible seasonality of COVID-19 is
based on analogies to the patterns of other known respiratory viruses.
However, de Ángel Solá et al. (2020) note that “not all seasonal
respiratory viruses experience the same spatiotemporal patterns”
(section 4). This urges caution when extrapolating from known viruses,
and indeed, the evidence in this respect is inconclusive. At a global
scale, whereas de Ángel Solá et al. (2020) see less risk in the Caribean
Basin, Coelho et al. (Coelho et al. 2020) warn that at least during the
exponential phase, expansion of the virus is not driven by climate.
Similarly, whereas Araujo and Naimi (2020) argue that spread of
SARS-CoV2 will likely be constrained by climate, Harbert et al. (2020)
remain unconvinced that spatial modelling can currently discriminate the
distribution of the disease on the basis of climate, at least in the
United States. To further complicate matters, much of the relevant work
has yet to be peer-reviewed and therefore is open to change (see for
example the challenge of Harbert, Cunningham, and Tessler (2020) to
Araujo and Naimi (2020)). In the United States, the National Academy of
Sciences, Engineering, and Medicine was engaged by the Office of the
Executive for guidance on this matter (see National Academies of
Sciences, Engineering and Medicine 2020). Their conclusion summarizes
the situation well (see p. 6): “Some limited data support a potential
waning of cases in warmer and more humid seasons, yet none are without
major limitations…Additional studies as the SARS-CoV-2 pandemic unfolds
could shed more light on the effects of climate on transmission.”

With the above considerations in mind, our objective with this paper is
to contribute to the knowledge basis regarding the spread of COVID-19
and the influence of environmental factors, particularly temperature and
humidity. Hence, here we report results from a spatial analysis of
incidence of COVID-19 in fifty provinces in Spain. Spain is one of the
countries hardest hit by the virus, and enacted lockdown measures on
March 16, 2020, in response to a rapidly growing outbreak of COVID-19.
We combine data on reported cases of the disease with metereological
information, to create a spatio-temporal dataset covering a period of 30
days. We then join this dataset with provincial-level economic and
demographic information to act as controls to our key environmental
variables. These data are analyzed using a spatial Seemingly Unrelated
Regressions (SUR) approach, which allows us to model incidence of
COVID-19 as a spatial contagion process.

The results provide evidence of the effect of temperature on the
incidence of COVID-19. The evidence concerning humidity is more mixed:
while the direction of the effect is negative, as anticipated, the
coefficients for this variable are only significant in some of equations
in the system. Our control variables also provide some intriguing
insights. The results of this analysis provide support to the hypothesis
of seasonality of the novel SARS-CoV2, and should be of interest to
public health officials and policy makers wrestling with the question of
the trajectory of the pandemic.

Please note that this paper is prepared as a reproducible research
document. The source R Markdown document, as well as all data and code
needed to reproduce/review/extend the analysis can be obtained from the
following repository:

<https://github.com/paezha/covid19-environmental-correlates>

## Acknowledgments

The following `R` packages were used in the course of this investigation
and the authors wish to acknowledge their developers: `ggthemes` (Arnold
2019), `gridExtra` (Auguie 2017), `kableExtra` (Zhu 2019), `knitr` (Xie
2014, 2015), `lubridate` (Grolemund and Wickham 2011), `plm` (Millo
2017), `rticles` (Allaire et al. 2020), `sf` (Pebesma 2018), `spdep`
(Bivand, Pebesma, and Gomez-Rubio 2013), spsur (Angulo et al. 2020)
`tidyverse` (Wickham et al. 2019), `units` (Pebesma, Mailund, and
Hiebert 2016).

## References

<div id="refs" class="references">

<div id="ref-Allaire2020">

Allaire, JJ, Yihui Xie, R Foundation, Hadley Wickham, Journal of
Statistical Software, Ramnath Vaidyanathan, Association for Computing
Machinery, et al. 2020. *Rticles: Article Formats for R Markdown*.
<https://CRAN.R-project.org/package=rticles>.

</div>

<div id="ref-Angulo2020spsur">

Angulo, Ana, Fernando A Lopez, Roman Minguez, and Jesus Mur. 2020.
*Spsur: Spatial Seemingly Unrelated Regression Models*.
<http://github.com/rominsal/spsur>.

</div>

<div id="ref-Araujo2020spread">

Araujo, Miguel B, and Babak Naimi. 2020. “Spread of Sars-Cov-2
Coronavirus Likely to Be Constrained by Climate.” Journal Article.
*medRxiv*.

</div>

<div id="ref-Arnold2019">

Arnold, Jeffrey B. 2019. *Ggthemes: Extra Themes, Scales and Geoms for
’Ggplot2’*. <https://CRAN.R-project.org/package=ggthemes>.

</div>

<div id="ref-Auguie2017gridextra">

Auguie, Baptiste. 2017. *GridExtra: Miscellaneous Functions for "Grid"
Graphics*. <https://CRAN.R-project.org/package=gridExtra>.

</div>

<div id="ref-deangel2020weathering">

Ángel Solá, David E de, Leyao Wang, Marietta Vázquez, and Pablo A Méndez
Lázaro. 2020. “Weathering the Pandemic: How the Caribbean Basin Can Use
Viral and Environmental Patterns to Predict, Prepare and Respond to
Covid‐19.” Journal Article. *Journal of Medical Virology*.

</div>

<div id="ref-Bivand2013">

Bivand, Roger S., Edzer Pebesma, and Virgilio Gomez-Rubio. 2013.
*Applied Spatial Data Analysis with R, Second Edition*. Springer, NY.
<http://www.asdar-book.org/>.

</div>

<div id="ref-Casanova2010effects">

Casanova, Lisa M, Soyoung Jeon, William A Rutala, David J Weber, and
Mark D Sobsey. 2010. “Effects of Air Temperature and Relative Humidity
on Coronavirus Survival on Surfaces.” Journal Article. *Appl. Environ.
Microbiol.* 76 (9): 2712–7.

</div>

<div id="ref-Chan2011effects">

Chan, KH, JS Peiris, SY Lam, LLM Poon, KY Yuen, and WH Seto. 2011. “The
Effects of Temperature and Relative Humidity on the Viability of the
Sars Coronavirus.” Journal Article. *Advances in Virology* 2011.

</div>

<div id="ref-Coelho2020exponential">

Coelho, Marco Tulio Pacheco, Joao Fabricio Mota Rodrigues, Anderson
Matos Medina, Paulo Scalco, Levi Carina Terribile, Bruno Vilela, Jose
Alexandre Felizola Diniz-Filho, and Ricardo Dobrovolski. 2020.
“Exponential Phase of Covid19 Expansion Is Not Driven by Climate at
Global Scale.” Journal Article. *medRxiv*.

</div>

<div id="ref-Fernandes2020economic">

Fernandes, Nuno. 2020. “Economic Effects of Coronavirus Outbreak
(Covid-19) on the World Economy.” Journal Article. *Available at SSRN
3557504*.

</div>

<div id="ref-Gong2020balance">

Gong, Binlei, Shurui Zhang, Lingran Yuan, and Kevin Z Chen. 2020. “A
Balance Act: Minimizing Economic Loss While Controlling Novel
Coronavirus Pneumonia.” Journal Article. *Journal of Chinese
Governance*, 1–20.

</div>

<div id="ref-Grolemund2011dates">

Grolemund, Garrett, and Hadley Wickham. 2011. “Dates and Times Made Easy
with lubridate.” *Journal of Statistical Software* 40 (3): 1–25.
<http://www.jstatsoft.org/v40/i03/>.

</div>

<div id="ref-Harbert2020spatial">

Harbert, Robert S, Seth W Cunningham, and Michael Tessler. 2020.
“Spatial Modeling Cannot Currently Differentiate Sars-Cov-2
Coronavirus and Human Distributions on the Basis of Climate in the
United States.” Journal Article. *medRxiv*.

</div>

<div id="ref-Jaakkola2014decline">

Jaakkola, Kari, Annika Saukkoriipi, Jari Jokelainen, Raija Juvonen,
Jaana Kauppila, Olli Vainio, Thedi Ziegler, Esa Rönkkö, Jouni JK
Jaakkola, and Tiina M Ikäheimo. 2014. “Decline in Temperature and
Humidity Increases the Occurrence of Influenza in Cold Climate.” Journal
Article. *Environmental Health* 13 (1): 22.

</div>

<div id="ref-Kissler2020projecting">

Kissler, Stephen M., Christine Tedijanto, Edward Goldstein, Yonatan H.
Grad, and Marc Lipsitch. 2020. “Projecting the Transmission Dynamics of
Sars-Cov-2 Through the Postpandemic Period.” Journal Article. *Science*,
eabb5793. <https://doi.org/10.1126/science.abb5793>.

</div>

<div id="ref-Kudo2019low">

Kudo, Eriko, Eric Song, Laura J Yockey, Tasfia Rakib, Patrick W Wong,
Robert J Homer, and Akiko Iwasaki. 2019. “Low Ambient Humidity Impairs
Barrier Function and Innate Resistance Against Influenza Infection.”
Journal Article. *Proceedings of the National Academy of Sciences* 116
(22): 10905–10.

</div>

<div id="ref-Lancastle2020impact">

Lancastle, Neil M. 2020. “Is the Impact of Social Distancing on
Coronavirus Growth Rates Effective Across Different Settings? A
Non-Parametric and Local Regression Approach to Test and Compare the
Growth Rate.” Journal Article. *medRxiv*.

</div>

<div id="ref-Luo2020how">

Luo, Shaowen, and Kwok Ping Tsang. 2020. “How Much of China and World
Gdp Has the Coronavirus Reduced?” Journal Article. *Available at SSRN
3543760*.

</div>

<div id="ref-Makinen2009cold">

Mäkainen, Tiina M, Raija Juvonen, Jari Jokelainen, Terttu H Harju, Ari
Peitso, Aini Bloigu, Sylvi Silvennoinen-Kassinen, Maija Leinonen, and
Juhani Hassi. 2009. “Cold Temperature and Low Humidity Are Associated
with Increased Occurrence of Respiratory Tract Infections.” Journal
Article. *Respiratory Medicine* 103 (3): 456–62.

</div>

<div id="ref-Millo2017robust">

Millo, Giovanni. 2017. “Robust Standard Error Estimators for Panel
Models: A Unifying Approach.” *Journal of Statistical Software* 82 (3):
1–27. <https://doi.org/10.18637/jss.v082.i03>.

</div>

<div id="ref-National2020rapid">

National Academies of Sciences, Engineering and Medicine. 2020. *Rapid
Expert Consultation on Sars-Cov-2 Survival in Relation to Temperature
and Humidity and Potential for Seasonality for the Covid-19 Pandemic
(April 7, 2020)*. Book. Washington, DC: The National Academies Press.
<https://doi.org/doi:10.17226/25771>.

</div>

<div id="ref-Pebesma2018">

Pebesma, Edzer. 2018. “Simple Features for R: Standardized Support for
Spatial Vector Data.” *The R Journal* 10 (1): 439–46.
<https://doi.org/10.32614/RJ-2018-009>.

</div>

<div id="ref-Pebesma2016">

Pebesma, Edzer, Thomas Mailund, and James Hiebert. 2016. “Measurement
Units in R.” *R Journal* 8 (2): 486–94.
<https://doi.org/10.32614/RJ-2016-061>.

</div>

<div id="ref-Wickham2019">

Wickham, Hadley, Mara Averick, Jennifer Bryan, Winston Chang, Lucy
D’Agostino McGowan, Romain François, Garrett Grolemund, et al. 2019.
“Welcome to the tidyverse.” *Journal of Open Source Software* 4 (43):
1686. <https://doi.org/10.21105/joss.01686>.

</div>

<div id="ref-Xie2014">

Xie, Yihui. 2014. “Knitr: A Comprehensive Tool for Reproducible Research
in R.” In *Implementing Reproducible Computational Research*, edited by
Victoria Stodden, Friedrich Leisch, and Roger D. Peng. Chapman;
Hall/CRC. <http://www.crcpress.com/product/isbn/9781466561595>.

</div>

<div id="ref-Xie2015">

———. 2015. *Dynamic Documents with R and Knitr*. 2nd ed. Boca Raton,
Florida: Chapman; Hall/CRC. <https://yihui.org/knitr/>.

</div>

<div id="ref-Zhu2019">

Zhu, Hao. 2019. *KableExtra: Construct Complex Table with ’Kable’ and
Pipe Syntax*. <https://CRAN.R-project.org/package=kableExtra>.

</div>

</div>
