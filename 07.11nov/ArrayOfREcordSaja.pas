program ArrayOfRecordSaja;
{ ============================================================
  ARRAY OF RECORD (tanpa With Do, tanpa nested)
  Poin yang dicakup:
  1. Deklarasi record dan array of record
  2. Mengisi data per indeks   : mhs[1].nama := '...'
  3. Menampilkan semua data dengan perulangan for
  4. Mencari IPK tertinggi
  Catatan: data mahasiswa ke-2 dan ke-3 hanya contoh (dummy).
  ============================================================ }

const
  MAKS = 10;

type
  TMahasiswa = record
    nama      : string;
    nim       : string;
    tgl_lahir : string;
    ipk       : real;
  end;

var
  mhs    : array[1..MAKS] of TMahasiswa;
  jml, i : integer;
  idxMaks: integer;

begin
  jml := 3;

  { ---------- ISI DATA: format variabel[indeks].field ---------- }
  mhs[1].nama      := 'Azwa Naira';
  mhs[1].nim       := '261401234';
  mhs[1].tgl_lahir := '29 Februari 2008';
  mhs[1].ipk       := 3.88;

  mhs[2].nama      := 'Budi Santoso';
  mhs[2].nim       := '261401235';
  mhs[2].tgl_lahir := '5 Maret 2007';
  mhs[2].ipk       := 3.40;

  mhs[3].nama      := 'Citra Lestari';
  mhs[3].nim       := '261401236';
  mhs[3].tgl_lahir := '12 November 2008';
  mhs[3].ipk       := 3.65;

  { ---------- TAMPILKAN SEMUA DATA ---------- }
  writeln('DAFTAR MAHASISWA');
  writeln('==================================================');
  for i := 1 to jml do
  begin
    writeln('Data ke-', i);
    writeln('  Nama          : ', mhs[i].nama);
    writeln('  NIM           : ', mhs[i].nim);
    writeln('  Tanggal Lahir : ', mhs[i].tgl_lahir);
    writeln('  IPK           : ', mhs[i].ipk:0:2);
    writeln('--------------------------------------------------');
  end;

  { ---------- CARI IPK TERTINGGI ---------- }
  idxMaks := 1;
  for i := 2 to jml do
    if mhs[i].ipk > mhs[idxMaks].ipk then
      idxMaks := i;

  writeln;
  writeln('IPK tertinggi : ', mhs[idxMaks].ipk:0:2,
          ' (', mhs[idxMaks].nama, ')');

  writeln;
  write('Tekan Enter untuk keluar...');
  readln;
end.