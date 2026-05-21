{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bandit = buildMix rec {
      name = "bandit";
      version = "1.11.1";

      src = fetchHex {
        pkg = "bandit";
        version = "${version}";
        sha256 = "d4401016df9abbc6dcd325c0b78b2b193e7c7c96bb68f31e576112be025d84a5";
      };

      beamDeps = [ hpax plug telemetry thousand_island websock ];
    };

    castore = buildMix rec {
      name = "castore";
      version = "1.0.14";

      src = fetchHex {
        pkg = "castore";
        version = "${version}";
        sha256 = "7bc1b65249d31701393edaaac18ec8398d8974d52c647b7904d01b964137b9f4";
      };

      beamDeps = [];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.15.0";

      src = fetchHex {
        pkg = "certifi";
        version = "${version}";
        sha256 = "b147ed22ce71d72eafdad94f055165c1c182f61a2ff49df28bcc71d1d5b94a60";
      };

      beamDeps = [];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.10.1";

      src = fetchHex {
        pkg = "db_connection";
        version = "${version}";
        sha256 = "18ed94c6e627b4bf452dbd4df61b69a35a1e768525140bc1917b7a685026a6a3";
      };

      beamDeps = [ telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "3.1.0";

      src = fetchHex {
        pkg = "decimal";
        version = "${version}";
        sha256 = "e8b3efb3bb3a13cb5e4268ffe128569067b1972e9dee013537c71a5b073168f9";
      };

      beamDeps = [];
    };

    dns_cluster = buildMix rec {
      name = "dns_cluster";
      version = "0.2.0";

      src = fetchHex {
        pkg = "dns_cluster";
        version = "${version}";
        sha256 = "ba6f1893411c69c01b9e8e8f772062535a4cf70f3f35bcc964a324078d8c8240";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.14.0";

      src = fetchHex {
        pkg = "ecto";
        version = "${version}";
        sha256 = "130d69ffb4285f9ce4792b65dfbb994fd13ea4cbc3cbea2524b199aa3de84af3";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.14.0";

      src = fetchHex {
        pkg = "ecto_sql";
        version = "${version}";
        sha256 = "f4d8d36faf294c9417b5a37ec7ac8217ee2abdef5fcf197ba690f361548d3949";
      };

      beamDeps = [ db_connection decimal ecto postgrex telemetry ];
    };

    esbuild = buildMix rec {
      name = "esbuild";
      version = "0.10.0";

      src = fetchHex {
        pkg = "esbuild";
        version = "${version}";
        sha256 = "468489cda427b974a7cc9f03ace55368a83e1a7be12fba7e30969af78e5f8c70";
      };

      beamDeps = [ jason ];
    };

    expo = buildMix rec {
      name = "expo";
      version = "1.1.1";

      src = fetchHex {
        pkg = "expo";
        version = "${version}";
        sha256 = "5fb308b9cb359ae200b7e23d37c76978673aa1b06e2b3075d814ce12c5811640";
      };

      beamDeps = [];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "1.1.1";

      src = fetchHex {
        pkg = "file_system";
        version = "${version}";
        sha256 = "7a15ff97dfe526aeefb090a7a9d3d03aa907e100e262a0f8f7746b78f8f87a5d";
      };

      beamDeps = [];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.22.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "b94e83c47780fc6813f746a1f1a34ee65cda42da4c5ea26a68f0acc4498e23dc";
      };

      beamDeps = [ mime mint nimble_options nimble_pool telemetry ];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.38.3";

      src = fetchHex {
        pkg = "floki";
        version = "${version}";
        sha256 = "025aa1f5f24a70cb31bfbc7011419228596f3b062d7feda617238ba4926f83cb";
      };

      beamDeps = [];
    };

    gen_nntp = buildMix rec {
      name = "gen_nntp";
      version = "0.19.0";

      src = fetchHex {
        pkg = "gen_nntp";
        version = "${version}";
        sha256 = "497e3fe521587b00d00a00f5b85b0d454ef18be35618b9becbf4a35f45fe1bf4";
      };

      beamDeps = [ ranch ];
    };

    gen_smtp = buildRebar3 rec {
      name = "gen_smtp";
      version = "0.15.0";

      src = fetchHex {
        pkg = "gen_smtp";
        version = "${version}";
        sha256 = "29bd14a88030980849c7ed2447b8db6d6c9278a28b11a44cafe41b791205440f";
      };

      beamDeps = [];
    };

    gettext = buildMix rec {
      name = "gettext";
      version = "1.0.2";

      src = fetchHex {
        pkg = "gettext";
        version = "${version}";
        sha256 = "eab805501886802071ad290714515c8c4a17196ea76e5afc9d06ca85fb1bfeb3";
      };

      beamDeps = [ expo ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.25.0";

      src = fetchHex {
        pkg = "hackney";
        version = "${version}";
        sha256 = "7209bfd75fd1f42467211ff8f59ea74d6f2a9e81cbcee95a56711ee79fd6b1d4";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "1.0.3";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "8eab6e1cfa8d5918c2ce4ba43588e894af35dbd8e91e6e55c817bca5847df34a";
      };

      beamDeps = [];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "2.2.3";

      src = fetchHex {
        pkg = "httpoison";
        version = "${version}";
        sha256 = "fa0f2e3646d3762fdc73edb532104c8619c7636a6997d20af4003da6cfc53e53";
      };

      beamDeps = [ hackney ];
    };

    idna = buildRebar3 rec {
      name = "idna";
      version = "6.1.1";

      src = fetchHex {
        pkg = "idna";
        version = "${version}";
        sha256 = "92376eb7894412ed19ac475e4a86f7b413c1b9fbb5bd16dccd57934157944cea";
      };

      beamDeps = [ unicode_util_compat ];
    };

    jason = buildMix rec {
      name = "jason";
      version = "1.4.5";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "b0c823996102bcd0239b3c2444eb00409b72f6a140c1950bc8b457d836b30684";
      };

      beamDeps = [ decimal ];
    };

    metrics = buildRebar3 rec {
      name = "metrics";
      version = "1.0.1";

      src = fetchHex {
        pkg = "metrics";
        version = "${version}";
        sha256 = "69b09adddc4f74a40716ae54d140f93beb0fb8978d8636eaded0c31b6f099f16";
      };

      beamDeps = [];
    };

    mime = buildMix rec {
      name = "mime";
      version = "2.0.7";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "6171188e399ee16023ffc5b76ce445eb6d9672e2e241d2df6050f3c771e80ccd";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.5.0";

      src = fetchHex {
        pkg = "mimerl";
        version = "${version}";
        sha256 = "db648ce065bae14ea84ca8b5dd123f42f49417cef693541110bf6f9e9be9ecc4";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.8.0";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "f3c572c11355eccf00f22275e9b42463bc17bd28db13be1e28f8e0bb4adbc849";
      };

      beamDeps = [ castore hpax ];
    };

    nimble_options = buildMix rec {
      name = "nimble_options";
      version = "1.1.1";

      src = fetchHex {
        pkg = "nimble_options";
        version = "${version}";
        sha256 = "821b2470ca9442c4b6984882fe9bb0389371b8ddec4d45a9504f00a66f650b44";
      };

      beamDeps = [];
    };

    nimble_pool = buildMix rec {
      name = "nimble_pool";
      version = "1.1.0";

      src = fetchHex {
        pkg = "nimble_pool";
        version = "${version}";
        sha256 = "af2e4e6b34197db81f7aad230c1118eac993acc0dae6bc83bac0126d4ae0813a";
      };

      beamDeps = [];
    };

    parse_trans = buildRebar3 rec {
      name = "parse_trans";
      version = "3.4.1";

      src = fetchHex {
        pkg = "parse_trans";
        version = "${version}";
        sha256 = "620a406ce75dada827b82e453c19cf06776be266f5a67cff34e1ef2cbb60e49a";
      };

      beamDeps = [];
    };

    phoenix = buildMix rec {
      name = "phoenix";
      version = "1.8.7";

      src = fetchHex {
        pkg = "phoenix";
        version = "${version}";
        sha256 = "47352f72d6ab31009ef77516b1b3a14745be97b54061fd458031b9d8294869d5";
      };

      beamDeps = [ bandit jason phoenix_pubsub phoenix_template plug plug_crypto telemetry websock_adapter ];
    };

    phoenix_ecto = buildMix rec {
      name = "phoenix_ecto";
      version = "4.6.2";

      src = fetchHex {
        pkg = "phoenix_ecto";
        version = "${version}";
        sha256 = "3f94d025f59de86be00f5f8c5dd7b5965a3298458d21ab1c328488be3b5fcd59";
      };

      beamDeps = [ ecto phoenix_html plug postgrex ];
    };

    phoenix_html = buildMix rec {
      name = "phoenix_html";
      version = "4.3.0";

      src = fetchHex {
        pkg = "phoenix_html";
        version = "${version}";
        sha256 = "3eaa290a78bab0f075f791a46a981bbe769d94bc776869f4f3063a14f30497ad";
      };

      beamDeps = [];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.8.7";

      src = fetchHex {
        pkg = "phoenix_live_dashboard";
        version = "${version}";
        sha256 = "3a8625cab39ec261d48a13b7468dc619c0ede099601b084e343968309bd4d7d7";
      };

      beamDeps = [ ecto mime phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.6.2";

      src = fetchHex {
        pkg = "phoenix_live_reload";
        version = "${version}";
        sha256 = "d1f89c18114c50d394721365ffb428cce24f1c13de0467ffa773e2ff4a30d5b9";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "1.1.30";

      src = fetchHex {
        pkg = "phoenix_live_view";
        version = "${version}";
        sha256 = "a353c51ac1e3190910f01a6100c7d5cc02c5e22e7374fd817bd3aedd21149039";
      };

      beamDeps = [ jason phoenix phoenix_html phoenix_template plug telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.2.0";

      src = fetchHex {
        pkg = "phoenix_pubsub";
        version = "${version}";
        sha256 = "adc313a5bf7136039f63cfd9668fde73bba0765e0614cba80c06ac9460ff3e96";
      };

      beamDeps = [];
    };

    phoenix_template = buildMix rec {
      name = "phoenix_template";
      version = "1.0.4";

      src = fetchHex {
        pkg = "phoenix_template";
        version = "${version}";
        sha256 = "2c0c81f0e5c6753faf5cca2f229c9709919aba34fab866d3bc05060c9c444206";
      };

      beamDeps = [ phoenix_html ];
    };

    pique = buildMix rec {
      name = "pique";
      version = "0.1.0";

      src = fetchHex {
        pkg = "pique";
        version = "${version}";
        sha256 = "b9ea75869b37dcf98cedd8588d595aa118e03e3859185d9d9b599b8fd91b6d2c";
      };

      beamDeps = [ gen_smtp ];
    };

    plug = buildMix rec {
      name = "plug";
      version = "1.19.1";

      src = fetchHex {
        pkg = "plug";
        version = "${version}";
        sha256 = "560a0017a8f6d5d30146916862aaf9300b7280063651dd7e532b8be168511e62";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "2.1.1";

      src = fetchHex {
        pkg = "plug_crypto";
        version = "${version}";
        sha256 = "6470bce6ffe41c8bd497612ffde1a7e4af67f36a15eea5f921af71cf3e11247c";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.22.2";

      src = fetchHex {
        pkg = "postgrex";
        version = "${version}";
        sha256 = "8946382ddb06294f56026ac4278b3cc212bac8a2c82ed68b4087819ed1abc53b";
      };

      beamDeps = [ db_connection decimal jason ];
    };

    ranch = buildRebar3 rec {
      name = "ranch";
      version = "1.7.1";

      src = fetchHex {
        pkg = "ranch";
        version = "${version}";
        sha256 = "451d8527787df716d99dc36162fca05934915db0b6141bbdac2ea8d3c7afc7d7";
      };

      beamDeps = [];
    };

    ssl_verify_fun = buildRebar3 rec {
      name = "ssl_verify_fun";
      version = "1.1.7";

      src = fetchHex {
        pkg = "ssl_verify_fun";
        version = "${version}";
        sha256 = "fe4c190e8f37401d30167c8c405eda19469f34577987c76dde613e838bbc67f8";
      };

      beamDeps = [];
    };

    swoosh = buildMix rec {
      name = "swoosh";
      version = "1.25.2";

      src = fetchHex {
        pkg = "swoosh";
        version = "${version}";
        sha256 = "0aecf65b2845f13f4d440e0945715432bbde2d815e2302adf7df549cd9bdafed";
      };

      beamDeps = [ bandit finch gen_smtp hackney idna jason mime plug telemetry ];
    };

    tailwind = buildMix rec {
      name = "tailwind";
      version = "0.4.1";

      src = fetchHex {
        pkg = "tailwind";
        version = "${version}";
        sha256 = "6249d4f9819052911120dbdbe9e532e6bd64ea23476056adb7f730aa25c220d1";
      };

      beamDeps = [];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.4.2";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "928f6495066506077862c0d1646609eed891a4326bee3126ba54b60af61febb1";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "1.1.0";

      src = fetchHex {
        pkg = "telemetry_metrics";
        version = "${version}";
        sha256 = "e7b79e8ddfde70adb6db8a6623d1778ec66401f366e9a8f5dd0955c56bc8ce67";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.3.0";

      src = fetchHex {
        pkg = "telemetry_poller";
        version = "${version}";
        sha256 = "51f18bed7128544a50f75897db9974436ea9bfba560420b646af27a9a9b35211";
      };

      beamDeps = [ telemetry ];
    };

    tentacat = buildMix rec {
      name = "tentacat";
      version = "2.5.0";

      src = fetchHex {
        pkg = "tentacat";
        version = "${version}";
        sha256 = "c7d3d34a56d5dc870c2155444f7d6cd0e6959dd65c16bb9174442e347f34334f";
      };

      beamDeps = [ httpoison jason ];
    };

    thousand_island = buildMix rec {
      name = "thousand_island";
      version = "1.4.3";

      src = fetchHex {
        pkg = "thousand_island";
        version = "${version}";
        sha256 = "6e4ce09b0fd761a58594d02814d40f77daff460c48a7354a15ab353bb998ea0b";
      };

      beamDeps = [ telemetry ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.1";

      src = fetchHex {
        pkg = "unicode_util_compat";
        version = "${version}";
        sha256 = "b3a917854ce3ae233619744ad1e0102e05673136776fb2fa76234f3e03b23642";
      };

      beamDeps = [];
    };

    websock = buildMix rec {
      name = "websock";
      version = "0.5.3";

      src = fetchHex {
        pkg = "websock";
        version = "${version}";
        sha256 = "6105453d7fac22c712ad66fab1d45abdf049868f253cf719b625151460b8b453";
      };

      beamDeps = [];
    };

    websock_adapter = buildMix rec {
      name = "websock_adapter";
      version = "0.5.9";

      src = fetchHex {
        pkg = "websock_adapter";
        version = "${version}";
        sha256 = "5534d5c9adad3c18a0f58a9371220d75a803bf0b9a3d87e6fe072faaeed76a08";
      };

      beamDeps = [ bandit plug websock ];
    };

    yugo = buildMix rec {
      name = "yugo";
      version = "1.0.4";

      src = fetchHex {
        pkg = "yugo";
        version = "${version}";
        sha256 = "5906e0b1f955f7cbe0f90149d46fd419805e9fc97a8378574a9f4cadd7f19cd5";
      };

      beamDeps = [];
    };
  };
in self

