program NestedRecord;
{ ============================================================
  CONTOH LENGKAP NESTED RECORD (Record di dalam Record)
  Poin yang dicakup:
  1. Deklarasi record kecil dulu, baru record besar
  2. Mengisi field bertingkat  : mhs.lahir.hari
  3. Mengakses field bertingkat
  4. With Do (satu tingkat dan bersarang)
  5. Assignment between records (menyalin seluruh isi)
  ============================================================ }

type
  { Record kecil harus dideklarasikan SEBELUM dipakai }
  TTanggal = record
    hari  : integer;
    bulan : integer;
    tahun : integer;
  end;

  TAlamat = record
    jalan : string;
    kota  : string;
  end;

  { Record besar: dua field-nya adalah Record lain (nested) }
  TMahasiswa = record
    nama   : string;
    nim    : string;
    lahir  : TTanggal;   { nested record 1 }
    alamat : TAlamat;    { nested record 2 }
    ipk    : real;
  end;

var
  mhs, salinan : TMahasiswa;

{ Prosedur menampilkan satu mahasiswa }
procedure Tampilkan(m: TMahasiswa; judul: string);
begin
  writeln('=== ', judul, ' ===');
  writeln('Nama          : ', m.nama);
  writeln('NIM           : ', m.nim);
  writeln('Tanggal Lahir : ', m.lahir.hari, '-', m.lahir.bulan, '-', m.lahir.tahun);
  writeln('Alamat        : ', m.alamat.jalan, ', ', m.alamat.kota);
  writeln('IPK           : ', m.ipk:0:2);
  writeln;
end;

begin
  { ---------- 1. ISI DENGAN CARA BIASA (titik bertingkat) ---------- }
  mhs.nama := 'Azwa Naira';
  mhs.nim  := '261401234';

  mhs.lahir.hari  := 29;
  mhs.lahir.bulan := 2;
  mhs.lahir.tahun := 2008;

  mhs.alamat.jalan := 'Jl. Dr. Mansur No. 9';
  mhs.alamat.kota  := 'Medan';

  mhs.ipk := 3.88;

  Tampilkan(mhs, 'DATA MAHASISWA (isi biasa)');

  { ---------- 2. ASSIGNMENT BETWEEN RECORDS ---------- }
  { Satu baris menyalin SEMUA field, termasuk record di dalamnya }
  salinan := mhs;

  { ---------- 3. UBAH SALINAN pakai WITH DO ---------- }
  with salinan do
  begin
    nama := 'Budi Santoso';
    nim  := '251401002';
    ipk  := 3.40;

    { With Do bersarang untuk record di dalamnya }
    with lahir do
    begin
      hari  := 5;
      bulan := 3;
      tahun := 2006;
    end;

    with alamat do
    begin
      jalan := 'Jl. Sisingamangaraja No. 20';
      kota  := 'Medan';
    end;
  end;

  Tampilkan(salinan, 'DATA SALINAN (sudah diubah dengan With Do)');

  { Bukti: record asli tidak ikut berubah karena salinan adalah
    kopian terpisah, bukan referensi }
  Tampilkan(mhs, 'DATA ASLI (tetap sama)');

  readln;
end.