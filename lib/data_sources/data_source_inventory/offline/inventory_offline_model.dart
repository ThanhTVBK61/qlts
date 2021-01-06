import 'package:qlts/data_sources/data_source_inventory/offline/inventory_aten_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_capd_capq_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_cobe_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_khac_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_mmtb_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_nckt_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_ptvt_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_tcot_model.dart';

class InventoryOfflineModel{
  String _errorCode = '';
  String _errorDesc = '';
  List<InventoryOffline> _listInventoryOffline = [];

  InventoryOfflineModel.fromJson(Map<String, dynamic> data){
    _errorCode = data["ErrorCode"];
    _errorDesc = data["ErrorDesc"];
    _listInventoryOffline = [];
    if (_errorCode == '200') {
      dynamic jsonData = data['ObjectData'][0];
      if(jsonData['json_data'] != null){
        for (int i = 0; i < jsonData['json_data'].length; i++) {
          InventoryOffline _dataVariantConfig = InventoryOffline.fromMap(jsonData['json_data'][i]);
          _listInventoryOffline.add(_dataVariantConfig);
        }
      }
    }
  }

  List<InventoryOffline> get listInventoryOffline => _listInventoryOffline;

  String get errorDesc => _errorDesc;

  String get errorCode => _errorCode;
}

class InventoryOffline{
  int idKqkk;
  int stt;
  String groupVariant = '';
  String soThe = '';
  String tenThe = '';
  String loaiCongTrinh = '';
  String maDuAn = '';
  String loaiTs = '';
  String giaTri = '';
  String maSo = '';
  String ten = '';
  String soLuong = '';
  String namXayDung = '';
  String namSuDung = '';
  String soTang = '';
  String dienTichSan = '';
  String diaDiem = '';
  String maTinhTrangSd = '';
  String tenTinhTrangSd = '';
  String maDviSd = '';
  String tenDviSd = '';
  String maPhong = '';
  String tenPhong = '';
  String maCsht = '';
  String tenCsht = '';
  String maNs = '';
  String tenNs = '';
  String qrCode = '';
  String qrCodeGiaTri = '';
  String ghiChu = '';
  String maVtHhDv = '';
  String nuocSx = '';
  String namSx = '';
  String model = '';
  String seri = '';
  String barCode = '';
  String bienKiemSoat = '';
  String xiLanh = '';
  String congSuat = '';
  String kmSuDung = '';
  String loaiNhienLieu = '';
  String soKhungSoMay = '';
  String diemDau = '';
  String diemCuoi = '';
  String namDauTu = '';
  String dungLuongCapDoi = '';
  String doDai = '';
  String phuongThucLapDat = '';
  String kcNguon = '';
  String idKcNguon = '';
  String kcDich = '';
  String idKcDich = '';
  String dungLuongOng = '';
  String duongKinhOng = '';
  String beDau = '';
  String idBeDau = '';
  String beCuoi = '';
  String idBeCuoi = '';
  String cotBeTongH6 = '';
  String cotBeTongH65 = '';
  String cotBeTongH7 = '';
  String cotBeTongH8 = '';
  String cotSat16 = '';
  String cotSat17 = '';
  String cotMuaDienLucH8 = '';
  String cotMuaDienLucH10 = '';
  String cotMuaDienLucH12 = '';
  String loaiKhac = '';
  String diaChi = '';
  String loaiCot = '';
  String doCao = '';
  String ketCauThan = '';
  String ketCauMong = '';

