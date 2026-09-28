# MACBOOK — START HERE

This package is prepared so you do **not** need to rebuild the project structure manually.

## Step 1 — local test
Double-click:

`1_SETUP_AND_TEST_MAC.command`

macOS may block it the first time. If so:
- right-click the file
- choose **Open**
- confirm **Open**

The script installs dependencies and runs the real production build.

You want to see:

`BUILD PASSED`

Do not upload to Vercel until the local build passes.

## Step 2 — Supabase
1. Create/open a Supabase project.
2. Open **SQL Editor**.
3. Paste the full contents of `schema.sql`.
4. Run it.
5. Save these values for Vercel:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `SUPABASE_SERVICE_ROLE_KEY`

Never place the real service role key in GitHub.

## Step 3 — GitHub
Double-click:

`2_UPLOAD_TO_GITHUB_MAC.command`

Paste your GitHub repo URL when asked.

This uploads the project with the correct folder structure:

```
pages/
  index.tsx
  api/
    index.ts
    telegram.ts
```

## Step 4 — Vercel
Import the GitHub repository.

Framework should be detected as **Next.js**.

Root Directory:
- leave it blank / repository root.

Add all required Environment Variables from `.env.example`.

Deploy.

## Step 5 — Google Sheets
Create one spreadsheet with tabs exactly:
- `Sales`
- `Expenses`

Enable Google Sheets API in Google Cloud.
Create a service account.
Share the spreadsheet with the service-account email as **Editor**.

Add to Vercel:
- `GOOGLE_SERVICE_ACCOUNT_EMAIL`
- `GOOGLE_PRIVATE_KEY`
- `GOOGLE_SHEETS_ID`

Also add:
- `NEXT_PUBLIC_GOOGLE_SHEET_URL`

Give the instructor Viewer access.

## Step 6 — Telegram
Create the bot using BotFather.

Add to Vercel:
- `TELEGRAM_BOT_TOKEN`
- `TELEGRAM_WEBHOOK_SECRET`
- `NEXT_PUBLIC_TELEGRAM_BOT_URL`

After Vercel is live, set the webhook:

`https://api.telegram.org/bot<BOT_TOKEN>/setWebhook?url=https://<YOUR-VERCEL-DOMAIN>/api/telegram&secret_token=<YOUR_SECRET>`

## Step 7 — required course tests
Follow the exact Test 1 / Test 2 data in `README.md`.

Final expected cumulative Test 2 results:
- Project A: €2,050
- Project B: €2,180
- Company: €3,930
- Richard commission: €140
- Anastasia commission: €175
- Jean-Claude commission: €215
- S05 remains pending
- E07 remains awaiting allocation

## Step 8 — final safety check
Run:

`3_VERIFY_BEFORE_SUBMISSION.command`

Then check `AGENT_AUDIT_CHECKLIST.md`.

## Final submission
Submit the working Vercel URL only after:
- website works;
- S01 and E01 really went through Telegram;
- Sheets updates automatically;
- manager approvals work;
- Telegram decision notifications work;
- Test 1 and Test 2 totals match;
- GitHub contains no secrets.
