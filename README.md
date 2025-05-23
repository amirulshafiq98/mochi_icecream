# Mochi Sensory Analysis and Formulation Optimisation

## Project Background

Understanding the sensory properties of food products is crucial in food science and consumer research. This sensory evaluation analyses 5 formulations of Mochi Ice-Cream, each rated by 21 untrained individuals using a 9-point Likert scale (1 = strongly dislike, 9 = strongly like) across several sensory attributes.

The objective is to identify the most preferred formulation for upscaling by analysing its sensory profile and acceptability. To achieve this, Principal Component Analysis (PCA) and K-Means Clustering are used to segment consumer preferences and highlight which formulations align with key sensory traits. This approach also reveals which attributes were most valued by the panel, informing potential areas for formulation improvement.

This project mimics a real-world data pipeline, featuring:

- **Data Storage:** Raw sensory evaluation data is stored in a PostgreSQL database.

- **Data Transformation:**  dbt (Data Build Tool) is used to create clean, tested, and reproducible tables ready for analysis.

- **Advanced Analytics:** Python (via Jupyter Notebook) performs PCA for dimensionality reduction, K-Means Clustering for product segmentation and boxplots to compare acceptability scores among clusters.

- **Insights & Visualisation:** Interactive plots support data exploration and decision-making.

**Key Technologies Used:** PostgreSQL, dbt, Python (Pandas, Scikit-learn, Plotly), Jupyter Notebook, Git.

