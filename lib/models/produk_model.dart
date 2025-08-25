class Produk {
  int? id;
  int? gudangId;
  int? memberId;
  String? nama;
  String? slug;
  List<Photo>? photo;
  List<HargaJual>? hargaJual;
  int? harga;
  List<VarianBarang>? varianBarang;

  Produk(
      {this.id,
      this.gudangId,
      this.memberId,
      this.nama,
      this.slug,
      this.photo,
      this.hargaJual,
      this.harga,
      this.varianBarang});

  Produk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gudangId = json['gudang_id'];
    memberId = json['member_id'];
    nama = json['nama'];
    slug = json['slug'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
    if (json['harga_jual'] != null) {
      hargaJual = <HargaJual>[];
      json['harga_jual'].forEach((v) {
        hargaJual!.add(HargaJual.fromJson(v));
      });
    }
    harga = json['harga'];
    if (json['varian_barang'] != null) {
      varianBarang = <VarianBarang>[];
      json['varian_barang'].forEach((v) {
        varianBarang!.add(VarianBarang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gudang_id'] = gudangId;
    data['member_id'] = memberId;
    data['nama'] = nama;
    data['slug'] = slug;
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    if (hargaJual != null) {
      data['harga_jual'] = hargaJual!.map((v) => v.toJson()).toList();
    }
    data['harga'] = harga;
    if (varianBarang != null) {
      data['varian_barang'] = varianBarang!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  int? id;
  int? barangId;
  String? photo;
  int? tipe;
  String? path;

  Photo({this.id, this.barangId, this.photo, this.tipe, this.path});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barangId = json['barang_id'];
    photo = json['photo'];
    tipe = json['tipe'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barang_id'] = barangId;
    data['photo'] = photo;
    data['tipe'] = tipe;
    data['path'] = path;
    return data;
  }
}

class HargaJual {
  int? id;
  int? barangId;
  int? tipeKonsumenId;
  int? satuanId;
  int? shareJasa;
  int? sharePenjual;
  int? harga;
  Tipe? tipe;
  Satuan? satuan;

  HargaJual(
      {this.id,
      this.barangId,
      this.tipeKonsumenId,
      this.satuanId,
      this.shareJasa,
      this.sharePenjual,
      this.harga,
      this.tipe,
      this.satuan});

  HargaJual.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barangId = json['barang_id'];
    tipeKonsumenId = json['tipe_konsumen_id'];
    satuanId = json['satuan_id'];
    shareJasa = json['share_jasa'];
    sharePenjual = json['share_penjual'];
    harga = json['harga'];
    tipe = json['tipe'] != null ? Tipe.fromJson(json['tipe']) : null;
    satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barang_id'] = barangId;
    data['tipe_konsumen_id'] = tipeKonsumenId;
    data['satuan_id'] = satuanId;
    data['share_jasa'] = shareJasa;
    data['share_penjual'] = sharePenjual;
    data['harga'] = harga;
    if (tipe != null) {
      data['tipe'] = tipe!.toJson();
    }
    if (satuan != null) {
      data['satuan'] = satuan!.toJson();
    }
    return data;
  }
}

class Tipe {
  int? id;
  String? nama;

  Tipe({this.id, this.nama});

  Tipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    return data;
  }
}

class Satuan {
  int? id;
  String? satuan;

  Satuan({this.id, this.satuan});

  Satuan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    satuan = json['satuan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['satuan'] = satuan;
    return data;
  }
}

class VarianBarang {
  int? id;
  int? gudangId;
  int? barangId;
  int? jumlah;
  int? memberId;
  String? konversiKet;
  Barang? barang;
  Gudang? gudang;
  Blok? blok;
  String? palet;
  String? rak;
  String? laci;
  int? harga;

  VarianBarang(
      {this.id,
      this.gudangId,
      this.barangId,
      this.jumlah,
      this.memberId,
      this.konversiKet,
      this.barang,
      this.gudang,
      this.blok,
      this.palet,
      this.rak,
      this.laci,
      this.harga});

  VarianBarang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gudangId = json['gudang_id'];
    barangId = json['barang_id'];
    jumlah = json['jumlah'];
    memberId = json['member_id'];
    konversiKet = json['konversi_ket'];
    barang = json['barang'] != null ? Barang.fromJson(json['barang']) : null;
    gudang = json['gudang'] != null ? Gudang.fromJson(json['gudang']) : null;
    blok = json['blok'] != null ? Blok.fromJson(json['blok']) : null;
    palet = json['palet'];
    rak = json['rak'];
    laci = json['laci'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gudang_id'] = gudangId;
    data['barang_id'] = barangId;
    data['jumlah'] = jumlah;
    data['member_id'] = memberId;
    data['konversi_ket'] = konversiKet;
    if (barang != null) {
      data['barang'] = barang!.toJson();
    }
    if (gudang != null) {
      data['gudang'] = gudang!.toJson();
    }
    if (blok != null) {
      data['blok'] = blok!.toJson();
    }
    data['palet'] = palet;
    data['rak'] = rak;
    data['laci'] = laci;
    data['harga'] = harga;
    return data;
  }
}

class Barang {
  int? id;
  int? idSatuan;
  String? kode;
  String? nama;
  String? varian;
  int? jenis;
  String? headId;
  String? generik;
  int? narkotik;
  String? klasifikasiUsia;
  int? milik;
  int? kelompokId;
  int? jenisObat;
  String? expireDate;
  int? kondisi;
  String? deskripsi;
  int? minPesanan;
  String? berat;
  int? panjang;
  int? lebar;
  int? tinggi;
  int? asuransiPengiriman;
  int? statusOrder;
  int? waktuPreorder;
  int? publish;
  String? kandungan;
  String? noBatch;
  bool? isConsignment;
  bool? isPreOrder;
  int? preOrderDay;
  int? memberId;
  bool? showToOthers;
  String? slug;
  List<VarianItem>? varianItem;
  String? share;
  Satuan? satuan;
  Kategori? kategori;
  List<HargaJual>? hargaJual;
  List<Null>? jenisPenyakit;
  List<Null>? layananEkspedisi;
  List<Konversi>? konversi;
  List<Photo>? photo;

  Barang(
      {this.id,
      this.idSatuan,
      this.kode,
      this.nama,
      this.varian,
      this.jenis,
      this.headId,
      this.generik,
      this.narkotik,
      this.klasifikasiUsia,
      this.milik,
      this.kelompokId,
      this.jenisObat,
      this.expireDate,
      this.kondisi,
      this.deskripsi,
      this.minPesanan,
      this.berat,
      this.panjang,
      this.lebar,
      this.tinggi,
      this.asuransiPengiriman,
      this.statusOrder,
      this.waktuPreorder,
      this.publish,
      this.kandungan,
      this.noBatch,
      this.isConsignment,
      this.isPreOrder,
      this.preOrderDay,
      this.memberId,
      this.showToOthers,
      this.slug,
      this.varianItem,
      this.share,
      this.satuan,
      this.kategori,
      this.hargaJual,
      this.jenisPenyakit,
      this.layananEkspedisi,
      this.konversi,
      this.photo});

  Barang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSatuan = json['id_satuan'];
    kode = json['kode'];
    nama = json['nama'];
    varian = json['varian'];
    jenis = json['jenis'];
    headId = json['head_id'];
    generik = json['generik'];
    narkotik = json['narkotik'];
    klasifikasiUsia = json['klasifikasi_usia'];
    milik = json['milik'];
    kelompokId = json['kelompok_id'];
    jenisObat = json['jenis_obat'];
    expireDate = json['expire_date'];
    kondisi = json['kondisi'];
    deskripsi = json['deskripsi'];
    minPesanan = json['min_pesanan'];
    berat = json['berat'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    tinggi = json['tinggi'];
    asuransiPengiriman = json['asuransi_pengiriman'];
    statusOrder = json['status_order'];
    waktuPreorder = json['waktu_preorder'];
    publish = json['publish'];
    kandungan = json['kandungan'];
    noBatch = json['no_batch'];
    isConsignment = json['is_consignment'];
    isPreOrder = json['is_pre_order'];
    preOrderDay = json['pre_order_day'];
    memberId = json['member_id'];
    showToOthers = json['show_to_others'];
    slug = json['slug'];
    if (json['varian_item'] != null) {
      varianItem = <VarianItem>[];
      json['varian_item'].forEach((v) {
        varianItem!.add(VarianItem.fromJson(v));
      });
    }
    share = json['share'];
    satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
    kategori =
        json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null;
    if (json['harga_jual'] != null) {
      hargaJual = <HargaJual>[];
      json['harga_jual'].forEach((v) {
        hargaJual!.add(HargaJual.fromJson(v));
      });
    }
    // if (json['jenis_penyakit'] != null) {
    //   jenisPenyakit = <Null>[];
    //   json['jenis_penyakit'].forEach((v) {
    //     jenisPenyakit!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['layanan_ekspedisi'] != null) {
    //   layananEkspedisi = <Null>[];
    //   json['layanan_ekspedisi'].forEach((v) {
    //     layananEkspedisi!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['konversi'] != null) {
      konversi = <Konversi>[];
      json['konversi'].forEach((v) {
        konversi!.add(Konversi.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_satuan'] = idSatuan;
    data['kode'] = kode;
    data['nama'] = nama;
    data['varian'] = varian;
    data['jenis'] = jenis;
    data['head_id'] = headId;
    data['generik'] = generik;
    data['narkotik'] = narkotik;
    data['klasifikasi_usia'] = klasifikasiUsia;
    data['milik'] = milik;
    data['kelompok_id'] = kelompokId;
    data['jenis_obat'] = jenisObat;
    data['expire_date'] = expireDate;
    data['kondisi'] = kondisi;
    data['deskripsi'] = deskripsi;
    data['min_pesanan'] = minPesanan;
    data['berat'] = berat;
    data['panjang'] = panjang;
    data['lebar'] = lebar;
    data['tinggi'] = tinggi;
    data['asuransi_pengiriman'] = asuransiPengiriman;
    data['status_order'] = statusOrder;
    data['waktu_preorder'] = waktuPreorder;
    data['publish'] = publish;
    data['kandungan'] = kandungan;
    data['no_batch'] = noBatch;
    data['is_consignment'] = isConsignment;
    data['is_pre_order'] = isPreOrder;
    data['pre_order_day'] = preOrderDay;
    data['member_id'] = memberId;
    data['show_to_others'] = showToOthers;
    data['slug'] = slug;
    if (varianItem != null) {
      data['varian_item'] = varianItem!.map((v) => v.toJson()).toList();
    }
    data['share'] = share;
    if (satuan != null) {
      data['satuan'] = satuan!.toJson();
    }
    if (kategori != null) {
      data['kategori'] = kategori!.toJson();
    }
    if (hargaJual != null) {
      data['harga_jual'] = hargaJual!.map((v) => v.toJson()).toList();
    }
    // if (this.jenisPenyakit != null) {
    //   data['jenis_penyakit'] =
    //       this.jenisPenyakit!.map((v) => v.toJson()).toList();
    // }
    // if (this.layananEkspedisi != null) {
    //   data['layanan_ekspedisi'] =
    //       this.layananEkspedisi!.map((v) => v.toJson()).toList();
    // }
    if (konversi != null) {
      data['konversi'] = konversi!.map((v) => v.toJson()).toList();
    }
    if (photo != null) {
      data['photo'] = photo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VarianItem {
  int? barangId;
  int? satuanId;
  String? kode;
  String? noBatch;
  String? varian;
  String? expireDate;
  int? harga;

  VarianItem(
      {this.barangId,
      this.satuanId,
      this.kode,
      this.noBatch,
      this.varian,
      this.expireDate,
      this.harga});

  VarianItem.fromJson(Map<String, dynamic> json) {
    barangId = json['barang_id'];
    satuanId = json['satuan_id'];
    kode = json['kode'];
    noBatch = json['no_batch'];
    varian = json['varian'];
    expireDate = json['expire_date'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barang_id'] = barangId;
    data['satuan_id'] = satuanId;
    data['kode'] = kode;
    data['no_batch'] = noBatch;
    data['varian'] = varian;
    data['expire_date'] = expireDate;
    data['harga'] = harga;
    return data;
  }
}

class Kategori {
  int? id;
  String? kategori;

  Kategori({this.id, this.kategori});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kategori'] = kategori;
    return data;
  }
}

class Konversi {
  int? id;
  int? idBarang;
  int? idSatuan;
  int? nilai;
  Satuan? satuan;

  Konversi({this.id, this.idBarang, this.idSatuan, this.nilai, this.satuan});

  Konversi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBarang = json['id_barang'];
    idSatuan = json['id_satuan'];
    nilai = json['nilai'];
    satuan = json['satuan'] != null ? Satuan.fromJson(json['satuan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_barang'] = idBarang;
    data['id_satuan'] = idSatuan;
    data['nilai'] = nilai;
    if (satuan != null) {
      data['satuan'] = satuan!.toJson();
    }
    return data;
  }
}

class Gudang {
  int? id;
  int? jenis;
  String? namaGudang;
  String? alamat;
  String? keterangan;
  int? ruteId;
  int? memberId;
  String? sebagai;
  Member? member;
  String? karyawan;
  String? kendaraan;
  String? rute;

  Gudang(
      {this.id,
      this.jenis,
      this.namaGudang,
      this.alamat,
      this.keterangan,
      this.ruteId,
      this.memberId,
      this.sebagai,
      this.member,
      this.karyawan,
      this.kendaraan,
      this.rute});

  Gudang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    namaGudang = json['nama_gudang'];
    alamat = json['alamat'];
    keterangan = json['keterangan'];
    ruteId = json['rute_id'];
    memberId = json['member_id'];
    sebagai = json['sebagai'];
    member = json['member'] != null ? Member.fromJson(json['member']) : null;
    karyawan = json['karyawan'];
    kendaraan = json['kendaraan'];
    rute = json['rute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['jenis'] = jenis;
    data['nama_gudang'] = namaGudang;
    data['alamat'] = alamat;
    data['keterangan'] = keterangan;
    data['rute_id'] = ruteId;
    data['member_id'] = memberId;
    data['sebagai'] = sebagai;
    if (member != null) {
      data['member'] = member!.toJson();
    }
    data['karyawan'] = karyawan;
    data['kendaraan'] = kendaraan;
    data['rute'] = rute;
    return data;
  }
}

class Member {
  int? id;
  String? namaLengkap;
  int? jk;
  String? noHp;
  String? email;
  int? provinsiId;
  int? kabKotaId;
  int? kecamatanId;
  int? kelurahanId;
  String? sebagai;
  int? status;
  String? alamat;
  String? sellerid;
  String? card;
  String? ig;
  String? wa;
  List<Wilayah>? wilayah;
  String? provinsi;
  String? kabKota;
  String? kecamatan;
  String? kelurahan;

  Member(
      {this.id,
      this.namaLengkap,
      this.jk,
      this.noHp,
      this.email,
      this.provinsiId,
      this.kabKotaId,
      this.kecamatanId,
      this.kelurahanId,
      this.sebagai,
      this.status,
      this.alamat,
      this.sellerid,
      this.card,
      this.ig,
      this.wa,
      this.wilayah,
      this.provinsi,
      this.kabKota,
      this.kecamatan,
      this.kelurahan});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaLengkap = json['nama_lengkap'];
    jk = json['jk'];
    noHp = json['no_hp'];
    email = json['email'];
    provinsiId = json['provinsi_id'];
    kabKotaId = json['kab_kota_id'];
    kecamatanId = json['kecamatan_id'];
    kelurahanId = json['kelurahan_id'];
    sebagai = json['sebagai'];
    status = json['status'];
    alamat = json['alamat'];
    sellerid = json['sellerid'];
    card = json['card'];
    ig = json['ig'];
    wa = json['wa'];
    if (json['wilayah'] != null) {
      wilayah = <Wilayah>[];
      json['wilayah'].forEach((v) {
        wilayah!.add(Wilayah.fromJson(v));
      });
    }
    provinsi = json['provinsi'];
    kabKota = json['kab_kota'];
    kecamatan = json['kecamatan'];
    kelurahan = json['kelurahan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_lengkap'] = namaLengkap;
    data['jk'] = jk;
    data['no_hp'] = noHp;
    data['email'] = email;
    data['provinsi_id'] = provinsiId;
    data['kab_kota_id'] = kabKotaId;
    data['kecamatan_id'] = kecamatanId;
    data['kelurahan_id'] = kelurahanId;
    data['sebagai'] = sebagai;
    data['status'] = status;
    data['alamat'] = alamat;
    data['sellerid'] = sellerid;
    data['card'] = card;
    data['ig'] = ig;
    data['wa'] = wa;
    if (wilayah != null) {
      data['wilayah'] = wilayah!.map((v) => v.toJson()).toList();
    }
    data['provinsi'] = provinsi;
    data['kab_kota'] = kabKota;
    data['kecamatan'] = kecamatan;
    data['kelurahan'] = kelurahan;
    return data;
  }
}

class Wilayah {
  Cabang? cabang;

  Wilayah({this.cabang});

  Wilayah.fromJson(Map<String, dynamic> json) {
    cabang = json['cabang'] != null ? Cabang.fromJson(json['cabang']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cabang != null) {
      data['cabang'] = cabang!.toJson();
    }
    return data;
  }
}

class Cabang {
  String? namaCabang;
  String? namaTeritori;
  String? keterangan;
  String? namaKota;
  List<Null>? anggota;

  Cabang(
      {this.namaCabang,
      this.namaTeritori,
      this.keterangan,
      this.namaKota,
      this.anggota});

  Cabang.fromJson(Map<String, dynamic> json) {
    namaCabang = json['nama_cabang'];
    namaTeritori = json['nama_teritori'];
    keterangan = json['keterangan'];
    namaKota = json['nama_kota'];
    // if (json['anggota'] != null) {
    //   anggota = <Null>[];
    //   json['anggota'].forEach((v) {
    //     anggota!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_cabang'] = namaCabang;
    data['nama_teritori'] = namaTeritori;
    data['keterangan'] = keterangan;
    data['nama_kota'] = namaKota;
    // if (this.anggota != null) {
    //   data['anggota'] = this.anggota!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Blok {
  int? id;
  int? gudangId;
  String? blok;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Blok(
      {this.id,
      this.gudangId,
      this.blok,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Blok.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gudangId = json['gudang_id'];
    blok = json['blok'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gudang_id'] = gudangId;
    data['blok'] = blok;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
