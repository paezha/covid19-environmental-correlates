
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
Seasonality  
Temperature  
Humidity  
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

# Context, Data, and Methods

## Covid-19 in Spain

For a better interpretation of the results of our analysis is necessary
to know the chronology of the epidemic outbreak in Spain. This
subsection presents a brief time line of COVID-19.

The first reported case of COVID-19 in Spain was on January 31th, were a
German tourist in the Canary Islands was positively tested, but the
first not imported case was diagnostic on February 27th in Sevilla
province (Andalusia). The epidemic was growing slowly at the beginning
but in March 11th the World Health Organization (WHO) declared
officially the pandemic. This declaration was a break point and on March
13th the Spanish National Government declare the “Emergency Status”. At
this date, Spain have been declared 4209 cases of COVID-19 (mostly of
cases, 1990, in Madrid). Only essential services (e.g. food, health) and
some economic subsector of industry and construction could to maintain
activity. On March 17th Spain closes its lands borders and only allows
entry to nationals and residents. From March 30th to April 12th (April
10th-12th Easter) lockdown of the Spanish people was hardened and only
essential activities were allowed.

## Selection of Variables

Explain the rationale for selecting the variables.

For example: The literature about COVID-19 suggested that population
density is the one of the most important proliferate cause of these
viscous, however this ill spread with different intensity at big cities
of the world. Controlling for socioeconomic characteristics the
objective of this paper is observe the effect of clime on COVID-19
proliferation.

Some questions are important to point out. Is not evident present a
diary association between the temprature (resp. humidity) with declarate
case. There is evidences (ref) that a time lag is necessary between the
day that the individuo inffect and the case is diagnosticate

## Sources of Data

Our dataset includes information about the daily number of cases of
COVID-19 reported in Spain at the provincial level (NUTIII in Eurostat
terminology) for the period between March 13th and April 11th,
inclusive. This gives a temporal coverage of 30 days and spatial
coverage of 50 units. For our purposes, we consider positive cases
reported, but excluding symptomatic cases diagnosed by a doctor without
a Polymerase Chain Reaction (PCR) test. The Spanish National Government
publishes periodic updates at the regional level (NUTII) and the
information is also released at the provincial level as part of a
collaborative project \[**by whom?**\]. This information is compiled
from several sources, mainly the official web pages of the Spanish
regional goverments. In addition, we consider two sets of explanatory
variables. The first one, and the focus of this research, is set of two
environmental variables, namely temperature and humidity, which are
collected from official sources (i.g., AEMET, the state meteorology
agency, and MAPA, the ministry of agriculture, fisheries, and food). The
second set provides some relevant controls for multivariate analysis,
and refers to economic and demographic attributes of the province (also
collected from official sources, i.e., INE, the national statistics
institute). Table  shows the descriptive statistics and the provenance
of the data.

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

Montera34

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

4.77

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

<sup></sup> Montera34:
<https://code.montera34.com:4443/numeroteca/covid19/-/blob/master/README_providencialdata19.md>

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

## Methods: Spatial SUR

The Seemingly Unrelated Regression equations model (SUR from now on) is
a multivariate econometric formulation used in different fields when the
data set is organized as cross-sections for different time periods. The
basis of this approach is well-known since the initial works of Zellner
(<span class="citeproc-not-found" data-reference-id="Zellner1962efficient">**???**</span>)
and now is a popular methodology included in several Econometrics
textbook (e.g.,
<span class="citeproc-not-found" data-reference-id="Greene2003econometric">**???**</span>).
To our knowledge, Anselin (1988) was the first text that introduced the
term spatial SUR in reference to a model made of ‘an equation for each
time period, which is estimated for a cross section of spatial units’
(p. 141). From this milestone, a huge researches used this methodology
in spatial framework. Rey and Montouri
(<span class="citeproc-not-found" data-reference-id="Rey1999us">**???**</span>),
Fingleton
(<span class="citeproc-not-found" data-reference-id="Fingleton2007multi">**???**</span>),
Lauridsen et
al. (<span class="citeproc-not-found" data-reference-id="Lauridsen2010spatiotemporal">**???**</span>),
Le Gallo and Dall’Erba
(<span class="citeproc-not-found" data-reference-id="Legallo2006evaluating">**???**</span>),
and Lopez et
al. (<span class="citeproc-not-found" data-reference-id="Lopez2017spatial">**???**</span>)
are well-known examples in this line.

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
-->