![Flowchart](https://github.com/user-attachments/assets/d0b63d8f-4f04-4268-9303-3cccb6beb45a)

## Data Structure

The pivoted dataset contains detailed sensory evaluation results for various Mochi formulations. The data includes the following attributes (features):

![Excel Table](https://github.com/user-attachments/assets/6e82d5d1-23db-4962-b0cf-8d5c5c0b81bb)

* `submission_id`: Unique identifier for each sensory evaluation record.
* `formulation`: Identifies the specific Mochi formulation being evaluated.
* `bitterness_score`: Sensory score indicating bitterness.
* `sweetness_score`: Sensory score indicating sweetness.
* `chamomile_flavour_score`: Sensory score for chamomile flavour.
* `honey_flavour_score`: Sensory score for honey flavour.
* `creaminess_score`: Sensory score for creaminess.
* `overall_acceptability_score`: An overall consumer acceptance score.

The raw sensory evaluation data for Mochi formulations is stored in `data/raw/Mochi Flavours Sensory.csv`. This Excel file contains the initial panel evaluation scores before any processing or transformation.

## Executive Summary

### Overview:

Based on the WCSS (Within-Cluster Sum of Squares) elbow method, the optimal number of clusters was K = 10. PCA analysis revealed that the first three components explained ~80% of the total variance.

After clustering, Cluster 4 had the highest overall acceptability (mean = 5.3, max = 7.0). Within this cluster, Formulation 1 emerged as the top candidate for upscaling among 21 panellists.

PCA interpretation indicated that Cluster 4 individuals valued creaminess, sweetness, and honey flavour. These sensory traits may serve as optimisation targets in future formulation development.

![PC1_2](https://github.com/user-attachments/assets/61ba8312-ef34-4c2b-bd4b-b971ff4e2eef)
![PC2_3](https://github.com/user-attachments/assets/eb8b0060-33d5-425a-a821-e1012cb5c3c8)
![PC1_3](https://github.com/user-attachments/assets/d1345693-2b59-4c5a-9644-356172913716)

## Data Preparation with SQL & dbt

The initial raw data is ingested into the PostgreSQL database via a Python script located at `scripts/Import Excel.py`. This script handles the secure connection to the database and uploads the raw Excel data, which is then further transformed using dbt within the PostgreSQL environment.

Before performing any analysis in Python, raw sensory evaluation data was ingested and transformed using SQL and dbt:

- **Staging Model (stg_panel_evaluations.sql):**

    - Renamed and cast columns from the raw panel data source.

    - Each formulation (1–5) had its sensory attributes flattened into consistent column names (e.g., bitterness_1, sweetness_1, etc.).

    - Only numerical fields like bitterness and overall_acceptability were safely cast at this stage.

- **Fact Model (fct_panel_evaluations_unpivoted.sql):**

    - Unpivoted the wide-format panel evaluation data into a normalized, long format where each row represents one formulation evaluated by one participant.

    - Used SUBSTRING + STRPOS logic to extract Likert scores embedded in parentheses (e.g., "(1) Not Sweet at All") and cast them as integers.

    - Generated unique submission_ids using formatted timestamps (TO_CHAR(raw_timestamp, 'YYYYMMDDHH24MISS')) to track each evaluation.

## Code

This section provides a high-level overview of the technical implementation and the Python code's functionality.

### Python Libraries Used:
* `scikit-learn`: For PCA and K-Means Clustering.
* `pandas`: For robust data manipulation and analysis.
* `numpy`: For efficient numerical operations.
* `matplotlib` & `seaborn`: For creating static data visualisations.
* `plotly` & `plotly-express`: For generating interactive and dynamic data visualisations, particularly useful for 3D biplots.
* `sqlalchemy` & `psycopg2-binary`: For establishing a secure and efficient connection between Python and the PostgreSQL database.

### Code Implementation Overview:

The Python script in the Jupyter Notebook is structured to guide the analysis from data ingestion to visualisation and insight generation:

* **Initial Data Handling:** Securely connects to PostgreSQL and loads the dbt-transformed sensory dataset into a Pandas DataFrame. Initial data checks (e.g., blank rows) ensure integrity.

![First](https://github.com/user-attachments/assets/6f9717d5-f9c3-426e-8f7b-8053a51924c8)

* **Data Preprocessing and PCA Application:** Uses `StandardScaler` to normalize sensory scores, ensuring fair comparison across attributes. PCA is then applied to reduce dimensionality and highlight dominant trends in sensory perception. A Scree Plot was generated to evaluate how much variance is explained by each principal component. This helped determine how many components to retain. The first three PCs together explained approximately 80% of the total variance, which was sufficient to capture the majority of trends in the sensory data. These components were then used for downstream clustering and visualization tasks.
  
![Second_1](https://github.com/user-attachments/assets/618f7932-668f-45f4-b916-ce9788409db5)
![Second_2](https://github.com/user-attachments/assets/2de732f3-33bf-4f3e-b897-abf196f274d9)

* **Elbow Method for K-Means Clustering (WCSS):** To identify the optimal number of clusters for segmenting consumer preferences, the Elbow Method was applied using the Within-Cluster Sum of Squares (WCSS). The plot showed a clear “elbow” at K = 10, suggesting this as the most appropriate number of clusters to represent distinct sensory preference groups.

![Fourth](https://github.com/user-attachments/assets/acab9117-bc2c-48c6-9caf-c387c5d63615)

* **Clustering and Visualisation Generation:** Performs K-Means Clustering on PCA-transformed data to identify preference segments. Visualisations include explained variance plots, 2D PCA biplots, and interactive 3D plots for cluster interpretation.

![Fifth_1](https://github.com/user-attachments/assets/90dea725-441f-437e-baa1-21b621fff8f7)
![Fifth_2](https://github.com/user-attachments/assets/3dde6329-5617-4b00-a28a-4dae95c31f52)
![Fifth_3](https://github.com/user-attachments/assets/8de3985d-bf3a-4b45-888a-7238c395b8c5)

* **Boxplot Comparisons:** Generates boxplots (via `seaborn`, `matplotlib`) to compare sensory scores across clusters. These highlight which clusters score higher on traits like sweetness and creaminess.

![Sixth_1](https://github.com/user-attachments/assets/c6b74680-311a-4e9c-b87b-deb365207ae9)
![Sixth_2](https://github.com/user-attachments/assets/b118b922-3aef-4120-8863-ad4cad8d9e40)

* **Result Export:** Final dataset `mochi_pca_clustered_data.csv` includes PCA scores and cluster assignments for each sample, supporting further review or stakeholder presentation.

![Export](https://github.com/user-attachments/assets/a39681e2-2b6a-4fab-9313-f6cd85b5bd24)

### PCA Implementation Details:

The final analysed dataset, enriched with PCA components and K-Means clustering assignments can be found here `data/processed/mochi_pca_clustered_data.csv`. This contains the comprehensive results of the sensory data analysis and can be used for further reporting or visualisation.

- **Standardization:** Ensures each feature contributes equally using `StandardScaler`.

- **Principal Components:** PC1, PC2  and PC3 captured the majority of variance (~80%).

- **Loadings Analysis:** Identified which sensory traits most influenced each component.

- **Biplots:** Visualised relationships between samples and features in reduced space.

### Correlation Factor and Feature Influence:
![Scree](https://github.com/user-attachments/assets/2aa6037a-86f7-4d4f-95bc-0a38b142541f)
![Correlation](https://github.com/user-attachments/assets/297c8e97-9dcb-411a-8979-d5b658e30290)

- Calculated loadings to determine which sensory features contribute most to PC1 and PC2.

- Used biplots to show how formulations and attributes align in PCA space.

### K-means Clustering:
![Elbow](https://github.com/user-attachments/assets/bd564aa1-5223-43a4-8d3a-bb1b86192737)

- Grouped individuals based on PCA scores to identify sensory preference patterns.

- Helped match formulations with target clusters for product strategy.

### Cluster Boxplots:
![Boxplot](https://github.com/user-attachments/assets/7eff9daa-66eb-45d0-872b-16912d0f4418)
![Final Table](https://github.com/user-attachments/assets/50c706c2-c60b-4ffb-8929-96171c8433e1)

- Used standardized sensory values to ensure fair comparisons.

- Boxplots reveal attribute strengths/weaknesses across clusters.

## Recommendations

- Use cluster analysis to select top-performing formulations when targeting specific sensory preferences (e.g., sweetness, creaminess)
  
- Formulation 1 from Cluster 4 is the best candidate for upscaling due to it having the highest average acceptability score.

- Conduct a large scale sensory evaluation (>100 panellists) to validate findings in real market settings.

## Limitations

- **Sample Size:** Based on 5 formulations and 21 participants; expanding the dataset would improve robustness.

- **PCA Subjectivity:** PCA interpretation relies on correlation-based assumptions and may vary.

- **Context Factors:** Real-world variables like pricing, type of packaging, and market demographics were not considered.

- **Panel Variability:** Results depend on the consistency of the untrained sensory panel even though participants shared similar demographic backgrounds.
