# Wrap-up: RTM, RAID Log, and UAT Checklist

## Requirements Traceability Matrix (RTM)

| Business Req | Functional Reqs | Gap Closed | UAT Tests |
| --- | --- | --- | --- |
| BR-01 Online return submission | FR-01 | GAP-01 | UAT-01 |
| BR-02 Mandatory return reason | FR-02, FR-03, FR-04 | GAP-02, GAP-03 | UAT-02, UAT-03, UAT-04 |
| BR-03 Unique refund reference | FR-05, FR-06 | GAP-04 | UAT-05, UAT-06 |
| BR-04 Return rate by category/region/reason | FR-07, FR-08 | GAP-06 | UAT-07, UAT-08 |
| BR-05 Historical record retention | FR-09 | GAP-08 | UAT-09 |
| BR-06 Warehouse pre-arrival notice | FR-10 | GAP-05 | UAT-10 |
| BR-07 Status flow without re-entry | FR-11 | GAP-07 | UAT-11 |

## RAID Log

| Type | Item | Response |
| --- | --- | --- |
| Risk | The reason dropdown turns into a catch-all "Other" and loses its analytical value. | Review "Other" entries regularly and refine the reason codes. |
| Assumption | The existing Orders/Returns structure is extended, and refund payments stay manual this phase. | Revisit if Finance wants payment automation. |
| Issue | The raw dataset has no reason, return date, or refund amount, so reason-level analysis can't come from current data. | Treat reason as a new field; flag it as a limitation in the SQL and dashboard. |
| Dependency | FR-10 (Warehouse notification) depends on the scope decision flagged in the BRD and a notification queue. | Confirm scope before FRD sign-off. |

## UAT Checklist

| ID | Scenario | Expected Result | Status |
| --- | --- | --- | --- |
| UAT-01 | Customer opens the return form and submits with a valid Order ID. | Request is accepted without Support involvement. | Not run |
| UAT-02 | Customer opens the reason dropdown. | All proposed reason codes are listed. | Not run |
| UAT-03 | Customer submits without selecting a reason. | Submission is blocked with an inline message. | Not run |
| UAT-04 | Customer enters an Order ID that doesn't exist. | Request is rejected with a clear error. | Not run |
| UAT-05 | Customer submits a valid return. | A unique refund reference (`RF-<OrderID>-<sequence>`) is generated. | Not run |
| UAT-06 | Customer completes a return. | Reference shows on screen and arrives in a confirmation email. | Not run |
| UAT-07 | Ops Manager opens the dashboard. | Returns appear by category, region, and reason. | Not run |
| UAT-08 | A new return is logged. | Return rate refreshes within one day. | Not run |
| UAT-09 | Any return record is opened. | Request date is present and the record is retained. | Not run |
| UAT-10 | A return is logged. | Warehouse queue receives Order ID, Product, and Reason. | Not run |
| UAT-11 | A return moves Submitted, Inspected, Refunded. | Status updates at each stage with no re-entry of Order ID or reason. | Not run |
