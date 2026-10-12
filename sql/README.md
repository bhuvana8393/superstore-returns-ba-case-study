# SQL

Queries are written for SQLite against two tables, `orders` and `returns`, loaded from the Superstore workbook with spaces and hyphens in column names replaced by underscores (for example `Product_Sub_Category`).

| File | Purpose |
| --- | --- |
| `01_baseline_return_rate.sql` | Overall return rate |
| `02_return_rate_by_category.sql` | Return rate by product category |
| `03_return_rate_by_region.sql` | Return rate by region |
| `04_top_subcategories.sql` | Five highest-return sub-categories |
| `05_returned_order_value.sql` | Sales and profit on returned orders |
| `06_return_rate_by_year.sql` | Yearly trend |
| `07_data_quality_checks.sql` | Orphan-return check |

Return rate is always measured per unique Order ID, because one order can have several line items.
