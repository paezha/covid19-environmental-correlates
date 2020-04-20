
<!-- README.md is generated from README.Rmd. Please edit that file -->

# A spatio-temporal analysis of the environmental correlates of COVID-19 incidence in Spain

Antonio Paez (McMaster University)  
Fernando A. Lopez (Universidad Politecnica de Cartagena)  
Tatiane Menezes (Universidade Federal de Pernambuco)  
Renata Cavalcanti (Universidade Federal de Pernambuco)  
Maira Galdino da Rocha Pitta (Universidade Federal de Pernambuco)

## Abstract

Early in 2020 the novel SARS-CoV2 swept the globe, disrupting health
systems and the economy. Public health interventions have slowed the
spread of the virus, albeit at a high cost. How and when to ease
restrictions to movement hinges in part on whether SARS-CoV2 will
display seasonality due to variations in temperature, humidity, and
hours of sunshine. Here, we address this by means of a spatio-temporal
analysis of the incidence of COVID-19 in Spain. Use of spatial Seemingly
Unrelated Regressions (SUR) allows us to model the incidence of reported
cases of the disease per 100,000 population as an interregional
contagion process, in addition to a function of temperature, humidity,
and sunshine. In the analysis we also control for GDP per capita,
percentage of older adults in the population, population density, and
presence of mass transit systems. The results support the hypothesis
that incidence of the disease is lower at higher temperatures and higher
levels of humidity. Sunshine, in contrast, displays a positive
association with incidence of the disease. Our control variables also
yield interesting insights. Higher incidence is associated with higher
GDP per capita and presence of mass transit systems in the province; in
contrast, population density and percentage of older adults display
negative associations with incidence of COVID-19.

## Keywords

SARS-CoV2  
COVID-19  
Seasonality  
Temperature  
Humidity  
Population density  
Older adults  
Spatial SUR  
Contagion  
Spain

# Introduction

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
scale, de Ángel Solá et al. (2020) see less risk in the Caribean Basin;
however, Coelho et al. (Coelho et al. 2020) warn that at least during
the exponential phase, expansion of the virus is not driven by climate.
Similarly, whereas Araujo and Naimi (2020) argue that spread of
SARS-CoV2 will likely be constrained by climate, Harbert et al. (2020)
remain unconvinced that spatial modelling can currently discriminate the
distribution of the disease on the basis of climate, at least in the
United States. Yao et al. (2020), examined data from China and came to
the conclusion that neither temperature nor ultraviolet indices had an
association with transmission of COVID-19. This is despite previous
research that has linked less exposure to UVB radiation to higher
prevalence and severity of acute respiratory tract infections
(Zittermann et al. 2016; Dąbrowska-Leonik et al. 2018; Dinlen et
al. 2016; Mathyssen et al. 2017; Esposito and Lelii 2015; Jat 2017;
Moriyama, Hugentobler, and Iwasaki 2020). To further complicate matters,
much of the relevant work has yet to be peer-reviewed and therefore is
open to change (see for example the challenge of Harbert, Cunningham,
and Tessler (2020) to Araujo and Naimi (2020)). In the United States,
the National Academy of Sciences, Engineering, and Medicine was engaged
by the Office of the Executive for guidance on this matter (see National
Academies of Sciences, Engineering and Medicine 2020). Their conclusion
summarizes the situation well (see p. 6): “Some limited data support a
potential waning of cases in warmer and more humid seasons, yet none are
without major limitations…Additional studies as the SARS-CoV-2 pandemic
unfolds could shed more light on the effects of climate on
transmission.”

With the above considerations in mind, our objective with this paper is
to contribute to the knowledge basis regarding the spread of COVID-19
and the influence of environmental factors, particularly temperature,
humidity, and sunshine. We adopt a population health approach, and
report results from a spatial model of the incidence of COVID-19 in
fifty provinces in Spain, one of the countries hardest hit by the
pandemic. We combine data on reported cases of the disease with
metereological information, to create a spatio-temporal dataset covering
a period of 30 days. We then join this dataset with provincial-level
economic and demographic information to act as controls to our key
environmental variables. These data are analyzed using a spatial
Seemingly Unrelated Regressions (SUR) approach, which allows us to model
incidence of COVID-19 as a spatial contagion process.

The results provide evidence of the effect of temperature, humidity, and
sunshine on the incidence of COVID-19. The clearest result with respect
to these variables is a lower incidence of COVID-19 at higher
temperatures and levels of humidity, while the opposite happens with
respect to hours of sunshine. Our control variables also provide some
intriguing insights. Higher incidence is associated with higher GDP per
capita and presence of mass transit systems in the province; in
contrast, population density and percentage of older adults display
negative associations with incidence of COVID-19. The results of this
analysis provide support to the hypothesis of seasonality of the novel
SARS-CoV2, and should be of interest to public health officials and
policy makers grappling with the question of the trajectory of the
pandemic.

Please note that this paper is prepared as a reproducible research
document. The source R Markdown document, as well as all data and code
needed to reproduce/review/extend the analysis can be obtained from the
following link (this repository):

<https://github.com/paezha/covid19-environmental-correlates/tree/master/Environmental-Correlates-of-COVID19-Spain>

# Context and Data

## Covid-19 in Spain

The first reported case of COVID-19 in Spain was on January 31th, when a
German tourist in the Canary Islands tested positive for the virus.
However, it was still a few weeks before the first domestic case was
reported, on February 27th in Sevilla province (Andalusia). In a short
period of time, after this relatively slow start, the outbreak flared.
By March 11th the World Health Organization (WHO) declared COVID-19
officially a pandemic. This declaration marked a turning point for the
public in Spain too. As of March 13th, the number of cases of COVID-19
reported in Spain was 4,473, with a majority of cases (1,990)
concentrated in Madrid: these numbers were at the time the worst
outbreak in Europe, after Italy. In response to the situation, on March
13th the Spanish National Government declared a state of emergency, to
go into effect on Saturday March 14th. As part of the state of emergency
restrictions to most activities were imposed, with the exception of
essential services (e.g. food, health) and some economic subsectors of
industry and construction. A few days later, on March 17th, Spain closed
its lands borders to allow entry only to returnee nationals and
permanent residents. The lockdown was further hardened between March
30th and April 12th (including the Easter weekend of April 10th-12th)
and during this period only essential activities were allowed. During
this period, there was a dramatic reduction in overall mobility, both
within provinces as between .

## Selection of Variables

The global emergence of infectious diseases is mostly driven by
environmental, ecological, and socio-economic factors (Jones et al.
2008). In the case of SARS-CoV2, the ecological factors include the
interaction between humans and wildlife. Once transmission of a disease
begins to happen between humans, socio-economic and environmental
factors become increasingly important. As noted in the introduction, the
focus of the paper is on environmental variables, namely temperature,
humidity, and sunshine. These variables have been implicated in the
viability and ease of transmission of similar viruses. In addition to
these variables, we also aim to use a set of controls, in the form of
specific socio-economic and demographic characteristics of each
province.

The first variable that we consider is GDP per capita. Much has been
said about globalization and the spread of infectious disease. The
growth in global connections has presented a challenge to spatial
approaches in the initial stages of disease management, when the cause
of a disease may still be unclear, but the plane has already departed
(Zhou and Coleman 2016). In reference to the earlier outbreak of SARS,
van Wagner (Van Wagner 2008) chronicles how Toronto’s status as a global
city turned out to be a vulnerability in this respect. In our case, we
think of GDP per capita as a marker of a region’s relative position in a
network of global cities, and its potential to be further ahead in the
trajectory of the pandemic. Furthermore, wealthier regions also tend to
concentrate more activities that produce non-traded goods, including
building and construction (Hallet 2002). Therefore, it is possible that
wealthier regions remain relatively more active even during a lockdown.
On the other hand, it is also possible that less wealthy regions have a
higher proportion of workers in manual occupations that cannot telework,
and therefore have more difficulties complying with shelter-in-place
orders.

The percentaje of older adults (over 65) is the second variable that we
consider as a control. Early evidence regarding COVID-19 suggests that
the case rate mortality is higher at older ages (e.g. The Novel
Coronavirus Pneumonia Emergency Response Epidemiology Team 2020).
However, it is not clear that a relatively large population of older
adults necessarily translates into higher transmission of the infection.
The tool of choice in containing the spread of the disease has been
social distancing. In this respect, the evidence from the field of
transportation is that older adults tend to travel less frequently, for
shorter distances, and have higher rates of immobility (e.g., Roorda et
al. 2010; Morency et al. 2011; Sikder and Pinjari 2012). In other words,
many older adults are, whether by preference or otherwise, already in a
form of social isolation. Social distancing during the pandemic may
actually reinforce that condition for them, as suggested by the analysis
of age-structured social contact in India, China, and Italy of Sing and
Adhikari (2020). Accordingly, our expectation is that provinces with
higher percentages of older adults will tend to have similarly low
levels of social contact, particularly since the age-structured matrix
of social contact in Spain is similar to Italy (Prem, Cook, and Jit
2017).

The third population variable the we consider is population density,
since it directly affects the contact patterns and contact rates between
individuals in a population (Hu, Nigmatulina, and Eckhoff 2013). The
evidence available suggests a positive relationship between the
transmission of COVID-19 and population density (e.g. cumulative
incidence in urban areas like NYC). For this reason, we anticipate a
positive relationship between population density and the incidence of
the disease.

