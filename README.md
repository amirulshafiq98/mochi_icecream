# Mochi Sensory Analysis and Formulation Optimization

## Project Background

Understanding the sensory properties of food products is crucial in food science and consumer research. This sensory evaluation analyzes 5 formulations of Mochi Ice-Cream, each rated by 22 untrained individuals using a 9-point Likert scale (1 = strongly dislike, 9 = strongly like) across several sensory attributes.

The objective is to identify the most preferred formulation for upscaling by analysing its sensory profile and acceptability. To achieve this, Principal Component Analysis (PCA) and K-Means Clustering are used to segment consumer preferences and highlight which formulations align with key sensory traits. This approach also reveals which attributes were most valued by the panel, informing potential areas for formulation improvement.

This project mimics a real-world data pipeline, featuring:

- **Data Storage:** Raw sensory evaluation data is stored in a PostgreSQL database.

- **Data Transformation:**  dbt (Data Build Tool) is used to create clean, tested, and reproducible tables ready for analysis.

- **Advanced Analytics:** Python (via Jupyter Notebook) performs PCA for dimensionality reduction, K-Means Clustering for product segmentation and boxplots to compare acceptability scores among clusters.

- **Insights & Visualization:** Interactive plots support data exploration and decision-making.

**Key Technologies Used:** PostgreSQL, dbt, Python (Pandas, Scikit-learn, Plotly), Jupyter Notebook, Git.

---
**[PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**
*(e.g., A simple diagram showing data flow from raw data -> dbt -> Postgres -> Jupyter -> Insights, or a project architectural diagram demonstrating how the components connect.)*
---

## Data Structure

The raw dataset contains detailed sensory evaluation results for various Mochi formulations. The data includes the following attributes (features):

**[PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

* `submission_id`: Unique identifier for each sensory evaluation record.
* `formulation`: Identifies the specific Mochi formulation being evaluated.
* `bitterness_score`: Sensory score indicating bitterness.
* `sweetness_score`: Sensory score indicating sweetness.
* `chamomile_flavour_score`: Sensory score for chamomile flavour.
* `honey_flavour_score`: Sensory score for honey flavour.
* `creaminess_score`: Sensory score for creaminess.
* `overall_acceptability_score`: An overall consumer acceptance score.

## Executive Summary

### Overview:

Based on the WCSS (Within-Cluster Sum of Squares) elbow method, the optimal number of clusters was K = 10. PCA analysis revealed that the first three components explained ~80% of the total variance.

After clustering, Cluster 4 had the highest overall acceptability (mean = 5.3, max = 7.0). Within this cluster, Formulation 1 emerged as the top candidate for upscaling among 15 panellists.

PCA interpretation indicated that Cluster 4 individuals valued creaminess, sweetness, and honey flavour. These sensory traits may serve as optimisation targets in future formulation development.

## Code

This section provides a high-level overview of the technical implementation and the Python code's functionality.

### Python Libraries Used:
* `scikit-learn`: For PCA and K-Means Clustering.
* `pandas`: For robust data manipulation and analysis.
* `numpy`: For efficient numerical operations.
* `matplotlib` & `seaborn`: For creating static data visualizations.
* `plotly` & `plotly-express`: For generating interactive and dynamic data visualizations, particularly useful for 3D biplots.
* `sqlalchemy` & `psycopg2-binary`: For establishing a secure and efficient connection between Python and the PostgreSQL database.

### Code Implementation Overview:

The Python script in the Jupyter Notebook is structured to guide the analysis from data ingestion to visualization and insight generation:

* **Initial Data Handling:** Securely connects to PostgreSQL and loads the dbt-transformed sensory dataset into a Pandas DataFrame. Initial data checks (e.g., blank rows) ensure integrity.

**1 [PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

* **Data Preprocessing and PCA Application:** Uses `StandardScaler` to normalize sensory scores, ensuring fair comparison across attributes. PCA is then applied to reduce dimensionality and highlight dominant trends in sensory perception.

**2 [PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

* **Clustering and Visualization Generation:** Performs K-Means Clustering on PCA-transformed data to identify preference segments. Visualisations include explained variance plots, 2D PCA biplots, and interactive 3D plots for cluster interpretation.

**3 [PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

* **Boxplot Comparisons:** Generates boxplots (via `seaborn`, `matplotlib`) to compare sensory scores across clusters. These highlight which clusters score higher on traits like sweetness and creaminess.

**4 [PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

* **Result Export:** Final dataset `mochi_pca_clustered_data.csv` includes PCA scores and cluster assignments for each sample, supporting further review or stakeholder presentation.

**5 [PLACEHOLDER FOR AN OVERVIEW IMAGE/DIAGRAM HERE]**

### PCA Implementation Details:
- **Standardization:** Ensures each feature contributes equally using `StandardScaler`.

- **Principal Components:** PC1, PC2  and PC3 captured the majority of variance (80%).

- **Loadings Analysis:** Identified which sensory traits most influenced each component.

- **Biplots:** Visualised relationships between samples and features in reduced space.

### Correlation Factor and Feature Influence:
- Calculated loadings to determine which sensory features contribute most to PC1 and PC2.

- Used biplots to show how formulations and attributes align in PCA space.

### K-means Clustering:
- Grouped individuals based on PCA scores to identify sensory preference patterns.

- Helped match formulations with target clusters for product strategy.

### Cluster Boxplots:
- Used standardized sensory values to ensure fair comparisons.

- Boxplots reveal attribute strengths/weaknesses across clusters.

## Recommendations

- Use cluster analysis to select top-performing formulations based on specific sensory goals (e.g., sweeter, creamier profiles).

- Formulation 1 from Cluster 4 is the best candidate for upscaling.

- Conduct confirmatory consumer testing to validate findings in real market settings.

## Limitations

- **Sample Size:** Based on 5 formulations and 22 participants; expanding the dataset would improve robustness.

- **PCA Subjectivity:** PCA interpretation relies on correlation-based assumptions and may vary.

- **Context Factors:** Real-world variables like storage, packaging, and market demographics are not considered.

- **Panel Variability:** Results depend on the consistency of the untrained sensory panel.
