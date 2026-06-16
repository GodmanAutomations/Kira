# Performance Review Gate

Use this gate after repeated actions have produced a record: trades, campaigns,
sales calls, launches, outreach, experiments, or operational attempts.

## Gate

1. Name the system, date range, and number of entries reviewed.
2. Define the entry schema:
   - date
   - setup/type/channel
   - planned action
   - actual action
   - outcome
   - notes
3. Segment performance by the meaningful categories.
4. Compare plan vs actual:
   - planned reward/cost/effort
   - actual reward/cost/effort
   - execution gap
5. Review streaks and drawdowns:
   - longest losing streak
   - current streak
   - recovery time
   - recent-window trend
6. Classify the drawdown:
   - noise: within expected variance
   - execution gap: operator drift
   - structural flaw: isolated setup/channel/type failure
   - thesis-breaker: system-wide edge decay
7. Decide continue, reduce, quarantine, stop, or collect more data.
8. Trigger circuit breaker if the record shows compulsion, critical edge decay,
   or repeated boundary breaks.

## Red Flags

- changing the system after a tiny sample
- ignoring planned vs actual execution gap
- treating a streak as proof without baseline probability
- broad shutdown when only one segment is failing
- continuing when system-wide decay is visible
- journal entries too vague to audit

## Athena Boundary

Generated performance reviews live under `performance-reviews/` and are ignored
by Git. This gate reviews records and recommends next actions; it does not
place trades, spend money, contact prospects, publish campaigns, or take
live-world action unless Stephen explicitly asks for that action.
