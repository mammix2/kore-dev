package=tor
$(package)_version=0.2.5.1-alpha
$(package)_download_path=https://archive.torproject.org/tor-package-archive
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=3100d8f0ccb296e82f1d3602266d4dcde801daace82af74f5f27ee2fca7bb4a8
$(package)_dependencies=zlib libevent openssl

define $(package)_set_vars
$(package)_config_opts=--disable-asciidoc
$(package)_config_opts=--disable-tool-name-check
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install && \
  mkdir -p $($(package)_staging_prefix_dir)/lib && \
  cp $($(package)_build_dir)/src/or/libtor.a $($(package)_staging_prefix_dir)/lib/libtor.a && \
  cp $($(package)_build_dir)/src/common/libor.a $($(package)_staging_prefix_dir)/lib/libor.a && \
  cp $($(package)_build_dir)/src/common/libor-crypto.a $($(package)_staging_prefix_dir)/lib/libor-crypto.a && \
  cp $($(package)_build_dir)/src/common/libor-event.a $($(package)_staging_prefix_dir)/lib/libor-event.a && \
	cp $($(package)_build_dir)/src/common/libcurve25519_donna.a $($(package)_staging_prefix_dir)/lib/libcurve25519_donna.a
endef

define $(package)_postprocess_cmds
endef

