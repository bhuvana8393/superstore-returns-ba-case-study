# Power BI Dashboard

**Status:** build guide ready; the `.pbix` file is still to be built and will be added to this folder as `superstore_returns.pbix`.

The dashboard is built around the KPIs defined in the BRD (BR-04): return rate by category and region, plus returned value and trend.

## 1. Load the data

1. In Power BI Desktop, choose **Get data > Excel workbook** and select the Superstore workbook.
2. Load the **Orders** and **Returns** sheets (Users is not needed).
3. In Power Query, confirm `Order Date` is typed as Date and `Sales` and `Profit` as Decimal.
4. Optional: the CSVs in [summary_data/](summary_data/) are the SQL query results and can be used to cross-check your visuals.

## 2. Model

Create a relationship from **Orders[Order ID]** (many) to **Returns[Order ID]** (one), single direction. Every returned Order ID exists in Orders, and Returns has one row per returned order.

## 3. Calculated column and measures

Add this calculated column to the Orders table:

```DAX
Is Returned = IF ( ISBLANK ( RELATED ( Returns[Order ID] ) ), 0, 1 )
```

Add a column for the year (or use the date hierarchy):

```DAX
Order Year = YEAR ( Orders[Order Date] )
```

Add these measures:

```DAX
Total Orders = DISTINCTCOUNT ( Orders[Order ID] )

Returned Orders =
CALCULATE ( DISTINCTCOUNT ( Orders[Order ID] ), Orders[Is Returned] = 1 )

Return Rate % = DIVIDE ( [Returned Orders], [Total Orders] )

Total Sales = SUM ( Orders[Sales] )

Returned Sales =
CALCULATE ( SUM ( Orders[Sales] ), Orders[Is Returned] = 1 )

Returned Sales % = DIVIDE ( [Returned Sales], [Total Sales] )
```

Format `Return Rate %` and `Returned Sales %` as percentages with two decimals.

## 4. Page layout

| Area | Visual | Fields |
| --- | --- | --- |
| Top row | Four KPI cards | Total Orders, Returned Orders, Return Rate %, Returned Sales |
| Left | Clustered bar chart | Axis: Product Category; Values: Return Rate % |
| Centre | Clustered bar chart | Axis: Region; Values: Return Rate % |
| Right | Bar chart, top 5 filter | Axis: Product Sub-Category; Values: Return Rate %; filter to 100+ orders |
| Bottom | Line chart | Axis: Order Year; Values: Return Rate % |
| Side | Slicers | Region, Product Category, Order Year |

Add a text box noting that a return-reason breakdown will be added once the new reason field (BR-02) is populated, since the current data has no reason.

## 5. Check your numbers

With no slicers applied, the dashboard should show:

| Measure | Expected value |
| --- | --- |
| Total Orders | 5,496 |
| Returned Orders | 572 |
| Return Rate % | 10.41% |
| Highest region | West, 11.33% |
| Highest category | Furniture, 10.83% |
| Highest sub-category | Bookcases, 14.36% |

If a category or region count looks higher than the total, that is expected: one order can include products from several categories and regions.

## 6. Save and screenshot

Save the file as `superstore_returns.pbix` in this folder and export a screenshot of the main page as `dashboard_overview.png`, then reference it from the main README.
