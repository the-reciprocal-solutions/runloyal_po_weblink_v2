# PowerShell deployment script for Flutter web app

$BASE_HREF = "/runloyal_po_weblink_v2/"
$GITHUB_USER = "the-reciprocal-solutions"
$GITHUB_REPO = "https://github.com/$GITHUB_USER/runloyal_po_weblink_v2"

Write-Host "Clean existing repository"
flutter clean

Write-Host "Getting packages..."
flutter pub get

Write-Host "Generating the web folder..."
flutter create . --platform web

Write-Host "Building for web..."
flutter build web --base-href $BASE_HREF --release --web-renderer canvaskit --dart-define=Dart2jsOptimization=O4

Write-Host "Deploying to git repository"
Set-Location build/web

# Remove any existing git repository
if (Test-Path ".git") {
    Remove-Item -Recurse -Force .git
}

# Initialize new repository
git init
git add .
git commit -m "Initial deployment with performance optimizations"
git branch -M main

# Force push to GitHub Pages branch
git remote add origin $GITHUB_REPO
git push -f origin main:gh-pages

Set-Location ../..

Write-Host "✅ Finished deploy: $GITHUB_REPO"
Write-Host "🚀 Flutter web URL: https://$GITHUB_USER.github.io/runloyal_po_weblink_v2/" 