# Google Tag Manager tag lister

List any GTM tag.

## Usage

Use the shell script to download and examine any GTM tag.

Edit tag ID-s and the subdomain link in the sample sandbox HTML page.

Use the customized sandbox HTML page

- to load tags
- to watch loaded containers
- to watch tracking cookies
- to analyze cross-domain tracking

## Product prefixes

See [Analyze existing tag configurations](https://developers.google.com/tag-platform/devguides/existing#gtag)

## Google Analytics 4 configuration

See the [reference](https://developers.google.com/analytics/devguides/collection/ga4/reference/config)

## JavaScript for Google Tag Manager

```javascript
<!-- Google Tag Manager -->
<script>
(function (w, d, s, l, i) {
    w[l] = w[l] || [];
    w[l].push({
        'gtm.start': new Date().getTime(),
        'event': 'gtm.js'
    });
    var f = d.getElementsByTagName(s)[0],
        j = d.createElement(s),
        dl = l !== 'dataLayer' ? '&l=' + l : '';
    j.async = true;
    j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
    f.parentNode.insertBefore(j, f);
}(window, document, 'script', 'dataLayer', 'GTM-XXXXXXX'));
</script>
<!-- End Google Tag Manager -->
```