The last control variable is the presence of mass transit systems in a
province. Every province in Spain offers some form of public
transportation, however only five provinces have higher order systems of
mass mobility (e.g. metro or subway), namely Barcelona, Madrid, Sevilla,
Valencia, and Bizkaia. Public transportation has been hypothesized to
relate to the spread of contagious disease by some researchers using
agent-based approaches and simulation (e.g., Perez and Dragicevic 2009;
Wang et al. 2010), and while we find scant evidence of a link in the
literature, the idea is intuitively appealing. After all, unlike the
isolation that a car offers to travellers, most mass transit system are
cauldrons of social contact.

## Data

Our dataset includes information about the daily number of cases of
COVID-19 reported in Spain at the provincial level (NUTIII in Eurostat
terminology) for the period between March 13th and April 11th,
inclusive. For our purposes, we consider positive cases reported, but
excluding symptomatic cases diagnosed by a doctor without a Polymerase
Chain Reaction (PCR) test. The Spanish National Government publishes
periodic updates at the regional level (NUTII) and the information is
also released at the provincial level as part of a collaborative project
by geovoluntarios.com, ProvidencialData19, and ESRI España. This
information is compiled from several sources, mainly the official web
pages of the Spanish regional goverments, as documented in Centro de
Datos Covid-19. In addition, we consider two sets of explanatory
variables. The first one, and the focus of this research, is set of two
environmental variables, namely temperature and humidity, which are
collected from official sources (i.g., *AEMET*, the state meteorology
agency, and *MAPA*, the ministry of agriculture, fisheries, and food).
The second set provides some relevant controls for multivariate
analysis, and refers to economic and demographic attributes of the
province (also collected from official sources, i.e., INE, the national
statistics institute). Table  shows the descriptive statistics and the
provenance of the data.

The spatial and temporal coverage of the data is as follows. Our dataset
begins on March 13, which is the first date when every province had
reported at least one case of COVID-19, and continues until April 11,
for a period of 30 days. The unit of analysis is the province. Provinces
are the equivalent of states, and are embedded in Autonomous
Communities. As an example, Cataluña is an Autonomous Community and
consists of four provinces, namely Barcelona, Gerona, Lerida, and
Tarragona. The size of the provinces is relatively large, as seen in
Table . The smallest province is \(1,978.12km^2\) (this is smaller than
Rhode Island in the US) and the largest province is \(21,767.93km^2\)
(slightly smaller than New Jersey in the US). While this is a relatively
large degree of spatial aggregation, reporting on COVID-19 is
inconsistent at smaller geographies, or cases are not reported at that
level at all. The analysis must therefore be considered ecological.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">

<caption>

Descriptive statistics

</caption>

<thead>

<tr>

<th style="text-align:left;">

Variable

</th>

<th style="text-align:left;">

Note

</th>

<th style="text-align:right;">

Min

</th>

<th style="text-align:right;">

Mean

</th>

<th style="text-align:right;">

Max

</th>

<th style="text-align:right;">

SD

</th>

<th style="text-align:left;">

Source

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

COVID-19 Incidence

</td>

<td style="text-align:left;width: 15em; ">

Incidence in reported cases of SARS-19 per 100,000 people

</td>

<td style="text-align:right;">

0.38

</td>

<td style="text-align:right;">

153.61

</td>

<td style="text-align:right;">

1149.36

</td>

<td style="text-align:right;">

186.23

</td>

<td style="text-align:left;width: 5em; ">

ProvidencialData19

</td>

</tr>

<tr>

<td style="text-align:left;">

Area

</td>

<td style="text-align:left;width: 15em; ">

Area of province in sq.km

</td>

<td style="text-align:right;">

1978.12

</td>

<td style="text-align:right;">

10118.79

</td>

<td style="text-align:right;">

21767.93

</td>

<td style="text-align:right;">

4.77

</td>

<td style="text-align:left;width: 5em; ">

INE

</td>

</tr>

<tr>

<td style="text-align:left;">

GDPpc

</td>

<td style="text-align:left;width: 15em; ">

GDP per capita in €1,000s

</td>

<td style="text-align:right;">

16.67

</td>

<td style="text-align:right;">

22.51

</td>

<td style="text-align:right;">

36.00

</td>

<td style="text-align:right;">

4805.98

</td>

<td style="text-align:left;width: 5em; ">

INE

</td>

</tr>

<tr>

<td style="text-align:left;">

Older

</td>

<td style="text-align:left;width: 15em; ">

Percentage of people aged 65 and older in the province

</td>

<td style="text-align:right;">

15.16

</td>

<td style="text-align:right;">

21.03

</td>

<td style="text-align:right;">

31.36

</td>

<td style="text-align:right;">

3.95

</td>

<td style="text-align:left;width: 5em; ">

INE

</td>

</tr>

<tr>

<td style="text-align:left;">

Population Density

</td>

<td style="text-align:left;width: 15em; ">

Population density in the province in people per sq.km

</td>

<td style="text-align:right;">

8.60

</td>

<td style="text-align:right;">

140.04

</td>

<td style="text-align:right;">

829.76

</td>

<td style="text-align:right;">

181.25

</td>

<td style="text-align:left;width: 5em; ">

INE

</td>

</tr>

<tr>

<td style="text-align:left;">

Mean Temperature

</td>

<td style="text-align:left;width: 15em; ">

Mean temperature in province by date, in C

</td>

<td style="text-align:right;">

1.00

</td>

<td style="text-align:right;">

12.18

</td>

<td style="text-align:right;">

23.20

</td>

<td style="text-align:right;">

3.67

</td>

<td style="text-align:left;width: 5em; ">

AEMET

</td>

</tr>

<tr>

<td style="text-align:left;">

Humidity

</td>

<td style="text-align:left;width: 15em; ">

Relative humidity in province by date

</td>

<td style="text-align:right;">

2.00

</td>

<td style="text-align:right;">

77.82

</td>

<td style="text-align:right;">

100.00

</td>

<td style="text-align:right;">

10.37

</td>

<td style="text-align:left;width: 5em; ">

MAPA

</td>

</tr>

</tbody>

<tfoot>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<span style="font-style: italic;">Note: </span>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> ProvidencialData19:
<https://www.datoscovid.es/pages/providencialdata19>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> INE (Instituto Nacional de Estadistica):
<https://www.ine.es/>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> AEMET (Agencia Estatal de Meteorologia):
<http://eportal.mapa.gob.es>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> MAPA (Ministerio de Agricultura, Pesca y Alimentacion):
<http://eportal.mapa.gob.es>

</td>

</tr>

</tfoot>

</table>

An important aspect of working with environmental data such as
temperature and humidity is the incubation period of the disease. Lauer
et al. (2020) report for the case of COVID-19 a median incubation period
of 5.7 days (with a confidence interval between 4.9 to 7.8 days). The
vast majority of cases (95%) develop symptoms between 2.6 days (CI, 2.1
to 3.7 days) and 12.5 days (CI, 8.2 to 17.7 days). For this reason, we
judge it best to use lagged values of the environmental variables. We
test different time lags as follows. We consider a lagged 8-day average,
from date-minus-12 to date-minus-5 days (hereafter *lag8*). Secondly, we
consider a lagged 11-day average, from date-minus-12 to date-minus-2
days (hereafter *lag11*). Finally, to account for the likely duration of
incubation, we consider a lagged 11-day *weighted* average, from
date-minus-12 to date-minus-2 days (hereafter *lag11w*). The weights for
this variable are calculated using the parameters of the log-normal
distribution reported by Lauer et al. (2020), i.e., a log-mean of 1.621
and a log-standard deviation of 0.418. With these weights, the
environmental variables at date-minus-2 and date-minus-12 days are
weighted as 0.041 and 0.009 respectively, whereas the environmental
variables at date-minus-5 days are weighted as 0.194.

# Methods: the Spatial SUR Model

The Seemingly Unrelated Regression equations model (SUR hereafter) is a
multivariate econometric model used in different fields when the
structure of the data consisits of cross-sections for different time
periods. The basis of this approach is well-known since the initial
works of Zellner (1962), and has become a popular methodology included
in several econometrics textbook (e.g., Greene 2003). To our knowledge,
Anselin (1988) was the first author to discuss SUR from a spatial
perspective. In his landmark text, Anselin discussed a model made of “an
equation for each time period, which is estimated for a cross section of
spatial units” (p. 141). From this milestone, a large body of research
has developed to extend the classical SUR into a spatial framework
(e.g., Rey and Montouri 1999; Lauridsen et al. 2010; Le Gallo and
Dall’Erba 2006; López, Martínez-Ortiz, and Cegarra-Navarro 2017).

The classical SUR model without spatial effects (from here, SUR-SIM) is
a stack of equations as follows:

<!--
  \begin{equation}
\label{eq:sur-sim}
\begin{bmatrix}
y_1 \\ y_2 \\ \vdots \\ y_T
\end{bmatrix}
=
  \begin{bmatrix}
X_1 & 0 & \cdots & 0 \\ 0 & X_2 & \cdots & 0 \\ \vdots & \vdots & \ddots & \vdots \\ 0 & 0 & \cdots & X_T
\end{bmatrix}
\
\begin{bmatrix}
\beta_1 \\ \beta_1 \\ \vdots \\ \beta_T
\end{bmatrix}
+
\begin{bmatrix}
\epsilon_1 \\ \epsilon_2 \\ \vdots \\ \epsilon_T
\end{bmatrix}
\end{equation}

\noindent where $y_{t}=(y_{1t},...,y_{Nt})$ is a $N \times 1$ vector, and in our case $y_{st}$ is the incidence ratio in the province $s$ ($s=1,...,N$) the day $t$ $(t=1,...,T)$; $X_t$ is a $N \times k_t$ matrix of the $k_t$ independent variables, with associated vector of coefficients $\beta_t$,; $\beta_t=(\beta_{1t},...,\beta_{Nt})$ is a vector of coefficients and $\epsilon_t=(\epsilon_{1t},...,\epsilon_{Nt})$ is the vector of residuals.
-->

