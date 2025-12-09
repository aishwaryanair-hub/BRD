# Quick Fix: Browser Cache Not Updating

## Immediate Solutions (Try in Order)

### 1. Hard Refresh
- **Windows/Linux**: `Ctrl + F5` or `Ctrl + Shift + R`
- **Mac**: `Cmd + Shift + R`
- **Mobile**: Close and reopen browser app

### 2. Clear Site Data
1. Open DevTools (`F12`)
2. Right-click refresh button
3. Select "Empty Cache and Hard Reload"

### 3. Disable Cache in DevTools
1. Open DevTools (`F12`)
2. Go to **Network** tab
3. Check **"Disable cache"** checkbox
4. Keep DevTools open

### 4. Test in Incognito/Private Mode
- **Chrome/Edge**: `Ctrl + Shift + N` (Windows) or `Cmd + Shift + N` (Mac)
- **Firefox**: `Ctrl + Shift + P` (Windows) or `Cmd + Shift + P` (Mac)
- **Safari**: `Cmd + Shift + N`

### 5. Clear Application Storage
1. Open DevTools (`F12`)
2. Go to **Application** tab
3. Click **"Clear storage"** → **"Clear site data"**

---

## If Still Not Working

### Check Network Tab
1. Open DevTools (`F12`)
2. Go to **Network** tab
3. Reload page
4. Look for:
   - Status `200 (from cache)` = Browser cache
   - Status `304` = Server says not modified
   - Check response headers for `Cache-Control`

### Server-Side Issues
- Check if CDN needs purging (Cloudflare, CloudFront, etc.)
- Verify server cache headers
- Check reverse proxy cache (Varnish, Nginx cache, etc.)

### Application Cache
- Clear Service Worker: Application tab → Service Workers → Unregister
- Clear Cache Storage: Application tab → Cache Storage → Delete all
- Clear IndexedDB: Application tab → IndexedDB → Delete database

---

## Quick Test

Open browser console and run:
```javascript
// Test if page is cached
fetch(window.location.href, {cache: 'no-store'})
  .then(r => r.text())
  .then(html => console.log('Fresh content loaded:', html.length, 'bytes'));
```

---

## Common Causes

1. **Browser Cache** → Hard refresh or clear cache
2. **Service Worker** → Unregister in Application tab
3. **CDN Cache** → Purge CDN cache
4. **Server Headers** → Check Cache-Control headers
5. **Application Cache** → Clear localStorage/IndexedDB

---

**See `browser-cache-troubleshooting.md` for detailed solutions.**
