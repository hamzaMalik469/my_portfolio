'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1ce0273949436e9ffafad0026d03b805",
"assets/AssetManifest.bin.json": "6b95af0cc7cebd2397f3f9e1d6fc5d36",
"assets/AssetManifest.json": "7acec97075bd60e47fca8a09a02c8cf6",
"assets/assets/icons/Android%2520OS.png": "a75dde5049d92cd8454766f62da04a91",
"assets/assets/icons/bullet.png": "63d7ccd08a07b40b0047ad350b5c9823",
"assets/assets/icons/Desktop.png": "e362aca2fb8335ee689beb0853632883",
"assets/assets/icons/GitHub.png": "d43f10dc9a2ee1b21d7fd3a62500d5c3",
"assets/assets/icons/IOS.png": "dc32b4ce8704cb42e07310a525b17aaa",
"assets/assets/icons/linkedIn.png": "e835e8f627fddaca4146e3b95a017ba5",
"assets/assets/icons/Linux.png": "ca04eb09ad2c0a1b554e19ae366629d2",
"assets/assets/icons/Mobile.png": "3df33807b5d4c93c6cbe17259310fa3f",
"assets/assets/icons/web.png": "bf7ebecdc9d2c1aca40a052a8b3a8bde",
"assets/assets/icons/website.png": "3019d8fefc963bc2b7d036272e6191b3",
"assets/assets/icons/WhatsApp.png": "25b75728d3cd84827090d1dbcaba6646",
"assets/assets/icons/Window.png": "7d392d58f4f31ac0142be5f88e62ae1b",
"assets/assets/images/hamza.jpg": "02ae7dd7e96e397ed4e04db96ba4be07",
"assets/assets/images/home_service1.jpg": "76da788c6e6e73b68dca76791002815f",
"assets/assets/images/home_service10.jpg": "5654f542182a6368c1f852bbeaceb5c0",
"assets/assets/images/home_service11.jpg": "03a25dd50afc3b2256009c2e22a18c9d",
"assets/assets/images/home_service12.jpg": "a485416708c381d770d273b9ce153a10",
"assets/assets/images/home_service13.jpg": "786f3a5af728dbc54d371baefc50473e",
"assets/assets/images/home_service14.jpg": "9aeb573a07e168fb64bb0ad87e7d81e5",
"assets/assets/images/home_service15.jpg": "05fb9e30472ee63b30e15fc4391cec25",
"assets/assets/images/home_service2.jpg": "865710e5a56ed25012618af996290d0a",
"assets/assets/images/home_service3.jpg": "d60056fb097fb940ab6f5bdbe6dc3bb7",
"assets/assets/images/home_service4.jpg": "454592fbfc2e1fc88264f1adbb7a5585",
"assets/assets/images/home_service5.jpg": "742aaa1dab7221067504b61ea8aa9f32",
"assets/assets/images/home_service6.jpg": "2d3b1b0a21501505ec7370908176f9d4",
"assets/assets/images/home_service7.jpg": "27e6272808dc7554d8de846f49f9ed9b",
"assets/assets/images/home_service8.jpg": "27e50596727fba1c32f89d20bb13d36c",
"assets/assets/images/home_service9.jpg": "15dab4a404a0e92268c748de0d424d5d",
"assets/assets/images/iub1.jpg": "fa2bcc2e6f1cd204bf2852f9b46e4285",
"assets/assets/images/iub2.jpg": "cbe7b48b8144195697cce3f2d71a8ab7",
"assets/assets/images/iub3.jpg": "3f90363927793b265a305ff9c9f8da94",
"assets/assets/images/iub4.jpg": "115b235d52c9f452a19a1ea90d523c7c",
"assets/assets/images/meter1.jpg": "a64aba38acf0839117eede9e1dfb526f",
"assets/assets/images/meter2.jpg": "e4fe44db1befa855f2d76a1530e967b8",
"assets/assets/images/meter3.jpg": "c9c06fa4913cc71090023dc7e87f114c",
"assets/assets/images/meter4.jpg": "7395ba4b6e56df2728b96be05cd0ad6f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "2556e444abdd9f10b5e85cf167ec6c79",
"assets/NOTICES": "132ead9727b76b7b32dbd6321b4e83b1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "59e7e380f79d8dee8fc56897f378b6c3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "bf1e45747974a42ebcf850f57cc46223",
"/": "bf1e45747974a42ebcf850f57cc46223",
"main.dart.js": "fa75040f7e4240743fce2cca27ce655c",
"manifest.json": "23f17e328274912ed6178c544fca91d1",
"resume.pdf": "7069515117964cec8dcabc68753cd4b2",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