<!--Equation for README.md generated using this app https://alexanderrodin.com/github-latex-markdown/-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-sim%7D%20%5Cbegin%7Bbmatrix%7D%20y_1%20%5C%5C%20y_2%20%5C%5C%20%5Cvdots%20%5C%5C%20y_T%20%5Cend%7Bbmatrix%7D%20%3D%20%5Cbegin%7Bbmatrix%7D%20X_1%20%26%200%20%26%20%5Ccdots%20%26%200%20%5C%5C%200%20%26%20X_2%20%26%20%5Ccdots%20%26%200%20%5C%5C%20%5Cvdots%20%26%20%5Cvdots%20%26%20%5Cddots%20%26%20%5Cvdots%20%5C%5C%200%20%26%200%20%26%20%5Ccdots%20%26%20X_T%20%5Cend%7Bbmatrix%7D%20%5C%20%5Cbegin%7Bbmatrix%7D%20%5Cbeta_1%20%5C%5C%20%5Cbeta_1%20%5C%5C%20%5Cvdots%20%5C%5C%20%5Cbeta_T%20%5Cend%7Bbmatrix%7D%20%2B%20%5Cbegin%7Bbmatrix%7D%20%5Cepsilon_1%20%5C%5C%20%5Cepsilon_2%20%5C%5C%20%5Cvdots%20%5C%5C%20%5Cepsilon_T%20%5Cend%7Bbmatrix%7D%20%5Cend%7Bequation%7D)

where \(y_{t}=(y_{1t},...,y_{Nt})\) is a \(N \times 1\) vector, and in
our case \(y_{st}\) is the incidence ratio in the province \(s\)
(\(s=1,...,N\)) the day \(t\) \((t=1,...,T)\); \(X_t=(X^1,...,X^{k_t})\)
is a \(N \times k_t\) matrix of the \(k_t\) independent variables,
\(X_i=(X^i_{st})\); \(\beta_t=(\beta_{1t},...,\beta_{Nt})\) is a vector
of coefficients and \(\epsilon_t=(\epsilon_{1t},...,\epsilon_{Nt})\) is
the vector of residuals.

The more relevant characteristic of a SUR model is the dependence
structure among the vectors of residuals, namely:

<!--
\begin{equation}
\label{eq:sur-err}
E[\epsilon_t \epsilon'_{t'}]=\sigma_{tt'}
\end{equation} 
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-err%7D%20E%5B%5Cepsilon_t%20%5Cepsilon'_%7Bt'%7D%5D%3D%5Csigma_%7Btt'%7D%20%5Cend%7Bequation%7D%20)

Note that this specification is very flexible, in that it allows changes
in the coefficients \(\beta_{it}\) in order to modulate the effect of
\(X^i_{.t}\) on \(y_t\). This flexibility can be reduced and it is
posible to impose restrinctions considering some \(\beta\) coefficients
as being constant over time. In this case, we can reformulate the
coefficients expression of
\(\beta_t = (\beta_{1}, \cdots, \beta_{r-1}, \beta_{r}, \beta_{r+1}, \cdots, \beta_{Nt})\)
considering the first \(r\) coefficients contanst.

Equation ) can be rewriten in compact form:

<!--
\begin{equation}
y = X \beta + \epsilon
\end{equation}
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20y%20%3D%20X%20%5Cbeta%20%2B%20%5Cepsilon%20%5Cend%7Bequation%7D)

where….

