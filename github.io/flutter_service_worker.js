'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c366341fa369cb9415a174a884997d56",
"index.html": "0356258c5516ce497032d74dfe7a7fd6",
"/": "0356258c5516ce497032d74dfe7a7fd6",
"main.dart.js": "8548569f39a4eb99d5ce17d1712bd253",
"pubspec.lock": "1cc376aab44722e45586d7a784927064",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "93eb07ec70c3a498be133b3c96a35477",
".dart_tool/package_config.json": "cc9962d6bd926a07667a83b6187cb3cd",
".dart_tool/package_config_subset": "c5f8df57bdcb7cabc11e50570821732c",
".dart_tool/version": "a2c943b0a156e86faaf4c12aa1f040ed",
"assets/AssetManifest.json": "41d918f8d79c2a436b3d166a8a2ef41a",
"assets/NOTICES": "f7e1410d1980d35fbdaf1e8ee8390abb",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "d90a769de40555d5fc445f39f6e79b30",
"assets/fonts/MaterialIcons-Regular.otf": "a814374ec5231fcbc7e28e9c3ca6559b",
"assets/assets/images/Clara_Heldenplatz/Sam.%2520Alter%2520Musikinstrumente%2520.jpg": "1ebfcf5bb44f22c2e14c25e5d0ff327b",
"assets/assets/images/Clara_Heldenplatz/Johannes_Brahms_portrait.jpg": "fa0ec5661d3c65174d0c9d6218e9cc55",
"assets/assets/images/Clara_Heldenplatz/Robert%2520Schumann.jpg": "d626666bbfaa5428c1a085c5a13595cb",
"assets/assets/images/Clara_Heldenplatz/clara%2520schumann%25202.jpg": "80b765140b5a229bb5c0bf61027886ff",
"assets/assets/images/Clara_Tuchlauben/TiuchlaubenGesderMusikfreunde.jpg": "71f92b8ec3c16976b6754414883f3de7",
"assets/assets/images/Clara_Tuchlauben/background_tuchlauben.png": "661c2c676cb9bf0eb50499f29b7a3329",
"assets/assets/images/Clara_Tuchlauben/Wieck-Torte.jpg": "a0e0235cc2d5a7afdd4889f0308d37ec",
"assets/assets/images/Clara_Tuchlauben/Altes_Musikvereinsgeb%25C3%25A4ude.jpg": "2dd77a88a9df283a26366b066a99776a",
"assets/assets/images/background_clara_hofburg.png": "8874a2edf3d2bdaa4bcba3ef6809519f",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/Alma_Mahler_1899a.jpg": "87002dab2576d6bcf7d934a5f1beb61e",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/Palais_Wittgenstein_Rote_Salon_1910.JPG": "137d36be8c6ddda99a350dc335f867fb",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/Palais_Wittgenstein_Musiksalon_1910.JPG": "738aea354893a4ce18a0019f90bf72d6",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/4_The_grand_staircase_in_the_Alleegasse.jpg": "f67d86e3b3b2516a44c2a3a444a43c96",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/1288432_default.jpg": "74070e97400d126e555c505842349e52",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/mf_clara_05_header.png": "b5fcfa40cb2efa8ce1f8b85f40581bde",
"assets/assets/images/Clara_Argentienierstra%25C3%259Fe/Clara_Schumann_1853.jpg": "0dc0ea261be3b2900ac6bdc500ef57b5",
"assets/assets/images/Waypoint_Clara_01.png": "dfe386d48378f410604ead2d86a015b7",
"assets/assets/images/mf_main_bg.png": "bba4923f9de36f5b815b3e0c1fd7a47c",
"assets/assets/images/mf_logo_B.png": "c7fa885d5d738c49b6cbbfe987a9c976",
"assets/assets/images/Clara_Graben/background_graben.png": "851e50803c02d7ce14b9c8379610727b",
"assets/assets/images/Clara_Graben/Franz_Joseph_1865.jpg": "396090ff07d4a1aa9b9f746e44a7b73a",
"assets/assets/images/Clara_Graben/kaiserhymne.jpg": "50ab746adf2c0593a5243ff7d4c63495",
"assets/assets/images/Clara_Graben/Clara_Schumann_Franz_Luckhardt.png": "9cb1be16839f9bc22b8417715eadc44f",
"assets/assets/images/Clara_Musikvereinplatz/Brahms_4c%25201.jpg": "09b5db84a8d7a45b028133c5697ae888",
"assets/assets/images/Clara_Musikvereinplatz/musikverein_alt.png": "ecb2132ad74710d3d7bd50832b8d5328",
"assets/assets/images/Clara_Musikvereinplatz/mf_clara_06_footer.png": "6f6ad82ee8875ccbce0a0bec1a889746",
"assets/assets/images/Clara_Musikvereinplatz/Brahms%2520Saal%25201.jpg": "51ea66f91403f2a09ac31c35b2bede97",
"assets/assets/images/mf_logo.png": "bb7db17dafd4c89b00cc9c6683304d34",
"assets/assets/images/Stadt-Wien_Logo_pos_rgb.gif": "4e24098adef771e64fcdccc906582f4f",
"assets/assets/images/Clara_Bauernmarkt/Joseph%2520von%2520Eichendorff%2520%2520Foto%2520H.-P.Haack.jpg": "4cc2d3fd61f1ac076cda2dfddea57f92",
"assets/assets/images/Clara_Bauernmarkt/background_Bauernmarkt.png": "8e2d64334ed7162ee5e036515e9cdfcf",
"assets/assets/images/Clara_Bauernmarkt/Robert%2520Schumann.jpg": "d626666bbfaa5428c1a085c5a13595cb",
"assets/assets/images/Clara_Bauernmarkt/clarajung.jpeg": "0c68111413b6eedcfc0dd0344742219a",
"assets/assets/images/Clara_Bauernmarkt/Grillparzer.jpg": "bb5bc3a0aff04f836207a3acf17d6d72",
"assets/assets/images/Clara_Bauernmarkt/Grundhof_1940.jpg": "a8eed151107a7904af78bdc6e9c7d317",
"assets/assets/audio/Clara/Bauernmarkt%25204.mp3": "cb16e563e4792fc08537e7129e23b5cf",
"assets/assets/audio/Clara/Heldenplatz.mp3": "c6f2e58a2a979c3decaf508f90a4ede4",
"assets/assets/audio/Clara/Argentinierstra%25C3%259Fe16.mp3": "d582af3ffb6b876838a2aef704e06b44",
"assets/assets/audio/Clara/Graben%252019.mp3": "cea03a44525e9242bc7254a0c941458e",
"assets/assets/audio/Clara/Clara%2520Schumann%2520Souvenir%2520de%2520Vienne.mp3": "c65f8659709529c3396075b627f47934",
"assets/assets/audio/Clara/Musikvereinsplatz%25201.mp3": "b0e054bd5023366b885c60d30139b92c",
"assets/assets/audio/Clara/Tuchlauben%252012.mp3": "c9ff491afcb2e38b39cd31f84f7038ca",
"assets/assets/audio/baker/baker_bristol.mp3": "83f2e3b3185d6bac4872b5635c3dbfa6",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
