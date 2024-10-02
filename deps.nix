{ lib, beamPackages, overrides ? (x: y: {}) }:

let
  buildRebar3 = lib.makeOverridable beamPackages.buildRebar3;
  buildMix = lib.makeOverridable beamPackages.buildMix;
  buildErlangMk = lib.makeOverridable beamPackages.buildErlangMk;

  self = packages // (overrides self packages);

  packages = with beamPackages; with self; {
    bandit = buildMix rec {
      name = "bandit";
      version = "1.5.7";

      src = fetchHex {
        pkg = "bandit";
        version = "${version}";
        sha256 = "f2dd92ae87d2cbea2fa9aa1652db157b6cba6c405cb44d4f6dd87abba41371cd";
      };

      beamDeps = [ hpax plug telemetry thousand_island websock ];
    };

    castore = buildMix rec {
      name = "castore";
      version = "1.0.9";

      src = fetchHex {
        pkg = "castore";
        version = "${version}";
        sha256 = "5ea956504f1ba6f2b4eb707061d8e17870de2bee95fb59d512872c2ef06925e7";
      };

      beamDeps = [];
    };

    certifi = buildRebar3 rec {
      name = "certifi";
      version = "2.12.0";

      src = fetchHex {
        pkg = "certifi";
        version = "${version}";
        sha256 = "ee68d85df22e554040cdb4be100f33873ac6051387baf6a8f6ce82272340ff1c";
      };

      beamDeps = [];
    };

    db_connection = buildMix rec {
      name = "db_connection";
      version = "2.7.0";

      src = fetchHex {
        pkg = "db_connection";
        version = "${version}";
        sha256 = "dcf08f31b2701f857dfc787fbad78223d61a32204f217f15e881dd93e4bdd3ff";
      };

      beamDeps = [ telemetry ];
    };

    decimal = buildMix rec {
      name = "decimal";
      version = "2.1.1";

      src = fetchHex {
        pkg = "decimal";
        version = "${version}";
        sha256 = "53cfe5f497ed0e7771ae1a475575603d77425099ba5faef9394932b35020ffcc";
      };

      beamDeps = [];
    };

    dns_cluster = buildMix rec {
      name = "dns_cluster";
      version = "0.1.3";

      src = fetchHex {
        pkg = "dns_cluster";
        version = "${version}";
        sha256 = "46cb7c4a1b3e52c7ad4cbe33ca5079fbde4840dedeafca2baf77996c2da1bc33";
      };

      beamDeps = [];
    };

    ecto = buildMix rec {
      name = "ecto";
      version = "3.12.3";

      src = fetchHex {
        pkg = "ecto";
        version = "${version}";
        sha256 = "9efd91506ae722f95e48dc49e70d0cb632ede3b7a23896252a60a14ac6d59165";
      };

      beamDeps = [ decimal jason telemetry ];
    };

    ecto_sql = buildMix rec {
      name = "ecto_sql";
      version = "3.12.0";

      src = fetchHex {
        pkg = "ecto_sql";
        version = "${version}";
        sha256 = "dc9e4d206f274f3947e96142a8fdc5f69a2a6a9abb4649ef5c882323b6d512f0";
      };

      beamDeps = [ db_connection ecto postgrex telemetry ];
    };

    esbuild = buildMix rec {
      name = "esbuild";
      version = "0.8.1";

      src = fetchHex {
        pkg = "esbuild";
        version = "${version}";
        sha256 = "25fc876a67c13cb0a776e7b5d7974851556baeda2085296c14ab48555ea7560f";
      };

      beamDeps = [ castore jason ];
    };

    expo = buildMix rec {
      name = "expo";
      version = "1.1.0";

      src = fetchHex {
        pkg = "expo";
        version = "${version}";
        sha256 = "fbadf93f4700fb44c331362177bdca9eeb8097e8b0ef525c9cc501cb9917c960";
      };

      beamDeps = [];
    };

    file_system = buildMix rec {
      name = "file_system";
      version = "1.0.1";

      src = fetchHex {
        pkg = "file_system";
        version = "${version}";
        sha256 = "4414d1f38863ddf9120720cd976fce5bdde8e91d8283353f0e31850fa89feb9e";
      };

      beamDeps = [];
    };

    finch = buildMix rec {
      name = "finch";
      version = "0.19.0";

      src = fetchHex {
        pkg = "finch";
        version = "${version}";
        sha256 = "fc5324ce209125d1e2fa0fcd2634601c52a787aff1cd33ee833664a5af4ea2b6";
      };

      beamDeps = [ mime mint nimble_options nimble_pool telemetry ];
    };

    floki = buildMix rec {
      name = "floki";
      version = "0.36.2";

      src = fetchHex {
        pkg = "floki";
        version = "${version}";
        sha256 = "a8766c0bc92f074e5cb36c4f9961982eda84c5d2b8e979ca67f5c268ec8ed580";
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
      version = "0.26.1";

      src = fetchHex {
        pkg = "gettext";
        version = "${version}";
        sha256 = "01ce56f188b9dc28780a52783d6529ad2bc7124f9744e571e1ee4ea88bf08734";
      };

      beamDeps = [ expo ];
    };

    hackney = buildRebar3 rec {
      name = "hackney";
      version = "1.20.1";

      src = fetchHex {
        pkg = "hackney";
        version = "${version}";
        sha256 = "fe9094e5f1a2a2c0a7d10918fee36bfec0ec2a979994cff8cfe8058cd9af38e3";
      };

      beamDeps = [ certifi idna metrics mimerl parse_trans ssl_verify_fun unicode_util_compat ];
    };

    hpax = buildMix rec {
      name = "hpax";
      version = "1.0.0";

      src = fetchHex {
        pkg = "hpax";
        version = "${version}";
        sha256 = "7f1314731d711e2ca5fdc7fd361296593fc2542570b3105595bb0bc6d0fad601";
      };

      beamDeps = [];
    };

    httpoison = buildMix rec {
      name = "httpoison";
      version = "2.2.1";

      src = fetchHex {
        pkg = "httpoison";
        version = "${version}";
        sha256 = "51364e6d2f429d80e14fe4b5f8e39719cacd03eb3f9a9286e61e216feac2d2df";
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
      version = "1.4.4";

      src = fetchHex {
        pkg = "jason";
        version = "${version}";
        sha256 = "c5eb0cab91f094599f94d55bc63409236a8ec69a21a67814529e8d5f6cc90b3b";
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
      version = "2.0.6";

      src = fetchHex {
        pkg = "mime";
        version = "${version}";
        sha256 = "c9945363a6b26d747389aac3643f8e0e09d30499a138ad64fe8fd1d13d9b153e";
      };

      beamDeps = [];
    };

    mimerl = buildRebar3 rec {
      name = "mimerl";
      version = "1.3.0";

      src = fetchHex {
        pkg = "mimerl";
        version = "${version}";
        sha256 = "a1e15a50d1887217de95f0b9b0793e32853f7c258a5cd227650889b38839fe9d";
      };

      beamDeps = [];
    };

    mint = buildMix rec {
      name = "mint";
      version = "1.6.2";

      src = fetchHex {
        pkg = "mint";
        version = "${version}";
        sha256 = "5ee441dffc1892f1ae59127f74afe8fd82fda6587794278d924e4d90ea3d63f9";
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
      version = "1.7.14";

      src = fetchHex {
        pkg = "phoenix";
        version = "${version}";
        sha256 = "c7859bc56cc5dfef19ecfc240775dae358cbaa530231118a9e014df392ace61a";
      };

      beamDeps = [ castore jason phoenix_pubsub phoenix_template plug plug_crypto telemetry websock_adapter ];
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
      version = "4.1.1";

      src = fetchHex {
        pkg = "phoenix_html";
        version = "${version}";
        sha256 = "f2f2df5a72bc9a2f510b21497fd7d2b86d932ec0598f0210fed4114adc546c6f";
      };

      beamDeps = [];
    };

    phoenix_live_dashboard = buildMix rec {
      name = "phoenix_live_dashboard";
      version = "0.8.4";

      src = fetchHex {
        pkg = "phoenix_live_dashboard";
        version = "${version}";
        sha256 = "2984aae96994fbc5c61795a73b8fb58153b41ff934019cfb522343d2d3817d59";
      };

      beamDeps = [ ecto mime phoenix_live_view telemetry_metrics ];
    };

    phoenix_live_reload = buildMix rec {
      name = "phoenix_live_reload";
      version = "1.5.3";

      src = fetchHex {
        pkg = "phoenix_live_reload";
        version = "${version}";
        sha256 = "b4ec9cd73cb01ff1bd1cac92e045d13e7030330b74164297d1aee3907b54803c";
      };

      beamDeps = [ file_system phoenix ];
    };

    phoenix_live_view = buildMix rec {
      name = "phoenix_live_view";
      version = "1.0.0-rc.6";

      src = fetchHex {
        pkg = "phoenix_live_view";
        version = "${version}";
        sha256 = "e56e4f1642a0b20edc2488cab30e5439595e0d8b5b259f76ef98b1c4e2e5b527";
      };

      beamDeps = [ floki jason phoenix phoenix_html phoenix_template plug telemetry ];
    };

    phoenix_pubsub = buildMix rec {
      name = "phoenix_pubsub";
      version = "2.1.3";

      src = fetchHex {
        pkg = "phoenix_pubsub";
        version = "${version}";
        sha256 = "bba06bc1dcfd8cb086759f0edc94a8ba2bc8896d5331a1e2c2902bf8e36ee502";
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
      version = "1.16.1";

      src = fetchHex {
        pkg = "plug";
        version = "${version}";
        sha256 = "a13ff6b9006b03d7e33874945b2755253841b238c34071ed85b0e86057f8cddc";
      };

      beamDeps = [ mime plug_crypto telemetry ];
    };

    plug_crypto = buildMix rec {
      name = "plug_crypto";
      version = "2.1.0";

      src = fetchHex {
        pkg = "plug_crypto";
        version = "${version}";
        sha256 = "131216a4b030b8f8ce0f26038bc4421ae60e4bb95c5cf5395e1421437824c4fa";
      };

      beamDeps = [];
    };

    postgrex = buildMix rec {
      name = "postgrex";
      version = "0.19.1";

      src = fetchHex {
        pkg = "postgrex";
        version = "${version}";
        sha256 = "8bac7885a18f381e091ec6caf41bda7bb8c77912bb0e9285212829afe5d8a8f8";
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
      version = "1.17.1";

      src = fetchHex {
        pkg = "swoosh";
        version = "${version}";
        sha256 = "3b20d25e580cb79af631335a1bdcfbffd835c08ebcdc16e98577223a241a18a1";
      };

      beamDeps = [ bandit finch gen_smtp hackney jason mime plug telemetry ];
    };

    tailwind = buildMix rec {
      name = "tailwind";
      version = "0.2.3";

      src = fetchHex {
        pkg = "tailwind";
        version = "${version}";
        sha256 = "8e45e7a34a676a7747d04f7913a96c770c85e6be810a1d7f91e713d3a3655b5d";
      };

      beamDeps = [ castore ];
    };

    telemetry = buildRebar3 rec {
      name = "telemetry";
      version = "1.3.0";

      src = fetchHex {
        pkg = "telemetry";
        version = "${version}";
        sha256 = "7015fc8919dbe63764f4b4b87a95b7c0996bd539e0d499be6ec9d7f3875b79e6";
      };

      beamDeps = [];
    };

    telemetry_metrics = buildMix rec {
      name = "telemetry_metrics";
      version = "1.0.0";

      src = fetchHex {
        pkg = "telemetry_metrics";
        version = "${version}";
        sha256 = "f23713b3847286a534e005126d4c959ebcca68ae9582118ce436b521d1d47d5d";
      };

      beamDeps = [ telemetry ];
    };

    telemetry_poller = buildRebar3 rec {
      name = "telemetry_poller";
      version = "1.1.0";

      src = fetchHex {
        pkg = "telemetry_poller";
        version = "${version}";
        sha256 = "9eb9d9cbfd81cbd7cdd24682f8711b6e2b691289a0de6826e58452f28c103c8f";
      };

      beamDeps = [ telemetry ];
    };

    tentacat = buildMix rec {
      name = "tentacat";
      version = "2.4.0";

      src = fetchHex {
        pkg = "tentacat";
        version = "${version}";
        sha256 = "ac6a70af96d91f633babe968e15ab721e6e87e22e2c1481c3274000bb34c4dde";
      };

      beamDeps = [ httpoison jason ];
    };

    thousand_island = buildMix rec {
      name = "thousand_island";
      version = "1.3.5";

      src = fetchHex {
        pkg = "thousand_island";
        version = "${version}";
        sha256 = "2be6954916fdfe4756af3239fb6b6d75d0b8063b5df03ba76fd8a4c87849e180";
      };

      beamDeps = [ telemetry ];
    };

    unicode_util_compat = buildRebar3 rec {
      name = "unicode_util_compat";
      version = "0.7.0";

      src = fetchHex {
        pkg = "unicode_util_compat";
        version = "${version}";
        sha256 = "25eee6d67df61960cf6a794239566599b09e17e668d3700247bc498638152521";
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
      version = "0.5.7";

      src = fetchHex {
        pkg = "websock_adapter";
        version = "${version}";
        sha256 = "d0f478ee64deddfec64b800673fd6e0c8888b079d9f3444dd96d2a98383bdbd1";
      };

      beamDeps = [ bandit plug websock ];
    };

    yugo = buildMix rec {
      name = "yugo";
      version = "1.0.0";

      src = fetchHex {
        pkg = "yugo";
        version = "${version}";
        sha256 = "7d0e08dcad1bb7b452a17b8c08416098176c469468a116e40c58f2d2bbb9592e";
      };

      beamDeps = [];
    };
  };
in self