As is the case of cross-sectional data, it is possible identify spatial
autocorrelation in the residuals of Model , and several Lagrange
Multipliers tests have been developed to test the null hypothesis of
spatial independence (see López, Mur, and Angulo 2014). When the null
hypothesis is rejected, there are alternative several specifications
that have been propose to include spatial effects (Anselin 1988, see
also 2016). In this paper we consider a spatial SUR model that
incorporates a spatial lag of the dependent variable as an explanatory
factor. The stack expresion for the spatial lag SUR model (SUR-SLM),

<!--
\begin{equation}
\label{eq:sur-slm}
\bf{A}y = X \beta + \epsilon \\
\epsilon =N(0,\Omega)
\end{equation}
-->

![](https://render.githubusercontent.com/render/math?math=%5Cbegin%7Bequation%7D%20%5Clabel%7Beq%3Asur-slm%7D%20%5Cbf%7BA%7Dy%20%3D%20X%20%5Cbeta%20%2B%20%5Cepsilon%20%5C%5C%20%5Cepsilon%20%3DN\(0%2C%5COmega\)%20%5Cend%7Bequation%7D)

where A =\(I_{TN}-\bf{\Lambda} \otimes W\) with
\(\bf{\Lambda} = diag(\lambda_1, \cdots, \lambda_T)\).

This specification assumes that incidence in a province (\(y_st\)) at
time \(t\) is partially determined by the weighted average (\(Wy_{st}\))
of incidence in neighbouring provinces. Parameters of spatial dependence
are estimated for each time period \(\lambda_t\) and identifies the
intensity and the sign of the impacts of neighbourhood. It is possible
test the null hypotheis of identtical levels of spatial dependence
(\(\lambda_i=\lambda_j, \forall i,j\)). The correspond Wald test is
available in the R package **spsur**

The SUR-SLM model can be estimated using maximum likelihood (López, Mur,
and Angulo (2014)) or instrumental variables (Mínguez, López, and Mur
(2019)).

Another alternative methodologies could be use. By example, a dynamic
spatial panel methodology with fixed spatial an temporal effects
(e.g. Elhorst 2014, Cap. 4), but those models are more dont take
account correlation between errors. Therefore, a spatial SUR approach is
more reasonable for our purpose.

# Analysis and Results

## Exploratory Data Analysis

We begin with the exploratory analysis of the data.

Figure  shows the geographical variation in the incidence of the
disease, as well as its temporal progression in weekly averages. Our
analysis begins on March 13, which is the first date when every province
had reported at least one case of COVID-19. It can be seen that the
highest incidence at this early date was in the provice of Álava, in the
North of Spain. While not the most populous province, with a population
of only 331,549, Álava has the highest GDP per capita of all provinces.
Vitoria, its main city, is the capital of the Basque country and has
been the focus of efforts to develop a “Global Basque City” (Meijers,
Hoekstra, and Aguado 2008), along with San Sebastian and Bilbao. The
other early focus of the pandemic in Spain was Madrid, which is the most
populous province in the country and has the second highest GDP per
capita after Álava. The early outbreaks in these two provinces can be
traced throughout the progression of the pandemic over time, although by
the end of the period under consideration, other provinces had matched
and even surpased their incidence rates, including Segovia and Soria to
the north of Madrid, and Ciudad Real and Albacete to the south.

![Mean weekly incidence of COVID-19 by province, in reported cases by
100,000 people (map omits Islas
Canarias)](README_files/figure-gfm/weekly-average-incidence-map-1.png)

To visualize the distribution of temperature and humidity we aggregate
the provinces by Autonomous Community. In Figure  the communities have
been sorted by latitude, so that Principado de Asturias is the
northernmost community, and Canarias the southernmost. There is a
relatively wide range of values both within and between provinces over
the 30 day period examined. The top panel of the figure shows the
distribution of mean temperature. The lowest mean temperature for a
community on any given day is 2.8C, and the highest is 22.4C for a range
of approximately 20 degrees. Likewise, there is a great deal of
variability in humidity, as seen in the bottom panel of the figure,
where the lowest mean humidity for any community is 48.3 and the highest
is 99.6. The actual values for the provinces display somewhat more
variability even.

![ Distribution of mean temperatures and humidities in the Autonomous
Communities in Spain between March 12, 2020 and April 11, 2020. The
Autonomous Communities have been sorted by latitude, with communities to
the left being the northermost, and to the right the
southernmost](README_files/figure-gfm/descriptives-temperature-1.png)

![Spatial distribution of control variables by province (maps omits
Islas Canarias)](README_files/figure-gfm/control-map-1.png)

Figure  shows the distribution of daily correlations of the independent
variables with incidence of COVID-19, after log-transforming all
variables. It can be seen there that the correlation of GDPpc and
temperature (in its three definitions) have the strongest positive and
negative correlations with incidence, respectively. Percentage of older
adults displays somewhat weaker negative correlations with incidence, as
does density. It can be seen that the humidity variable, in its three
forms, tends to be possitively correlated with incidence of COVID-19.

![Distribution of daily correlations of the independent variables with
daily incidence of COVID-19 (all variables have been
log-transformed)](README_files/figure-gfm/daily-correlations-1.png)

## SUR Models

The goodness of fit of the three systems of equations is shown in Figure
.

![ Goodness of fit of the SUR systems: by date and
pooled](README_files/figure-gfm/goodness-of-fit-1.png)

Summary of best model.

<table class="table table-striped table-condensed" style="margin-left: auto; margin-right: auto;">

<caption>

Summary of estimation results best model (lagged 11-day moving average)

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

7.175

</td>

<td style="text-align:right;">

10.008

</td>

<td style="text-align:right;">

13.845

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

0.513

</td>

<td style="text-align:right;">

0.513

</td>

<td style="text-align:right;">

0.513

</td>

<td style="text-align:right;">

0

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

0

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

\-0.783

</td>

<td style="text-align:right;">

\-0.783

</td>

<td style="text-align:right;">

\-0.783

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

\-0.217

</td>

<td style="text-align:right;">

\-0.092

</td>

<td style="text-align:right;">

0.188

</td>

<td style="text-align:right;">

19

</td>

<td style="text-align:right;">

1

</td>

<td style="text-align:right;">

10

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

0.300

</td>

<td style="text-align:right;">

0.518

</td>

<td style="text-align:right;">

0.595

</td>

<td style="text-align:right;">

11

</td>

<td style="text-align:right;">

10

</td>

<td style="text-align:right;">

9

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

\-1.176

</td>

<td style="text-align:right;">

\-0.372

</td>

<td style="text-align:right;">

0.342

</td>

<td style="text-align:right;">

17

</td>

<td style="text-align:right;">

4

</td>

<td style="text-align:right;">

9

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

\-2.048

</td>

<td style="text-align:right;">

\-1.431

</td>

<td style="text-align:right;">

\-0.989

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

# Discussion

Figure  shows the temporal evolution of the spatial autocorrelation
coefficient (\(\rho\)).

![Temporal evolution of spatial autocorrelation
coefficient](README_files/figure-gfm/delta-time-1.png)

Figure  shows the temporal evolution of the intercept.

![Temporal evolution of
intercept](README_files/figure-gfm/beta-intercept-time-1.png)

Figure  shows the temporal evolution of the coefficient for
\(\log(Density)\).

![Temporal evolution of coefficient for
log(Density)](README_files/figure-gfm/beta-density-time-1.png)

Figure  shows the temporal evolution of the coefficient for \(Transit\).

![Temporal evolution of coefficient for
Transit](README_files/figure-gfm/beta-transit-time-1.png)

Figure  shows the temporal evolution of the coefficient for
\(\log(Humidity)\).

![Temporal evolution of coefficient for
log(Humidity)](README_files/figure-gfm/beta-humidity-time-1.png)

Figure  shows the temporal evolution of the coefficient for
\(\log(Temperature)\).

![Temporal evolution of coefficient for
log(Temperature)](README_files/figure-gfm/beta-temperature-time-1.png)

# Concluding Remarks

More words go here.

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