  InventoryOffline.fromMap(inventoryOffline){
    idKqkk = inventoryOffline['id_kqkk'];
    stt = inventoryOffline['stt'];
    groupVariant = inventoryOffline['group_variant'] ;
    soThe = inventoryOffline['so_the'];
    tenThe = inventoryOffline['ten_the'];
    loaiCongTrinh = inventoryOffline['loai_cong_trinh'];
    maDuAn = inventoryOffline['ma_du_an'];
    loaiTs = inventoryOffline['loai_ts'];
    giaTri = inventoryOffline['gia_tri'];
    maSo = inventoryOffline['ma_so'];
    ten = inventoryOffline['ten'];
    soLuong = inventoryOffline['so_luong'];
    namXayDung = inventoryOffline['nam_xay_dung'];
    namSuDung = inventoryOffline['nam_su_dung'];
    soTang = inventoryOffline['so_tang'];
    dienTichSan = inventoryOffline['dien_tich_san'];
    diaDiem = inventoryOffline['dia_diem'];
    maTinhTrangSd = inventoryOffline['ma_tinh_trang_sd'];
    tenTinhTrangSd = inventoryOffline['ten_tinh_trang_sd'];
    maDviSd = inventoryOffline['ma_dvi_sd'];
    tenDviSd = inventoryOffline['ten_dvi_sd'];
    maPhong = inventoryOffline['ma_phong'];
    tenPhong = inventoryOffline['ten_phong'];
    maCsht = inventoryOffline['ma_csht'];
    tenCsht = inventoryOffline['ten_csht'];
    maNs = inventoryOffline['ma_ns'];
    tenNs = inventoryOffline['ten_ns'];
    qrCode = inventoryOffline['qr_code'];
    qrCodeGiaTri = inventoryOffline['qr_code_gtri'];
    ghiChu = inventoryOffline['ghi_chu'];
    maVtHhDv = inventoryOffline['ma_vt_hh_dv'];
    nuocSx = inventoryOffline['nuoc_sx'];
    namSx = inventoryOffline['nam_sx'];
    model = inventoryOffline['model'];
    seri = inventoryOffline['seri'];
    barCode = inventoryOffline['barcode'];
    bienKiemSoat = inventoryOffline['bien_kiem_soat'];
    xiLanh = inventoryOffline['xi_lanh'];
    congSuat = inventoryOffline['cong_suat'];
    kmSuDung = inventoryOffline['km_su_dung'];
    loaiNhienLieu = inventoryOffline['loai_nhien_lieu'];
    soKhungSoMay = inventoryOffline['so_khung_so_may'];
    diemDau = inventoryOffline['diem_dau'];
    diemCuoi = inventoryOffline['diem_cuoi'];
    namDauTu = inventoryOffline['nam_dau_tu'];
    dungLuongCapDoi = inventoryOffline['dung_luong_cap_doi'];
    doDai = inventoryOffline['do_dai'];
    phuongThucLapDat = inventoryOffline['phuong_thuc_lap_dat'];
    kcNguon = inventoryOffline['kc_nguon'];
    idKcNguon = inventoryOffline['id_kc_nguon'];
    kcDich = inventoryOffline['kc_dich'];
    idKcDich = inventoryOffline['id_kc_dich'];
    dungLuongOng = inventoryOffline['dung_luong_ong'];
    duongKinhOng = inventoryOffline['duong_kinh_ong'];
    beDau = inventoryOffline['be_dau'];
    idBeDau = inventoryOffline['id_be_dau'];
    beCuoi = inventoryOffline['be_cuoi'];
    idBeCuoi = inventoryOffline['id_be_cuoi'];
    cotBeTongH6 = inventoryOffline['cot_be_tong_h6'];
    cotBeTongH65 = inventoryOffline['cot_be_tong_h6_5'];
    cotBeTongH7 = inventoryOffline['cot_be_tong_h7'];
    cotBeTongH8 = inventoryOffline['cot_be_tong_h8'];
    cotSat16 = inventoryOffline['cot_sat_16'];
    cotSat17 = inventoryOffline['cot_sat_17'];
    cotMuaDienLucH8 = inventoryOffline['cot_mua_dien_luc_h8'];
    cotMuaDienLucH10 = inventoryOffline['cot_mua_dien_luc_h10'];
    cotMuaDienLucH12 = inventoryOffline['cot_mua_dien_luc_h12'];
    loaiKhac = inventoryOffline['loai_khac'];
    diaChi = inventoryOffline['dia_chi'];
    loaiCot = inventoryOffline['loai_cot'];
    doCao = inventoryOffline['do_cao'];
    ketCauThan = inventoryOffline['ket_cau_than'];
    ketCauMong = inventoryOffline['ket_cau_mong'];
  }

  InventoryOffline();