<!--Equation for README.md generated using this app https://alexanderrodin.com/github-latex-markdown/ -->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-sim%7D%20%5Cbegin%7Bbmatrix%7D%20y_1%20%5C%5C%20y_2%20%5C%5C%20%5Cvdots%20%5C%5C%20y_T%20%5Cend%7Bbmatrix%7D%20%3D%20%5Cbegin%7Bbmatrix%7D%20X_1%20%26%200%20%26%20%5Ccdots%20%26%200%20%5C%5C%200%20%26%20X_2%20%26%20%5Ccdots%20%26%200%20%5C%5C%20%5Cvdots%20%26%20%5Cvdots%20%26%20%5Cddots%20%26%20%5Cvdots%20%5C%5C%200%20%26%200%20%26%20%5Ccdots%20%26%20X_T%20%5Cend%7Bbmatrix%7D%20%5C%20%5Cbegin%7Bbmatrix%7D%20%5Cbeta_1%20%5C%5C%20%5Cbeta_1%20%5C%5C%20%5Cvdots%20%5C%5C%20%5Cbeta_T%20%5Cend%7Bbmatrix%7D%20%2B%20%5Cbegin%7Bbmatrix%7D%20%5Cepsilon_1%20%5C%5C%20%5Cepsilon_2%20%5C%5C%20%5Cvdots%20%5C%5C%20%5Cepsilon_T%20%5Cend%7Bbmatrix%7D%20%5Cend%7Bequation%7D)

