# Devoteam Data Engineering Challenge  
### Google Cloud Platform — Baseball Analytics Pipeline

---

## 🚀 Overview

This project implements a complete **data engineering platform** on **Google Cloud Platform (GCP)** using the public dataset  
`bigquery-public-data.baseball`.

The goal is to design a **scalable, testable, production-ready analytics pipeline** that transforms raw baseball data into actionable insights available in **Looker Studio** dashboards.

The architecture follows a **medallion design**:

- **Raw Layer** – Ingested as-is from source  
- **Bronze Layer** – Light cleaning and normalization  
- **Silver Layer** – Business logic, joins, enriched datasets  
- **Gold Layer** – Final analytics tables for dashboards  

Additional features include:  
✔ Monitoring & alerting  
✔ Backup strategy  
✔ Real-time refresh (optional)  
✔ DEV/PROD environments  
✔ Scalable batch/incremental ingestion  

---

# 🏗 Architecture

## 🔹 1. GCP Services Used

| Layer / Feature | Service |
|----------------|---------|
| Storage layer | **BigQuery** |
| Scheduling | **BigQuery Scheduled Queries / Cloud Composer** |
| Backup | **Cloud Storage (GCS)** |
| Monitoring | **Cloud Monitoring + Log-based Alerts** |
| Dashboard | **Looker Studio** |
| IAM & Security | **GCP IAM** |

---

## 🧱 2. Medallion Architecture (Raw → Bronze → Silver → Gold)

### ### **RAW Layer**
Dataset: `baseball_raw`

Tables copied from the public dataset without modification:
- `games_wide_raw`
- `games_post_wide_raw`
- `schedules_raw`
- `schedules_copy_raw`

Purpose:
- Keep an unmodified backup of source data
- Support reprocessing from scratch
- Provide auditability

---

### 🔶 **BRONZE Layer**
Dataset: `baseball_bronze`

Tasks:
- Data type fixes (INTEGER, TIMESTAMP)  
- Remove obvious invalid rows  
- Standardize field naming conventions  
- Add `ingestion_timestamp`

Examples:
- `games_bronze`
- `games_post_bronze`
- `schedules_bronze`

---

### 🥈 **SILVER Layer**
Dataset: `baseball_silver`

Tasks:
- Transform "wide" tables into normalized models
- Clean players / teams data
- Generate fact tables (games, lineups)
- Generate dimension tables (teams, players)

Silver tables created:
- `dim_team`
- `dim_player`
- `fact_games`
- `fact_lineup_assignments`

Example transformations:
- Extract home/away teams  
- Flatten batting/fielding orders  
- Convert timestamps  
- Join schedules + games  

---

### 🥇 **GOLD Layer**
Dataset: `baseball_gold`

Final analytical tables feeding Looker Studio dashboards:

- `gold_game_summary`
- `gold_team_performance`
- `gold_batting_performance`
- `gold_fielding_zones`
- `gold_daily_games`

These tables enable:
- Team performance dashboards  
- Batting trends over time  
- Home vs away analysis  
- Attendance over time  
- Season-by-season analytics  

---

# 📈 Looker Studio Dashboard

A complete dashboard has been created to visualize:
- Number of games per year  
- Team win/loss ratio  
- Batting order influence  
- Attendance over time  
- Top performing teams  

The dashboard allows **filtering and exploration**:
- By year  
- By team  
- By home/away  
- By player  

---

# 🔄 Data Ingestion: Batch + Incremental

Two ingestion strategies are implemented:

## **Option A — Batch Refresh (simple)**
Using **Scheduled Queries**:
- Refresh Bronze → daily at 02:00
- Refresh Silver → daily at 02:15
- Refresh Gold → daily at 02:30

## **Option B — Incremental MERGE (scalable)**

```sql
MERGE INTO baseball_bronze.games_bronze t
USING baseball_raw.games_raw s
ON t.game_id = s.game_id
WHEN NOT MATCHED THEN
  INSERT ROW;
