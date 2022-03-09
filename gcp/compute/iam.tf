resource "google_service_account" "sentiment_analysis_account" {
    account_id   = "sentiment-analysis-account"
    display_name = "Sentiment Analysis Service Account"
}

resource "google_storage_bucket_iam_binding" "binding" {
    bucket  = "sentiment-analysis-240222"
    role    = "roles/storage.objectAdmin"
    members = [
        "serviceAccount:${google_service_account.sentiment_analysis_account.email}"
    ]
}