  InventoryOffline.fromDataOffline(dynamic dataOffline){
    if(dataOffline is InventoryATEN){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;

      this.diaChi = dataOffline.listDataShow[7].giaTri;

      this.namDauTu = dataOffline.listDataShow[8].giaTri;
      this.namSuDung = dataOffline.listDataShow[9].giaTri;

      this.loaiCot = dataOffline.listDataShow[10].giaTri;
      this.doCao = dataOffline.listDataShow[11].giaTri;
      this.ketCauThan = dataOffline.listDataShow[12].giaTri;
      this.ketCauMong = dataOffline.listDataShow[13].giaTri;

      this.maTinhTrangSd = dataOffline.listDataShow[14].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[15].giaTri;
      this.maDviSd = dataOffline.listDataShow[16].giaTri;
      this.tenDviSd = dataOffline.listDataShow[17].giaTri;
      this.maPhong = dataOffline.listDataShow[18].giaTri;
      this.tenPhong = dataOffline.listDataShow[19].giaTri;
      this.maCsht = dataOffline.listDataShow[20].giaTri;
      this.tenCsht = dataOffline.listDataShow[21].giaTri;
      this.maNs = dataOffline.listDataShow[22].giaTri;
      this.tenNs = dataOffline.listDataShow[23].giaTri;
      this.qrCode = dataOffline.listDataShow[24].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[25].giaTri;
      this.ghiChu = dataOffline.listDataShow[26].giaTri;

    }
    else if(dataOffline is InventoryCAPDCAPQ){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;

      this.diemDau = dataOffline.listDataShow[7].giaTri;
      this.diemCuoi = dataOffline.listDataShow[8].giaTri;
      this.namDauTu = dataOffline.listDataShow[9].giaTri;

      this.namSuDung = dataOffline.listDataShow[10].giaTri;

      this.dungLuongCapDoi = dataOffline.listDataShow[11].giaTri;
      this.doDai = dataOffline.listDataShow[12].giaTri;
      this.phuongThucLapDat = dataOffline.listDataShow[13].giaTri;
      this.kcNguon = dataOffline.listDataShow[14].giaTri;
      this.idKcNguon = dataOffline.listDataShow[15].giaTri;
      this.kcDich = dataOffline.listDataShow[16].giaTri;
      this.idKcDich = dataOffline.listDataShow[17].giaTri;

      this.soLuong = dataOffline.listDataShow[18].giaTri;
      this.maTinhTrangSd = dataOffline.listDataShow[19].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[20].giaTri;
      this.maDviSd = dataOffline.listDataShow[21].giaTri;
      this.tenDviSd = dataOffline.listDataShow[22].giaTri;
      this.maPhong = dataOffline.listDataShow[23].giaTri;
      this.tenPhong = dataOffline.listDataShow[24].giaTri;
      this.maCsht = dataOffline.listDataShow[25].giaTri;
      this.tenCsht = dataOffline.listDataShow[26].giaTri;
      this.maNs = dataOffline.listDataShow[27].giaTri;
      this.tenNs = dataOffline.listDataShow[28].giaTri;
      this.qrCode = dataOffline.listDataShow[29].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[30].giaTri;
      this.ghiChu = dataOffline.listDataShow[31].giaTri;
    }
    else if(dataOffline is InventoryCOBE) {

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;

      this.namDauTu = dataOffline.listDataShow[7].giaTri;
      this.namSuDung = dataOffline.listDataShow[8].giaTri;

      this.doDai = dataOffline.listDataShow[9].giaTri;

      this.dungLuongOng = dataOffline.listDataShow[10].giaTri;
      this.duongKinhOng = dataOffline.listDataShow[11].giaTri;
      this.beDau = dataOffline.listDataShow[12].giaTri;
      this.idBeDau = dataOffline.listDataShow[13].giaTri;
      this.beCuoi = dataOffline.listDataShow[14].giaTri;
      this.idBeCuoi = dataOffline.listDataShow[15].giaTri;

      this.maTinhTrangSd = dataOffline.listDataShow[16].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[17].giaTri;
      this.maDviSd = dataOffline.listDataShow[18].giaTri;
      this.tenDviSd = dataOffline.listDataShow[19].giaTri;
      this.maPhong = dataOffline.listDataShow[20].giaTri;
      this.tenPhong = dataOffline.listDataShow[21].giaTri;
      this.maCsht = dataOffline.listDataShow[22].giaTri;
      this.tenCsht = dataOffline.listDataShow[23].giaTri;
      this.maNs = dataOffline.listDataShow[24].giaTri;
      this.tenNs = dataOffline.listDataShow[25].giaTri;
      this.qrCode = dataOffline.listDataShow[26].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[27].giaTri;
      this.ghiChu = dataOffline.listDataShow[28].giaTri;

    }
    else if(dataOffline is InventoryKHAC){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;

      this.namDauTu = dataOffline.listDataShow[7].giaTri;
      this.namSuDung = dataOffline.listDataShow[8].giaTri;

      this.maTinhTrangSd = dataOffline.listDataShow[9].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[10].giaTri;
      this.maDviSd = dataOffline.listDataShow[11].giaTri;
      this.tenDviSd = dataOffline.listDataShow[12].giaTri;
      this.maPhong = dataOffline.listDataShow[13].giaTri;
      this.tenPhong = dataOffline.listDataShow[14].giaTri;
      this.maCsht = dataOffline.listDataShow[15].giaTri;
      this.tenCsht = dataOffline.listDataShow[16].giaTri;
      this.maNs = dataOffline.listDataShow[17].giaTri;
      this.tenNs = dataOffline.listDataShow[18].giaTri;
      this.qrCode = dataOffline.listDataShow[19].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[20].giaTri;
      this.ghiChu = dataOffline.listDataShow[21].giaTri;

    }
    else if(dataOffline is InventoryMMTB){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;
      this.soLuong = dataOffline.listDataShow[7].giaTri;

      this.maVtHhDv = dataOffline.listDataShow[8].giaTri;
      this.nuocSx = dataOffline.listDataShow[9].giaTri;
      this.namSx = dataOffline.listDataShow[10].giaTri;

      this.namSuDung = dataOffline.listDataShow[11].giaTri;

      this.model = dataOffline.listDataShow[12].giaTri;
      this.seri = dataOffline.listDataShow[13].giaTri;

      this.diaDiem = dataOffline.listDataShow[14].giaTri;
      this.maTinhTrangSd = dataOffline.listDataShow[15].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[16].giaTri;
      this.maDviSd = dataOffline.listDataShow[17].giaTri;
      this.tenDviSd = dataOffline.listDataShow[18].giaTri;
      this.maPhong = dataOffline.listDataShow[19].giaTri;
      this.tenPhong = dataOffline.listDataShow[20].giaTri;
      this.maCsht = dataOffline.listDataShow[21].giaTri;
      this.tenCsht = dataOffline.listDataShow[22].giaTri;
      this.maNs = dataOffline.listDataShow[23].giaTri;
      this.tenNs = dataOffline.listDataShow[24].giaTri;
      this.qrCode = dataOffline.listDataShow[25].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[26].giaTri;
      this.barCode = dataOffline.listDataShow[27].giaTri;
      this.ghiChu = dataOffline.listDataShow[28].giaTri;

    }
    else if(dataOffline is InventoryNCKT){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.loaiCongTrinh = dataOffline.listDataShow[2].giaTri;
      this.maDuAn = dataOffline.listDataShow[3].giaTri;
      this.loaiTs = dataOffline.listDataShow[4].giaTri;
      this.giaTri = dataOffline.listDataShow[5].giaTri;
      this.maSo = dataOffline.listDataShow[6].giaTri;
      this.ten = dataOffline.listDataShow[7].giaTri;
      this.soLuong = dataOffline.listDataShow[8].giaTri;
      this.namXayDung = dataOffline.listDataShow[9].giaTri;
      this.namSuDung = dataOffline.listDataShow[10].giaTri;
      this.soTang = dataOffline.listDataShow[11].giaTri;
      this.dienTichSan = dataOffline.listDataShow[12].giaTri;
      this.diaDiem = dataOffline.listDataShow[13].giaTri;
      this.maTinhTrangSd = dataOffline.listDataShow[14].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[15].giaTri;
      this.maDviSd = dataOffline.listDataShow[16].giaTri;
      this.tenDviSd = dataOffline.listDataShow[17].giaTri;
      this.maPhong = dataOffline.listDataShow[18].giaTri;
      this.tenPhong = dataOffline.listDataShow[19].giaTri;
      this.maCsht = dataOffline.listDataShow[20].giaTri;
      this.tenCsht = dataOffline.listDataShow[21].giaTri;
      this.maNs = dataOffline.listDataShow[22].giaTri;
      this.tenNs = dataOffline.listDataShow[23].giaTri;
      this.qrCode = dataOffline.listDataShow[24].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[25].giaTri;
      this.ghiChu = dataOffline.listDataShow[26].giaTri;

    }
    else if(dataOffline is InventoryPTVT){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;
      this.soLuong = dataOffline.listDataShow[7].giaTri;

      this.nuocSx = dataOffline.listDataShow[8].giaTri;
      this.namSx = dataOffline.listDataShow[9].giaTri;

      this.model = dataOffline.listDataShow[10].giaTri;

      this.namSuDung = dataOffline.listDataShow[11].giaTri;

      this.bienKiemSoat = dataOffline.listDataShow[12].giaTri;
      this.xiLanh = dataOffline.listDataShow[13].giaTri;
      this.congSuat = dataOffline.listDataShow[14].giaTri;
      this.kmSuDung = dataOffline.listDataShow[15].giaTri;
      this.loaiNhienLieu = dataOffline.listDataShow[16].giaTri;
      this.soKhungSoMay = dataOffline.listDataShow[17].giaTri;

      this.maTinhTrangSd = dataOffline.listDataShow[18].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[19].giaTri;
      this.maDviSd = dataOffline.listDataShow[20].giaTri;
      this.tenDviSd = dataOffline.listDataShow[21].giaTri;
      this.maPhong = dataOffline.listDataShow[22].giaTri;
      this.tenPhong = dataOffline.listDataShow[23].giaTri;
      this.maCsht = dataOffline.listDataShow[24].giaTri;
      this.tenCsht = dataOffline.listDataShow[25].giaTri;
      this.maNs = dataOffline.listDataShow[26].giaTri;
      this.tenNs = dataOffline.listDataShow[27].giaTri;
      this.qrCode = dataOffline.listDataShow[28].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[29].giaTri;

      this.ghiChu = dataOffline.listDataShow[30].giaTri;

    }
    else if(dataOffline is InventoryTCOT){

      this.idKqkk = dataOffline.idKqkk;

      this.soThe = dataOffline.listDataShow[0].giaTri;
      this.tenThe = dataOffline.listDataShow[1].giaTri;
      this.maDuAn = dataOffline.listDataShow[2].giaTri;
      this.loaiTs = dataOffline.listDataShow[3].giaTri;
      this.giaTri = dataOffline.listDataShow[4].giaTri;
      this.maSo = dataOffline.listDataShow[5].giaTri;
      this.ten = dataOffline.listDataShow[6].giaTri;

      this.diemDau = dataOffline.listDataShow[7].giaTri;
      this.diemCuoi = dataOffline.listDataShow[8].giaTri;

      this.namDauTu = dataOffline.listDataShow[9].giaTri;
      this.namSuDung = dataOffline.listDataShow[10].giaTri;

      this.cotBeTongH6 = dataOffline.listDataShow[11].giaTri;
      this.cotBeTongH65 = dataOffline.listDataShow[12].giaTri;
      this.cotBeTongH7 = dataOffline.listDataShow[13].giaTri;
      this.cotBeTongH8 = dataOffline.listDataShow[14].giaTri;
      this.cotSat16 = dataOffline.listDataShow[15].giaTri;
      this.cotSat17 = dataOffline.listDataShow[16].giaTri;
      this.cotMuaDienLucH8 = dataOffline.listDataShow[17].giaTri;
      this.cotMuaDienLucH10 = dataOffline.listDataShow[18].giaTri;
      this.cotMuaDienLucH12 = dataOffline.listDataShow[19].giaTri;
      this.loaiKhac = dataOffline.listDataShow[20].giaTri;

      this.maTinhTrangSd = dataOffline.listDataShow[21].giaTri;
      this.tenTinhTrangSd = dataOffline.listDataShow[22].giaTri;
      this.maDviSd = dataOffline.listDataShow[23].giaTri;
      this.tenDviSd = dataOffline.listDataShow[24].giaTri;
      this.maPhong = dataOffline.listDataShow[25].giaTri;
      this.tenPhong = dataOffline.listDataShow[26].giaTri;
      this.maCsht = dataOffline.listDataShow[27].giaTri;
      this.tenCsht = dataOffline.listDataShow[28].giaTri;
      this.maNs = dataOffline.listDataShow[29].giaTri;
      this.tenNs = dataOffline.listDataShow[30].giaTri;
      this.qrCode = dataOffline.listDataShow[31].giaTri;
      this.qrCodeGiaTri = dataOffline.listDataShow[32].giaTri;
      this.ghiChu = dataOffline.listDataShow[33].giaTri;
    }
  }

}