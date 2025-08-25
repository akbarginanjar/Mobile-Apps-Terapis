import 'package:terapis/controllers/alamat_controller.dart';
import 'package:terapis/global_resource.dart';
import 'package:terapis/models/alamat_model.dart';
import 'package:dropdown_search/dropdown_search.dart';

// ignore: must_be_immutable
class AlamatScreen extends StatelessWidget {
  final AlamatController alamatController = Get.put(AlamatController());
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController nomorHp = TextEditingController();
  TextEditingController labelAlamat = TextEditingController();
  TextEditingController detailAlamat = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController lat = TextEditingController();
  TextEditingController long = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  AlamatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black38,
        elevation: 3,
        centerTitle: true,
        title: Text(
          'Alamat Baru',
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: primary, // Ubah warna ikon kembali di sini
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: Form(
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text(
                'KONTAK',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: namaLengkap,
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Nama Lengkap',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: nomorHp,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Nomor HP',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ALAMAT',
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
                  controller: labelAlamat,
                  decoration: InputDecoration(
                    hintText: 'Rumah, Kantor, Apartemen, Kos',
                    label: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Label Alamat',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                      ),
                    ),
                    fillColor: primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: primary),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Obx(() {
                return DropdownSearch<Province>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Provinsi",
                      hintText: "Pilih Provinsi",
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: primary),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Provinsi',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: Colors.white, child: popupWidget);
                    },
                  ),
                  items: alamatController.provinces.toList(),
                  itemAsString: (Province province) => province.name,
                  onChanged: (Province? province) {
                    alamatController.changeSelectProvinsi(province!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<KabKot>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kab/Kot",
                      hintText: "Pilih Kab/Kot",
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: primary),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kabupaten/Kota',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: Colors.white, child: popupWidget);
                    },
                  ),
                  items: alamatController.kabkots.toList(),
                  itemAsString: (KabKot kabkot) => kabkot.name,
                  onChanged: (KabKot? kabkot) {
                    alamatController.changeSelectKabKot(kabkot!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<Kacamatan>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kecamatan",
                      hintText: "Pilih Kecamatan",
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: primary),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kecamatan',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: Colors.white, child: popupWidget);
                    },
                  ),
                  items: alamatController.kecamatans.toList(),
                  itemAsString: (Kacamatan kecamatan) => kecamatan.name,
                  onChanged: (Kacamatan? kecamatan) {
                    alamatController.changeSelectKecamatan(kecamatan!.id);
                  },
                );
              }),
              const SizedBox(height: 13),
              Obx(() {
                return DropdownSearch<KelurahanModel>(
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Kelurahan",
                      hintText: "Pilih Kelurahan",
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.5, color: primary),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  popupProps: PopupProps.bottomSheet(
                    showSearchBox: true,
                    fit: FlexFit.loose,
                    title: const Padding(
                      padding: EdgeInsets.only(left: 8, top: 8),
                      child: Text(
                        'Cari Kelurahan',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ),
                    containerBuilder: (ctx, popupWidget) {
                      return Container(color: Colors.white, child: popupWidget);
                    },
                  ),
                  items: alamatController.kelurahans.toList(),
                  itemAsString: (KelurahanModel kelurahan) => kelurahan.name,
                  onChanged: (KelurahanModel? kelurahan) {
                    alamatController.changeSelectKelurahan(kelurahan!.id);
                  },
                );
              }),
              const SizedBox(height: 10),
              TextFormField(
                controller: lat,
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Latitude',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: long,
                decoration: InputDecoration(
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Longitude',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: detailAlamat,
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Detail Alamat',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: catatan,
                decoration: InputDecoration(
                  hintText: 'Catatan (Opsional)',
                  label: const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Catatan',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: primary),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    surfaceTintColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    alamatController.createAlamat(
                      labelAlamat: labelAlamat.text,
                      idProvinsi: alamatController.selectProvinsi!,
                      idKabKot: alamatController.selectKabKot!,
                      idKecamatan: alamatController.selectKecamatan!,
                      idKelurahan: alamatController.selectKelurahan!,
                      detailAlamat: detailAlamat.text,
                      nomorHp: nomorHp.text,
                      namaLengkap: namaLengkap.text,
                      jenisAlamat: alamatController.selectedJenisALamat
                          .toString(),
                      catatan: catatan.text,
                      lat: lat.text,
                      long: long.text,
                    );
                  },
                  child: Text(
                    'Simpan',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