where
![\(y_{t}=(y_{1t},...,y_{Nt})\)](https://render.githubusercontent.com/render/math?math=%24y_%7Bt%7D%3D\(y_%7B1t%7D%2C...%2Cy_%7BNt%7D\)%24)
is an
![\(N \times 1\)](https://render.githubusercontent.com/render/math?math=%24N%20%5Ctimes%201%24)
vector, and in our case
![\(y_{st}\)](https://render.githubusercontent.com/render/math?math=%24y_%7Bst%7D%24)
is the incidence ratio in the province
![\(s\text{ }(s=1,...,N)\)](https://render.githubusercontent.com/render/math?math=%24s%5Ctext%7B%20%7D\(s%3D1%2C...%2CN\)%24)
the day
![\(t\text{ }(t=1,...,T)\)](https://render.githubusercontent.com/render/math?math=%24t%5Ctext%7B%20%7D\(t%3D1%2C...%2CT\)%24);
![\(X_t=(X^1,...,X^{k_t})\)](https://render.githubusercontent.com/render/math?math=%24X_t%3D\(X%5E1%2C...%2CX%5E%7Bk_t%7D\)%24)
is a
![\(N \times k_t\)](https://render.githubusercontent.com/render/math?math=%24N%20%5Ctimes%20k_t%24)
matrix of the
![\(k_t\)](https://render.githubusercontent.com/render/math?math=%24k_t%24)
independent variables,
![\(X_i=(X^i_{st})\)](https://render.githubusercontent.com/render/math?math=%24X_i%3D\(X%5Ei_%7Bst%7D\)%24);
![\(\beta_t=(\beta_{1t},...,\beta_{Nt})\)](https://render.githubusercontent.com/render/math?math=%24%5Cbeta_t%3D\(%5Cbeta_%7B1t%7D%2C...%2C%5Cbeta_%7BNt%7D\)%24)
is a vector of coefficients and
![\(\epsilon_t=(\epsilon_{1t},...,\epsilon_{Nt})\)](https://render.githubusercontent.com/render/math?math=%24%5Cepsilon_t%3D\(%5Cepsilon_%7B1t%7D%2C...%2C%5Cepsilon_%7BNt%7D\)%24)
is the vector of residuals.

A key feature of the SUR model is the dependence structure among the
vectors of residuals, namely:

<!--
\begin{equation}
\label{eq:sur-err}
E[\epsilon_t \epsilon'_{t'}]=\sigma_{tt'}
\end{equation} 

Note that this specification is very flexible, in that it allows changes in the coefficients $\beta_{it}$ in order to modulate the effect of the independent variables on $y_t$. This flexibility can be reduced and it is posible to impose restrictions considering some $\beta$ coefficients as being constant over time. In this case, we can reformulate the coefficients expression $\beta_t = (\beta_{1}, \cdots, \beta_{r-1}, \beta_{r}, \beta_{r+1}, \cdots, \beta_{Nt})$ to restrict the first $r$ coefficients to be constant across equations. This is equivalent to specifying some effects to be invariant over time.
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-err%7D%20E%5B%5Cepsilon_t%20%5Cepsilon'_%7Bt'%7D%5D%3D%5Csigma_%7Btt'%7D%20%5Cend%7Bequation%7D%20)

Note that this specification is very flexible, in that it allows changes
in the coefficients
![\(\beta_{it}\)](https://render.githubusercontent.com/render/math?math=%24%5Cbeta_%7Bit%7D%24)
in order to modulate the effect of the independent variables on
![\(y_t\)](https://render.githubusercontent.com/render/math?math=%24y_t%24).
This flexibility can be reduced and it is posible to impose restrictions
considering some
![\(\beta\)](https://render.githubusercontent.com/render/math?math=%24%5Cbeta%24)
coefficients as being constant over time. In this case, we can
reformulate the coefficients expression
![\(\beta_t = (\beta_{1}, \cdots, \beta_{r-1}, \beta_{r}, \beta_{r+1}, \cdots, \beta_{Nt})\)](https://render.githubusercontent.com/render/math?math=%24%5Cbeta_t%20%3D%20\(%5Cbeta_%7B1%7D%2C%20%5Ccdots%2C%20%5Cbeta_%7Br-1%7D%2C%20%5Cbeta_%7Br%7D%2C%20%5Cbeta_%7Br%2B1%7D%2C%20%5Ccdots%2C%20%5Cbeta_%7BNt%7D\)%24)
to restrict the first
![\(r\)](https://render.githubusercontent.com/render/math?math=%24r%24)
coefficients to be constant across equations. This is equivalent to
specifying some effects to be invariant over time.

Equation () can be rewriten in compact form:

<!--
\begin{equation}
\bf{Y} = \bf{X} \beta + \epsilon
\label{eq:sur-sim-block}
\end{equation}

\noindent where $\bf{Y}$ is now a vector of dimension $NT \times 1$, $\bf{X}$ is a block-diagonal matrix $NT \times K$ 
(with $K = \sum_t{k_t}$) and $\epsilon$ is an $NT \times 1$ vector. Using the Kronecker product notation ($\otimes$), the error matrix structure is expressed concisely as:

\begin{equation}
E[\epsilon \epsilon']=\bf{\Sigma} \otimes \bf{I_N} ; \ \bf{\Sigma}=(\sigma_{tt'})
\end{equation}
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20E%5B%5Cepsilon%20%5Cepsilon'%5D%3D%5CSigma%20%5Cotimes%20I_N%20%3B%20%5C%20%5CSigma%3D\(%5Csigma_%7Btt'%7D\)%20%5Cend%7Bequation%7D)

As is the case with cross-sectional data, it is possible to test the
residuals of Model () for spatial autocorrelation, and several tests
have been developed to test the null hypothesis of spatial independence
(see López, Mur, and Angulo 2014). When the null hypothesis is rejected,
several alternative specifications have been proposed to include spatial
effects (Anselin 1988, see also 2016). In this paper we consider a
spatial SUR model that incorporates a spatial lag of the dependent
variable as an explanatory factor. Spatial analytical approaches were
used to understand contagion-difussion processes in the case of
infectious disease in general (e.g., Cliff, Haggett, and Smallman-Raynor
1998) and the 2003-2004 SARS outbreak in particular (e.g., Meng et al.
2005; Cao et al. 2010). While we are mindful of the same caveat that the
novel SARS-CoV2 may not follow the patterns of previous diseases, there
is still evidence from the United States that COVID-19 displays spatial
patterns that are consistent with a diffusion process (Desjardins, Hohl,
and Delmelle 2020). For this reason, the spatial lag model is
appropriate to model incidence of COVID-19 geographically, since it
accounts for potential spatial patterns that result from a process of
contagion, as explained next.

The stack expresion for the SUR model with a spatially lagged dependent
variable (SUR-SLM) is as follows:

<!--
\begin{equation}
\label{eq:sur-slm}
\begin{aligned}
\bf{AY} = \bf{X} \beta + \epsilon \\
\epsilon =N(0,\bf{\Sigma})
\end{aligned}
\end{equation}

\noindent where $\bf{A} =I_{TN}-\bf{\Gamma} \otimes W$ is the spatially lagged dependent variable, and $\bf{\Gamma} = diag(\rho_1, \cdots, \rho_T)$.

This specification assumes that outcome ($y_{st}$) at location $s$ and time $t$ is partially determined by the weighted average ($Wy_{st}$) of the outcome in neighboring provinces, with neighborhood defined by matrix $W$ of spatial weights. In other words, the spatially lagged dependent variable represents a process of contagion, where the disease in neighboring provinces can spillover in a spatial way. The coefficients of the spatially lagged variable are estimated for each time period $\rho_t$ and identify the intensity and the sign of the contagion effect. It is possible test the null hypothesis of identical levels of spatial dependence ($\rho_i=\rho_j, \forall i,j$). The correspond Wald test is available in the `R` package `spsur`. 
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-slm%7D%20%5Cbegin%7Baligned%7D%20%5Cbf%7BAY%7D%20%3D%20%5Cbf%7BX%7D%20%5Cbeta%20%2B%20%5Cepsilon%20%5C%5C%20%5Cepsilon%20%3DN\(0%2C%5Cbf%7B%5CSigma%7D\)%20%5Cend%7Baligned%7D%20%5Cend%7Bequation%7D)

where
\!\[\(\bf{A} =I_{TN}-\bf{\Gamma} \otimes W\)\](<https://render.githubusercontent.com/render/math?math=%24%5Cbf%7BA%7D%20%3DI_%7BTN%7D-%5Cbf%7B%5CGamma%7D%20%5Cotimes%20W%24>)
is the spatially lagged dependent variable, and
![\(\bf{\Gamma} = diag(\rho_1, \cdots, \rho_T)\)](https://render.githubusercontent.com/render/math?math=%24%5Cbf%7B%5CGamma%7D%20%3D%20diag\(%5Crho_1%2C%20%5Ccdots%2C%20%5Crho_T\)%24).

This specification assumes that outcome
(![\(y_{st}\)](https://render.githubusercontent.com/render/math?math=%24y_%7Bst%7D%24))
at location
![\(s\)](https://render.githubusercontent.com/render/math?math=%24s%24)
and time
![\(t\)](https://render.githubusercontent.com/render/math?math=%24t%24)
is partially determined by the weighted average
(![\(Wy_{st}\)](https://render.githubusercontent.com/render/math?math=%24Wy_%7Bst%7D%24))
of the outcome in neighboring provinces, with neighborhood defined by
matrix
![\(W\)](https://render.githubusercontent.com/render/math?math=%24W%24)
of spatial weights. In other words, the spatially lagged dependent
variable represents a process of contagion, where the disease in
neighboring provinces can spillover in a spatial way. The coefficients
of the spatially lagged variable are estimated for each time period
![\(\rho_t\)](https://render.githubusercontent.com/render/math?math=%24%5Crho_t%24)
and identify the intensity and the sign of the contagion effect. It is
possible test the null hypothesis of identical levels of spatial
dependence
(![\(\rho_i=\rho_j, \forall i,j\)](https://render.githubusercontent.com/render/math?math=%24%5Crho_i%3D%5Crho_j%2C%20%5Cforall%20i%2Cj%24)).
The correspond Wald test is available in the `R` package `spsur`.

The SUR-SLM model can be estimated using maximum likelihood (López, Mur,
and Angulo (2014)) or instrumental variables (Mínguez, López, and Mur
(2019)).

A note regarding the interpretation of the model is in order. It is
well-known that coefficients in linear regression models are partial
derivatives of the dependent variable with respect to the independent
variables, and therefore directly give the marginal effects or rates of
change. Spatially lagged models, however, are no longer linear. The
intuition behind the non-linearity is that the spatial lag expands the
information set to include information from neighbouring regions: in
other words, the value of an explanatory variable in a spatial unit can
have influence in other spatial units via the spatial lag. This makes
interpretation of the coefficients less straightforward but also richer
(Golgher and Voss 2016). The results of LeSage (2009) for
cross-sectional spatial lag models can be extended to the spatial SUR
framework. Note that, according to Elhorst (2014), the partial
derivatives have the following interpretation: if an explanatory
variable (\(X_k\)) in a particular province changes, not only the
incidence rate in that province changes, also incidence rates in other
provinces change via the contagion effect. Therefore, a change in
\(X_k\) in a particular province has a *direct effect* on that province,
but also an *indirect effect* on neighbouring provinces. In this way,
the \(i\)th diagonal element of the matrix of partial derivatives
represents the direct effect on the \(i\)th province, whereas the
non-diagonal elements of \(i\)th row of the matrix of partial
derivatives represent the indirect effects on other provinces. In order
to obtain a global indicator, the direct effect is calculated as the
mean of the diagonal elements and captures the average change in
incidence ratio caused by the change in \(X_k\). Likewise, a global
indicator of the indirect effects is calculated as the mean of the
non-diagonal elements. The total effect is the sum of direct and
indirect effects. Finally, note that if \(\rho_k = 0\), the indirect
effects are 0 and the direct effects are equal to \(\beta_kt\).

# Analysis

## Exploratory Data Analysis

Figure  shows the geographical variation in the incidence of COVID-19 in
Spain, as well as the temporal progression of the disease in weekly
averages. Our analysis begins on March 13, which is the first date when
every province had reported at least one case of COVID-19. It can be
seen that the highest incidence at this early date was in the provice of
Álava, in the North of Spain. While not the most populous province, with
a population of only 331,549, Álava has the highest GDP per capita of
all provinces. Vitoria, its main city, is the capital of the Basque
Country and has been the focus of efforts, along with San Sebastian and
Bilbao, to develop a “Global Basque City” (Meijers, Hoekstra, and Aguado
2008). The other early focus of the pandemic in Spain was Madrid, which
is the most populous province in the country and has the second highest
GDP per capita after Álava. The early outbreaks in these two provinces
can be traced throughout the progression of the pandemic over time,
although by the end of the period under consideration, other provinces
had matched and even surpased their incidence rates, including Segovia
and Soria to the north of Madrid, and Ciudad Real and Albacete to the
south.

![Mean weekly incidence of COVID-19 by province, in reported cases by
100,000
people](README_files/figure-gfm/weekly-average-incidence-map-1.png)

Figure  shows the distribution of the environmental variables in Spain.
For ease of visualization we aggregate the provinces by Autonomous
Community. Each box-and-whisker in the figure represents the
distribution of the variable for a community over the 30-day period. In
the plot, the communities have been sorted by latitude, so that
Principado de Asturias is the northernmost community, and Canarias the
southernmost. As seen in the figure, there is a relatively wide range of
values both within and between provinces over the 30-day period
examined. The top panel of the figure shows the distribution of mean
temperatures. The lowest mean temperature for a community on any given
day was 2.8C, and the highest 22.4C, for a range of approximately 20
degrees. Likewise, there is a great deal of variability in humidity, as
seen in the middle panel of the figure, where the lowest mean humidity
for any community is 48.3 and the highest is 99.6. Finally, the bottom
panel displays mean daily hours of sunshine in the community. This
variable displays the most variability within communities over time, but
remains relatively constant across communities. It is important to note
that these are summaries by community, and the actual values of these
variables for the provinces display somewhat more variability.

![ Distribution of mean temperatures and humidities in the Autonomous
Communities in Spain between March 12, 2020 and April 11, 2020. The
Autonomous Communities have been sorted by latitude, with communities to
the left being the northermost, and to the right the
southernmost](README_files/figure-gfm/descriptives-temperature-1.png)

Figure  includes three maps that display the spatial variation of our
control variables, namely GDP per capita, percentage of older adults in
province, population density, and presence of mass transit systems. As
seen there, GDP per capita is higher in Madrid and the northeast part of
the country, mainly in Pais Vasco and Cataluña. Percentage of older
adults is somewhat more checkered, with high values in Madrid and other
provinces in the center-west part of the country, but also in some
provinces in the north. Outside of provinces with major cities (e.g.,
Madrid; Bizkaia and Gipuzkoa in Pais Vasco; Pontevedra in Galicia),
population density tends to be higher in provinces along the
Mediterranean coast. The final panel in the figure shows the five
provinces in the country that have higher order mass transit systems
(e.g., metro).

![Spatial distribution of control variables by
province](README_files/figure-gfm/map-controls-1.png)

Figure  shows the distribution of daily simple correlations of incidence
of COVID-19 with the independent variables (with the exception of
Transit, which is a categorical variable). These correlations are
calculated after log-transforming all variables. As previously
discussed, the environmental variables have a temporal lag and were
calculated different time windows.

It can be seen in the figure that temperature (in its three forms) has
the highest simple correlation with incidence of COVID-19. After
temperature, GDP per capita has the highest positive correlation with
the dependent variable. The distribution of these correlations is also
quite tight over the 30-day period of the study. Hours of sunshine tends
to have a moderately high correlation with incidence of COVID-19,
however the distribution of these correlations is more spread, and in
some cases strays into negative values. A similar thing happens with
humidity, which also tends to display more day to day variation in the
correlation with the dependent variable. The percentage of older adults
shows a relatively tight distribution of day-to-day correlations, and is
negative. Population density, in contrast, tends to be negative, but is
relatively spread, and on some days, the simple correlation between
density and incidence of COVID-19 is weakly positive.

![Distribution of daily correlations of the independent variables with
daily incidence of COVID-19 (all variables have been
log-transformed)](README_files/figure-gfm/daily-correlations-1.png)

## SUR Models

Correlation analysis in the preceding section provides some insights
about the potential associations between incidence of COVID-19 and the
various environmental and control variables. In this section we estimate
three spatial SUR models to test the differences between the various
temporal lags and weighting schemes for the environmental variables.
Accordingly, we define three models: Model 1, which is estimated using
the lagged 8-day averages of the environmental variables (*lag8*); Model
2, which is estimated using the lagged 11-day averages of the
environmental variables (*lag11*); and finally, Model 3, which is
estimated using the lagged 11-day *weighted* averages of the
environmental variables (*lag11w*).

To implement the SUR approach, we must define a matrix of spatial
weights \(W\). In this case, we consider neighborhoods based on
adjacency, based on the well-known rook criterion (two provinces are
adjacent if they share a boundary, but not if they touch only at a
vertex). We modify this criterion in two cases. First, we make an
allowance for adjacency between the two islands in the Autonomous
Community of Canarias in the Pacific (Las Palmas and Santa Cruz de
Tenerife), which we assume are adjacent between each other. And
secondly, we assume that Islas Baleares in the Mediterranean are
adjacent to three provinces in Pais Catalans (i.e., Barcelona,
Tarragona, and Castello). After matrix \(W\) has been specified,
estimation of the model can proceed as usual.

For estimation, we log-transform the dependent and quantitative
independent variables. The only variable that is not transformed is the
categorical variable for transity systems. A log-log transformation is
appropriate to capture non-linear relationships between variables and
provides a straightforward interpretation of the coefficients as
percentage change. Furthermore, we introduce restrictions so that the
coefficients of two of our control variables are constant over time,
namely GDP per capita and percentage of older adults. We do not see an
*a priori* reason to let those two variables vary across equations, and
the correlation analysis in Figure  also suggest little temporal
variation. In contrast, we let the spatial autocorrelation parameter, as
well as the parameters of the rest of the independent variables
(including the constant) to vary over time. This will be useful to
detect whether there are behavioral adaptations at the population level
over the course of the period examined. As an example of behavioral
adaptations, the effect of density might weaken over time, in the
measure that the effects of the lockdown are felt: at full compliance
with the lockdown, with people practicing social avoidance, density
might matter less than other factors.

After estimation, we compare the goodness of fit of the three SUR
models. Figure  shows the equation-level coefficient of determination
\(R^2\), one for each time period/day. As well, the overall coefficient
of determination for the system is reported for each model
\(\text{pooled}-R^2\). The general trend is identical for the three
models, with the goodness-of-fit improving over time and plateuing
around a value of \(R^2\) of 0.6. Model 1 (*lag8*) performs somewhat
better in the first few equations/days, when the goodness-of-fit is
relatively poor, and then again in the last few equations/days. Model 3
(*lag11w*), in contrast, does not perform well towards the end of the
study period. The most balanced model in terms of equation-level
goodness-of-fit appears to be Model 2 (*lag11*), and this impression is
further supported by a slightly higher value of the
\(\text{pooled}-R^2\). The analysis using a lagged moving average of the
environmental variables is in line with the incubation period reported
by Lauer et al. (2020), although the results do not support the use of a
weighted average. For the remainder of the paper, we will adopt Model 2
(*lag11*) as our best model. In the following section we discuss the
results of the analysis in more depth.

![ Goodness of fit of the SUR systems: by date and
pooled](README_files/figure-gfm/goodness-of-fit-1.png)

# Results and Discussion

Table  presents a summary of the results of Model 2 (*lag11*). Recall
that two coefficients were constrained and are estimated only for the
first equation of the system, and thus are assumed to be constant over
time. These are the coefficients corresponding to GDP per capita and
percentage of older adults. Both coefficients are significant at
\(p\leq0.05\). The sign of the coefficient for GDP per capita is
positive, which indicates that wealthier regions tend to have a higher
incidence of COVID-19. This is in line with the idea that the epidemic
started earlier in wealthier places due to their connections to a
globalized world. The sign of the coefficient for percentage of older
adults, on the other hand, is negative. As previously discussed, the
level of social contact of older adults even under normal circumstances
tends to be lower than for younger people. As a consequence, places with
larger populations of older adults appear to have a natural level of
social distancing in place. It is important to note that this does not
detract from evidence that older adults are more vulnerable individually
and in institutional settings, where their case mortality rates are
perhaps the highest of all age groups. Instead, this result indicates
that their presence in the community at large tends to depress
transmission of the virus.

Of the two other control variables, the coefficient of population
density is significant at \(p\leq0.05\) in 11 equations, and not
significant in 19. The coefficient for transit is significant at
\(p\leq0.10\) in 22 equations, and of those, significant at
\(p\leq0.05\) in 14 equations. The next four variables are environmental
factors. The coefficient for humidity is significant at \(p\leq0.10\) in
20 equations, and of those, significant at \(p\leq0.05\) in 19
equations. Of the environmental variables, temperature is the only
variable that has significant coefficients in every equation at
\(p\leq0.05\). Finally, sunshine has significant coefficients at
\(p\leq0.10\) in 18 equations, including 15 coefficients that are
significant at \(p\leq0.05\).

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">

<caption>

Summary of estimation results of best model (lag11: lagged 11-day moving
average)

</caption>

<thead>

<tr>

<th style="border-bottom:hidden" colspan="1">

</th>

<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

Estimates

</div>

</th>

<th style="border-bottom:hidden; padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; " colspan="3">

<div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">

Significance

</div>

</th>

<th style="border-bottom:hidden" colspan="1">

</th>

</tr>

<tr>

<th style="text-align:left;">

Variable

</th>

<th style="text-align:right;">

Min

</th>

<th style="text-align:right;">

Mean

</th>

<th style="text-align:right;">

Max

</th>

<th style="text-align:right;">

p \> 0.10

</th>

<th style="text-align:right;">

0.10 \<= p \< 0.05

</th>

<th style="text-align:right;">

p \<= 0.05

</th>

<th style="text-align:left;">

Note

</th>

</tr>

</thead>

<tbody>

<tr>

<td style="text-align:left;">

Intercept

</td>

<td style="text-align:right;">

7.370

</td>

<td style="text-align:right;">

10.037

</td>

<td style="text-align:right;">

12.968

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

30

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(GDPpc)

</td>

<td style="text-align:right;">

0.620

</td>

<td style="text-align:right;">

0.620

</td>

<td style="text-align:right;">

0.620

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(Older)

</td>

<td style="text-align:right;">

\-0.737

</td>

<td style="text-align:right;">

\-0.737

</td>

<td style="text-align:right;">

\-0.737

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(Density)

</td>

<td style="text-align:right;">

\-0.220

</td>

<td style="text-align:right;">

\-0.097

</td>

<td style="text-align:right;">

0.153

</td>

<td style="text-align:right;">

19

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

11

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

Transit

</td>

<td style="text-align:right;">

0.314

</td>

<td style="text-align:right;">

0.512

</td>

<td style="text-align:right;">

0.583

</td>

<td style="text-align:right;">

8

</td>

<td style="text-align:right;">

8

</td>

<td style="text-align:right;">

14

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(Humidity)

</td>

<td style="text-align:right;">

\-1.434

</td>

<td style="text-align:right;">

\-0.534

</td>

<td style="text-align:right;">

\-0.031

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

19

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(Temperature)

</td>

<td style="text-align:right;">

\-2.014

</td>

<td style="text-align:right;">

\-1.406

</td>

<td style="text-align:right;">

\-0.929

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

30

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

log(Sunshine)

</td>

<td style="text-align:right;">

\-0.258

</td>

<td style="text-align:right;">

0.097

</td>

<td style="text-align:right;">

0.206

</td>

<td style="text-align:right;">

7

</td>

<td style="text-align:right;">

2

</td>

<td style="text-align:right;">

21

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left;">

Spatially lagged y (rho)

</td>

<td style="text-align:right;">

0.015

</td>

<td style="text-align:right;">

0.142

</td>

<td style="text-align:right;">

0.528

</td>

<td style="text-align:right;">

12

</td>

<td style="text-align:right;">

3

</td>

<td style="text-align:right;">

15

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

</tbody>

<tfoot>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<span style="font-style: italic;">Note: </span>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Significance: This is the number of coefficients with
p-values as indicated

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Non-constrained: coefficient was allowed to vary across
equations

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Constrained: coefficient as constant across equations

</td>

</tr>

</tfoot>

</table>

To better understand the results, we proceed to plot the coefficients in
their temporal sequence. At this point it is worth recalling that the
state of emergency went into effect on March 14. In the following
figures, the periods of time indicated in yellow starting on March 14
correspond to the state of emergency, with only essential travel and
selected industrial activities allowed; the period of time in orange was
the stricter lockdown when only essential travel was allowed.

We begin our discussion with the evolution of the spatial
autocorrelation coefficient (\(\rho\)) in Figure  (left panel). It is
interesting to note that the magnitude of the spatial autocorrelation
coefficient \(\rho\) declines over the period under analysis, and is not
significant for some days. This is an interesting result: immediately
prior to the declaration of the state of emergency, there appears to
have been a strong inter-provincial contagion effect. Keeping in mind
that the incubation period ranges between 2 and 11 days with a median of
5, it is reasonable to expect that the effect of the lockdown will be
observed with some delay. Indeed, as seen in the figure, the
autocorrelation coefficient remains high for three days, then declines
on March 16, and continues to weaken over time. At the end of the period
under examination, the strength of this effect is much diminished. We
would expect that under full compliance with strict lockdown conditions
(meaning no inter-provincial mobility) the spatial contagion effect
would be zero. The fact that it is not is evidence of some weak
contagion effect due to restrictions to the movement between provinces.

The intercept (right panel in Figure ) is indicative of the variation of
the incidence of COVID-19, other things being equal. Here we see that at
the incidence declines somewhat immediately after the state of
emergency, only to begin increasing again over time. Then, the incidence
declines again after the stricter lockdown and rebounds to a lower level
by April 11.

![Temporal evolution of the spatial autocorrelation coefficient (rho)
and the intercept of the model; dots are the point estimates and
vertical lines are 95% confidence intervals. In yellow is the period
after the declaration of the state of emergency, and in orange is the
period when only essential activities were
allowed.](README_files/figure-gfm/results-time-1-1.png)

Figure  shows the temporal evolution of the coefficients for the two
control variables that were not fixed over time, i.e., \(\log(Density)\)
(left panel) and \(Transit\) (right panel).

In Section  we had anticipated a positive sign for the coefficient of
this variable, and indeed, at the beginning of the period the
coefficient is positive, albeit not significant, and then remains
non-significant for the earlier part of the lockdown. We are somewhat
surprised by the way this coefficient turns significant *and* negative
in the later part of the lockdown, after April 1st. This effect, we
surmise, is the result of risk compensation, a situation where people
adapt their behavior according to the *perceived* level of risk,
becoming more careful when the perceived risk is higher and viceversa
(e.g., Noland 1995; Richens, Imrie, and Copas 2000; Phillips, Fyhri, and
Sagberg 2011). Consequently, residents in high density regions may
perceive the risk of infection as being higher, and adapt their behavior
accordingly - while the opposite may be true of residents in low density
regions. Anecdotally, this seems to have been the case with some
governors in the US, who resisted stay-at-home orders citing their
sparse  and rural populations. The coefficient for Transit is positive,
as expected, but with very wide confidence intervals, and in fact not
significant in the earlier part of the period.

![Temporal evolution of coefficient for the control variables; dots are
the point estimates and vertical lines are 95% confidence intervals. In
yellow is the period after the declaration of the state of emergency,
and in orange is the period when only essential activities were
allowed.](README_files/figure-gfm/beta-controls-time-1.png)

The evolution of the coefficients for the three environmental variables
are shown in Figure . Despite a mostly positive simple correlation with
incidence (see Figure ) once that we control for other factors, humidity
has a negative association with incidence of COVID-19 in Spain
(top-right panel). This is in line with the literature that describes
the viability and transmission of different viruses at higher levels of
humidity. The coefficients for temperature (top-right panel) are
consistently negative and this variable is, besides the intercept, the
only one with significant coefficients in all equations. The range of
variation of this coefficient during the period examined is
approximately between -1 and -2 - although it is important to recall
that these values should not be interpreted directly as effects; more on
this below. Finally the plot for the coefficients associated with hours
of sunshine (bottom panel) is more ambiguous: prior to the lockdown, the
coefficient was negative, but significant only at \(p\leq10\). At the
beginning of the lockdown, the coefficient is no longer significative,
before becoming *positive* and significant on March 23rd. This result
stands in contrast to previous findings regarding influenza, where more
hours of sunlight reduced the strength and duration of epidemic
durations (Yu et al. 2013). A difference with previous studies is the
temporal scale of the analysis: where Yu et al. (2013) use monthly
averages, we use daily data for a much shorter period of time. The
positive sign of sunshine may well be another instance of behavioral
adaptations, whereby compliance with lockdown orders weakens on sunny
days.

![Temporal evolution of coefficient for the environmental variables;
dots are the point estimates and vertical lines are 95% confidence
intervals. In yellow is the period after the declaration of the state of
emergency, and in orange is the period when only essential activities
were allowed.](README_files/figure-gfm/beta-environmental-time-1.png)

The preceding discussion helps to establish the inferential
contributions of the analysis. The remaining question is, what are the
implications. As discussed in Section  the question of the magnitude of
the effects is not clear from the coefficients alone, since a change to
a variable in a province influences, via the contagion effect, its
neighbors. For this reason, the appropriate way to estimate the effects
is to calculate both the own and contagion effects (in other words the
direct and indirect effects, respectively), as well as their total. A
summary of the different variable effects appears in Table . All effects
in the table are interpreted as percentage change in the incidence of
COVID-19 as a consequence of a one percent change in the variable. The
exception is Transit (which was not log-transformed), and this variable
represents the percentage change in incidence between provinces without
and with mass transit systems.

Two variables had temporally constrained coefficients. The estimated
effect of GDP per capita is to increase the incidence of COVID-19 by
0.675% for each percentual increase of this variable (in €1,000s). In
our view, this is a measure of inertia, as provinces with higher GDP per
capita where among the first to see exponential growth in the pandemia.
Percentage of older adults has a negative effect, and each percentual
increase in this variable is associated with a relatively small
reduction of the incidence of less than 1%.

The temporal variation of the effects for the rest of the variables is
shown in Figure . The largest positive direct effect is Transit, and the
largest direct negative effects are temperature and humidity. The direct
effect of these variables is as follows: for each percentual point
increase in temperature, there is between a 1% and 2% reduction in the
incidence of the disease. This effect is amplified via contagion, as
seen in the central panel in the figure, and the indirect effect can
further reduce the incidence by up to 1.5%. The effect of humidity is
also to reduce the incidence: each percentual point of increase in
humidity is associated with a reduction of up to 1.5% in incidence. With
the addition of the indirect effect, the total effect of a 1% increase
in humidity is to reduce incidence by up to 3%. As seen in the figure,
the indirect (i.e., contagion) effects are almost as strong as the
direct effects immediately before and at the beginning of the lockdown
period. However, by the end of the lockdown period, the indirect effects
have weakened considerably. The effect of density goes from positive
(+0.334) to negative (-0.244). It is crucial to keep in mind here that
this is the effect of density over a period of *lockdown* and possibly
subject to risk compensation, as discussed above. In other words, the
lockdown seems to be more effective in places with higher density.
Accordingly, cities should not rush to ease lockdowns, but rather
efforts should be made to reduce or eliminate risk compensation in less
densely populated regions.

What do these effects mean? Under a situation of lockdown,
inter-regional contagion is reduced, as expected, and the effect of
temperature is estimated to reduce the incidence of COVID-19 by between
one and two percent with each percentual increase of this variable.
Without a lockdown, or a relaxed lockdown, the effect is even greater,
but only because the disease is transmitted inter-regionally\! Imagine a
region that is closed to its neighbors: increases in temperature are
associated with smaller reductions in incidence - however, it does not
import or export cases. A province that is not closed and not under
lockdown will see a greater effect of temperature, but at the cost of
importing/exporting cases.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">

<caption>

Summary of direct, indirect, and total effects according to best model
(lag11: lagged 11-day moving average)

</caption>

<thead>

<tr>

<th style="text-align:left;">

Variable

</th>

<th style="text-align:right;">

Min

</th>

<th style="text-align:right;">

Mean

</th>

<th style="text-align:right;">

Max

</th>

<th style="text-align:left;">

Note

</th>

</tr>

</thead>

<tbody>

<tr grouplength="7">

<td colspan="5" style="border-bottom: 1px solid;">

<strong>Direct Effects</strong>

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(GDPpc)

</td>

<td style="text-align:right;">

0.679

</td>

<td style="text-align:right;">

0.679

</td>

<td style="text-align:right;">

0.679

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Older)

</td>

<td style="text-align:right;">

\-0.807

</td>

<td style="text-align:right;">

\-0.807

</td>

<td style="text-align:right;">

\-0.807

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Density)

</td>

<td style="text-align:right;">

\-0.220

</td>

<td style="text-align:right;">

\-0.096

</td>

<td style="text-align:right;">

0.168

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

Transit

</td>

<td style="text-align:right;">

0.344

</td>

<td style="text-align:right;">

0.517

</td>

<td style="text-align:right;">

0.584

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Humidity)

</td>

<td style="text-align:right;">

\-1.571

</td>

<td style="text-align:right;">

\-0.545

</td>

<td style="text-align:right;">

\-0.031

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Temperature)

</td>

<td style="text-align:right;">

\-2.019

</td>

<td style="text-align:right;">

\-1.421

</td>

<td style="text-align:right;">

\-0.929

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Sunshine)

</td>

<td style="text-align:right;">

\-0.283

</td>

<td style="text-align:right;">

0.095

</td>

<td style="text-align:right;">

0.206

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr grouplength="7">

<td colspan="5" style="border-bottom: 1px solid;">

<strong>Indirect Effects</strong>

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(GDPpc)

</td>

<td style="text-align:right;">

0.634

</td>

<td style="text-align:right;">

0.634

</td>

<td style="text-align:right;">

0.634

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Older)

</td>

<td style="text-align:right;">

\-0.753

</td>

<td style="text-align:right;">

\-0.753

</td>

<td style="text-align:right;">

\-0.753

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Density)

</td>

<td style="text-align:right;">

\-0.032

</td>

<td style="text-align:right;">

\-0.004

</td>

<td style="text-align:right;">

0.156

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

Transit

</td>

<td style="text-align:right;">

0.008

</td>

<td style="text-align:right;">

0.089

</td>

<td style="text-align:right;">

0.339

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Humidity)

</td>

<td style="text-align:right;">

\-1.466

</td>

<td style="text-align:right;">

\-0.156

</td>

<td style="text-align:right;">

\-0.001

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Temperature)

</td>

<td style="text-align:right;">

\-1.634

</td>

<td style="text-align:right;">

\-0.274

</td>

<td style="text-align:right;">

\-0.014

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Sunshine)

</td>

<td style="text-align:right;">

\-0.264

</td>

<td style="text-align:right;">

\-0.006

</td>

<td style="text-align:right;">

0.028

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr grouplength="7">

<td colspan="5" style="border-bottom: 1px solid;">

<strong>Total Effects</strong>

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(GDPpc)

</td>

<td style="text-align:right;">

1.313

</td>

<td style="text-align:right;">

1.313

</td>

<td style="text-align:right;">

1.313

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Older)

</td>

<td style="text-align:right;">

\-1.560

</td>

<td style="text-align:right;">

\-1.560

</td>

<td style="text-align:right;">

\-1.560

</td>

<td style="text-align:left;">

Constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Density)

</td>

<td style="text-align:right;">

\-0.244

</td>

<td style="text-align:right;">

\-0.100

</td>

<td style="text-align:right;">

0.324

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

Transit

</td>

<td style="text-align:right;">

0.500

</td>

<td style="text-align:right;">

0.606

</td>

<td style="text-align:right;">

0.772

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Humidity)

</td>

<td style="text-align:right;">

\-3.037

</td>

<td style="text-align:right;">

\-0.701

</td>

<td style="text-align:right;">

\-0.032

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Temperature)

</td>

<td style="text-align:right;">

\-3.385

</td>

<td style="text-align:right;">

\-1.695

</td>

<td style="text-align:right;">

\-0.946

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

<tr>

<td style="text-align:left; padding-left: 2em;" indentlevel="1">

log(Sunshine)

</td>

<td style="text-align:right;">

\-0.547

</td>

<td style="text-align:right;">

0.089

</td>

<td style="text-align:right;">

0.228

</td>

<td style="text-align:left;">

Non-constrained

</td>

</tr>

</tbody>

<tfoot>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<span style="font-style: italic;">Note: </span>

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Non-constrained: coefficient was allowed to vary across
equations

</td>

</tr>

<tr>

<td style="padding: 0; border: 0;" colspan="100%">

<sup></sup> Constrained: coefficient as constant across equations

</td>

</tr>

</tfoot>

</table>

![Temporal evolution of direct, indirect, and total effects by
date.](README_files/figure-gfm/plot-impacts-1.png)

# Concluding Remarks

In this paper we have presented a spatio-temporal analysis of incidence
of COVID-19 in Spain. The analysis covers a 30-day period that begins
immediately before the state of emergency was declared in the country.
The focus of the research has been on the environmental correlates of
incidence of the disease. There is a need for more empirical evidence,
as policy makers, public health practitioners, and the public begin
planning for the months ahead at this early stage of the pandemic.

Our results offer strong support for the hypothesis that incidence of
COVID-19 at the population level is lower at higher temperatures and
levels of humidity: the estiamated effect is a reduction in the
neighborhood of 3% percent in incidence per each 1% increase in
temperature, and a 3% reduction in incidence per 1% increase in humidity
*under conditions of contagion*. These reductions are estimated to be
lower when lockdown conditions are in place. The question here seems to
be whether these environmental variables can yield a bigger reduction of
*more* cases, or a smaller reduction of *fewer* cases. Our control
variables also offer some interesting insights. In particular, there is
evidence of behavioral adaptations in the form of risk compensation
(density) and compliance with the lockdown (sunshine). These results
offer a cautionary tale, with regards to the effectiveness of the
lockdown in more dense areas, and also the implications for compliance
with stay-at-home orders as the northern hemisphere moves towards summer
and more hours of sunshine during the day.

A key aspect of the analysis using spatial SUR models is that we were
able to model incidence of COVID-19 as an interregional contagion
process. Here, we find that the strength of the contagion effect was
dramatically reduced by the lockdown.

Needless to say, the analysis presented here is ecological, and at the
level of population health. For this reason, the analysis does not make
any claims with respect to the effect of ultraviolet light on the virus,
but rather about transmission of the virus in the population. In this
way, the analysis does not say that the virus moves less effectively
where more people live in close proximity to each other, but rather that
humans are more contagious when they feel safe in less dense regions.
Similarly, more sunshine does not mean that the virus thrives, but
rather that humans are more contagious to each other when their behavior
adapts to this environmental condition.

It is important, in this respect, to highlight some limitations of this
study.

First, the analysis was conducted under a situation of lockdown, and
therefore, besides the results are the beginning of the period examined,
one must exercise caution when trying to extrapolate the findings to
other situations. Secondly, it is well known that there is in many
countries substantial underreporting of cases of COVID-19 due to limited
testing. However, we do not suspect systematic provincial bias in
reporting, and as long as the underreporting is consistent across units
of analysis, we do not expect biased results - even if we are aware that
the number of true cases is likely higher. Thirdly, all environmental
data are based on a single station in a province. Here, we made an
effort to select the most representative station based on the
distribution of the population. An alternative approach would be to
calculate the environmental variables based on the average of multiple
stations within each province: this would likely smooth to some extent
these variables. Finally, we defined spatial neighborhoods based on
adjacency. It would be interesting to compare other connectivity
criteria, for instance based on domestic transportation instrastructure
and services. We flag this as a matter for future research.

# Acknowledgments

Add acknowledgments as appropriate in final draft.

The following `R` packages were used in the course of this investigation
and the authors wish to acknowledge their developers: `aemet` \[\],
`ggthemes` (Arnold 2019), `gridExtra` (Auguie 2017), `kableExtra` (Zhu
2019), `knitr` (Xie 2014, 2015), `lubridate` (Grolemund and Wickham
2011), `plm` (Millo 2017), `rticles` (Allaire et al. 2020), `sf`
(Pebesma 2018), `spdep` (Bivand, Pebesma, and Gomez-Rubio 2013), spsur
(Angulo et al. 2020) `tidyverse` (Wickham et al. 2019), `units`
(Pebesma, Mailund, and Hiebert 2016).

# References

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

<div id="ref-Anselin1988spatial">

Anselin, Luc. 1988. *Spatial Econometrics: Methods and Models*. Studies
in Operational Regional Science. Dordrecht: Kluwer Academic Publishers.

</div>

<div id="ref-Anselin2016estimation">

———. 2016. “Estimation and Testing in the Spatial Seemingly Unrelated
Regression (Sur).” Geoda Center for Geospatial Analysis; Computation,
Arizona State University. Working Paper 2016-01.

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

<div id="ref-Cao2010spatio">

Cao, ZhiDong, DaJun Zeng, XiaoLong Zheng, QuanYi Wang, FeiYue Wang,
JinFeng Wang, and XiaoLi Wang. 2010. “Spatio-Temporal Evolution of
Beijing 2003 Sars Epidemic.” Journal Article. *Science China Earth
Sciences* 53 (7): 1017–28. <https://doi.org/10.1007/s11430-010-0043-x>.

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

<div id="ref-Cliff1998detecting">

Cliff, AD, Peter Haggett, and MR Smallman-Raynor. 1998. “Detecting
Space—Time Patterns in Geocoded Disease Data. Cholera in London, 1854
Measles in the United States, 1962–95.” Book Section. In *Geomed’97*,
13–42. Springer.

</div>

<div id="ref-Coelho2020exponential">

Coelho, Marco Tulio Pacheco, Joao Fabricio Mota Rodrigues, Anderson
Matos Medina, Paulo Scalco, Levi Carina Terribile, Bruno Vilela, Jose
Alexandre Felizola Diniz-Filho, and Ricardo Dobrovolski. 2020.
“Exponential Phase of Covid19 Expansion Is Not Driven by Climate at
Global Scale.” Journal Article. *medRxiv*.

</div>

<div id="ref-Desjardins2020rapid">

Desjardins, MR, A Hohl, and EM Delmelle. 2020. “Rapid Surveillance of
Covid-19 in the United States Using a Prospective Space-Time Scan
Statistic: Detecting and Evaluating Emerging Clusters.” Journal Article.
*Applied Geography*, 102202.

</div>

<div id="ref-Elhorst2014spatial">

Elhorst, J Paul. 2014. *Spatial Econometrics: From Cross-Sectional Data
to Spatial Panels*. Book. Vol. 479. Springer.

</div>

<div id="ref-Fernandes2020economic">

Fernandes, Nuno. 2020. “Economic Effects of Coronavirus Outbreak
(Covid-19) on the World Economy.” Journal Article. *Available at SSRN
3557504*.

</div>

<div id="ref-Golgher2016interpret">

Golgher, André Braz, and Paul R Voss. 2016. “How to Interpret the
Coefficients of Spatial Models: Spillovers, Direct and Indirect
Effects.” *Spatial Demography* 4 (3): 175–205.

</div>

<div id="ref-Gong2020balance">

Gong, Binlei, Shurui Zhang, Lingran Yuan, and Kevin Z Chen. 2020. “A
Balance Act: Minimizing Economic Loss While Controlling Novel
Coronavirus Pneumonia.” Journal Article. *Journal of Chinese
Governance*, 1–20.

</div>

<div id="ref-Greene2003econometric">

Greene, William H. 2003. *Econometric Analysis*. Pearson Education
India.

</div>

<div id="ref-Grolemund2011dates">

Grolemund, Garrett, and Hadley Wickham. 2011. “Dates and Times Made Easy
with lubridate.” *Journal of Statistical Software* 40 (3): 1–25.
<http://www.jstatsoft.org/v40/i03/>.

</div>

<div id="ref-Hallet2002regional">

Hallet, Martin. 2002. “Regional Specialisation and Concentration in the
Eu.” Book Section. In *Regional Convergence in the European Union*,
53–76. Springer.

</div>

<div id="ref-Harbert2020spatial">

Harbert, Robert S, Seth W Cunningham, and Michael Tessler. 2020.
“Spatial Modeling Cannot Currently Differentiate Sars-Cov-2
Coronavirus and Human Distributions on the Basis of Climate in the
United States.” Journal Article. *medRxiv*.

</div>

<div id="ref-Hu2013scaling">

Hu, Hao, Karima Nigmatulina, and Philip Eckhoff. 2013. “The Scaling of
Contact Rates with Population Density for the Infectious Disease
Models.” Journal Article. *Mathematical Biosciences* 244 (2): 125–34.
<https://doi.org/https://doi.org/10.1016/j.mbs.2013.04.013>.

</div>

<div id="ref-Jaakkola2014decline">

Jaakkola, Kari, Annika Saukkoriipi, Jari Jokelainen, Raija Juvonen,
Jaana Kauppila, Olli Vainio, Thedi Ziegler, Esa Rönkkö, Jouni JK
Jaakkola, and Tiina M Ikäheimo. 2014. “Decline in Temperature and
Humidity Increases the Occurrence of Influenza in Cold Climate.” Journal
Article. *Environmental Health* 13 (1): 22.

</div>

<div id="ref-Jones2008global">

Jones, Kate E., Nikkita G. Patel, Marc A. Levy, Adam Storeygard, Deborah
Balk, John L. Gittleman, and Peter Daszak. 2008. “Global Trends in
Emerging Infectious Diseases.” Journal Article. *Nature* 451 (7181):
990–93. <https://doi.org/10.1038/nature06536>.

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

<div id="ref-Lauer2020incubation">

Lauer, Stephen A., Kyra H. Grantz, Qifang Bi, Forrest K. Jones, Qulu
Zheng, Hannah R. Meredith, Andrew S. Azman, Nicholas G. Reich, and
Justin Lessler. 2020. “The Incubation Period of Coronavirus Disease 2019
(Covid-19) from Publicly Reported Confirmed Cases: Estimation and
Application.” Journal Article. *Annals of Internal Medicine*.
<https://doi.org/10.7326/m20-0504>.

</div>

<div id="ref-Lauridsen2010spatiotemporal">

Lauridsen, Jorgen, Mickael Bech, Fernando López, and Mariluz Maté. 2010.
“A Spatiotemporal Analysis of Public Pharmaceutical Expenditure.” *The
Annals of Regional Science* 44 (2): 299–314.

</div>

<div id="ref-Legallo2006evaluating">

Le Gallo, Julie, and Sandy Dall’Erba. 2006. “Evaluating the Temporal and
Spatial Heterogeneity of the European Convergence Process, 1980–1999.”
*Journal of Regional Science* 46 (2): 269–88.

</div>

<div id="ref-LeSage2009introduction">

LeSage, James, and Robert Kelley Pace. 2009. *Introduction to Spatial
Econometrics*. Chapman; Hall/CRC.

</div>

<div id="ref-Lopez2017spatial">

López, Fernando A, Pedro J Martínez-Ortiz, and Juan-Gabriel
Cegarra-Navarro. 2017. “Spatial Spillovers in Public Expenditure on a
Municipal Level in Spain.” *The Annals of Regional Science* 58 (1):
39–65.

</div>

<div id="ref-Lopez2014spatial">

López, Fernando A, Jesús Mur, and Ana Angulo. 2014. “Spatial Model
Selection Strategies in a Sur Framework. The Case of Regional
Productivity in Eu.” *The Annals of Regional Science* 53 (1): 197–220.

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

<div id="ref-Meijers2008strategic">

Meijers, Evert, Joris Hoekstra, and Ricardo Aguado. 2008. “Strategic
Planning for City Networks: The Emergence of a Basque Global City?”
Journal Article. *International Planning Studies* 13 (3): 239–59.
<https://doi.org/10.1080/13563470802521440>.

</div>

<div id="ref-Meng2005understanding">

Meng, B., J. Wang, J. Liu, J. Wu, and E. Zhong. 2005. “Understanding the
Spatial Diffusion Process of Severe Acute Respiratory Syndrome in
Beijing.” Journal Article. *Public Health* 119 (12): 1080–7.
<https://doi.org/https://doi.org/10.1016/j.puhe.2005.02.003>.

</div>

<div id="ref-Millo2017robust">

Millo, Giovanni. 2017. “Robust Standard Error Estimators for Panel
Models: A Unifying Approach.” *Journal of Statistical Software* 82 (3):
1–27. <https://doi.org/10.18637/jss.v082.i03>.

</div>

<div id="ref-Minguez2019">

Mínguez, Roman, Fernando López, and Jesús Mur. 2019. “ML Versus Iv
Estimates of Spatial Sur Models: Evidence from the Case of Airbnb in
Madrid Urban Area.” *The Annals of Regional Science*, 1–35.

</div>

<div id="ref-Morency2011distance">

Morency, C., A. Páez, M. J. Roorda, R. G. Mercado, and S. Farber. 2011.
“Distance Traveled in Three Canadian Cities: Spatial Analysis from the
Perspective of Vulnerable Population Segments.” Journal Article.
*Journal of Transport Geography* 19 (1): 39–50.

</div>

<div id="ref-National2020rapid">

National Academies of Sciences, Engineering and Medicine. 2020. *Rapid
Expert Consultation on Sars-Cov-2 Survival in Relation to Temperature
and Humidity and Potential for Seasonality for the Covid-19 Pandemic
(April 7, 2020)*. Book. Washington, DC: The National Academies Press.
<https://doi.org/doi:10.17226/25771>.

</div>

<div id="ref-Noland1995perceived">

Noland, R. B. 1995. “Perceived Risk and Modal Choice - Risk Compensation
in Transportation System.” Journal Article. *Accident Analysis and
Prevention* 27 (4): 503–21.
<https://doi.org/10.1016/0001-4575(94)00087-3>.

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

<div id="ref-Perez2009agent">

Perez, Liliana, and Suzana Dragicevic. 2009. “An Agent-Based Approach
for Modeling Dynamics of Contagious Disease Spread.” Journal Article.
*International Journal of Health Geographics* 8 (1): 50.

</div>

<div id="ref-Phillips2011risk">

Phillips, R. O., A. Fyhri, and F. Sagberg. 2011. “Risk Compensation and
Bicycle Helmets.” Journal Article. *Risk Analysis* 31 (8): 1187–95.
<https://doi.org/10.1111/j.1539-6924.2011.01589.x>.

</div>

<div id="ref-Prem2017projecting">

Prem, Kiesha, Alex R Cook, and Mark Jit. 2017. “Projecting Social
Contact Matrices in 152 Countries Using Contact Surveys and Demographic
Data.” *PLoS Computational Biology* 13 (9): e1005697.

</div>

<div id="ref-Rey1999us">

Rey, Sergio J, and Brett D Montouri. 1999. “US Regional Income
Convergence: A Spatial Econometric Perspective.” *Regional Studies* 33
(2): 143–56.

</div>

<div id="ref-Richens2000risk">

Richens, J., J. Imrie, and A. Copas. 2000. “Condoms and Seat Belts: The
Parallels and the Lessons.” Journal Article. *Lancet* 355 (9201):
400–403. <https://doi.org/10.1016/s0140-6736(99)09109-6>.

</div>

<div id="ref-Roorda2010trip">

Roorda, M. J., A. Paez, C. Morency, R. Mercado, and S. Farber. 2010.
“Trip Generation of Vulnerable Populations in Three Canadian Cities: A
Spatial Ordered Probit Approach.” Journal Article. *Transportation* 37
(3): 525–48. <https://doi.org/10.1007/s11116-010-9263-3>.

</div>

<div id="ref-Sikder2012immobility">

Sikder, S., and A. R. Pinjari. 2012. “Immobility Levels and Mobility
Preferences of the Elderly in the United States Evidence from 2009
National Household Travel Survey.” Journal Article. *Transportation
Research Record*, no. 2318: 137–47. <https://doi.org/10.3141/2318-16>.

</div>

<div id="ref-Singh2020age">

Singh, Rajesh, and R Adhikari. 2020. “Age-Structured Impact of Social
Distancing on the Covid-19 Epidemic in India.” *arXiv Preprint
arXiv:2003.12055*.

</div>

<div id="ref-Novel2020epidemiological">

The Novel Coronavirus Pneumonia Emergency Response Epidemiology Team.
2020. “The Epidemiological Characteristics of an Outbreak of 2019 Novel
Coronavirus Diseases (Covid-19)—China, 2020.” Journal Article. *China
CDC Weekly* 2 (8): 113–22.

</div>

<div id="ref-vanWagner2008toward">

Van Wagner, Estair. 2008. “Toward a Dialectical Understanding of
Networked Disease in the Global City: Vulnerability, Connectivity,
Topologies.” Journal Article. *Networked Disease: Emerging Infections in
the Global City*, 13–26.

</div>

<div id="ref-Wang2010gis">

Wang, Jiasheng, Jianhong Xiong, Kun Yang, Shuangyun Peng, and Quanli Xu.
2010. “Use of Gis and Agent-Based Modeling to Simulate the Spread of
Influenza.” Conference Proceedings. In *2010 18th International
Conference on Geoinformatics*, 1–6. IEEE.

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

<div id="ref-Yao2020association">

Yao, Ye, Jinhua Pan, Zhixi Liu, Xia Meng, Weidong Wang, Haidong Kan, and
Weibing Wang. 2020. “No Association of Covid-19 Transmission with
Temperature or Uv Radiation in Chinese Cities.” Journal Article.
*European Respiratory Journal*, 2000517.
<https://doi.org/10.1183/13993003.00517-2020>.

</div>

<div id="ref-Yu2013characterization">

Yu, H. J., W. J. Alonso, L. Z. Feng, Y. Tan, Y. L. Shu, W. Z. Yang, and
C. Viboud. 2013. “Characterization of Regional Influenza Seasonality
Patterns in China and Implications for Vaccination Strategies:
Spatio-Temporal Modeling of Surveillance Data.” Journal Article. *Plos
Medicine* 10 (11): 16. <https://doi.org/10.1371/journal.pmed.1001552>.

</div>

<div id="ref-Zellner1962efficient">

Zellner, Arnold. 1962. “An Efficient Method of Estimating Seemingly
Unrelated Regressions and Tests for Aggregation Bias.” *Journal of the
American Statistical Association* 57 (298): 348–68.

</div>

<div id="ref-Zhou2016accelerated">

Zhou, Yanqiu Rachel, and William D Coleman. 2016. “Accelerated Contagion
and Response: Understanding the Relationships Among Globalization, Time,
and Disease.” Journal Article. *Globalizations* 13 (3): 285–99.

</div>

<div id="ref-Zhu2019">

Zhu, Hao. 2019. *KableExtra: Construct Complex Table with ’Kable’ and
Pipe Syntax*. <https://CRAN.R-project.org/package=kableExtra>.

</div>

</div>
