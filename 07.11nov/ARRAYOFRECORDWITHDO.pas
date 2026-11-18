program ArrayOfRecordWithDo;
{ ============================================================
  ARRAY OF RECORD + WITH DO (data langsung diisi di program)
  Poin yang dicakup:
  1. Deklarasi array of record (dengan nested record tanggal lahir)
  2. Mengisi data cara biasa : mhs[1].nama := '...'
  3. Mengisi data dengan WITH DO : with mhs[2] do ...
  4. Menampilkan semua data memakai perulangan + WITH DO
  5. Perbandingan penulisan tanpa dan dengan WITH DO
  Catatan: data mahasiswa ke-2 dan ke-3 hanyalah contoh (dummy).
  ============================================================ }

const
  MAKS = 10;

type
  TTanggal = record
    hari  : integer;
    bulan : integer;
    tahun : integer;
  end;

  TMahasiswa = record
    nama  : string;
    nim   : string;
    lahir : TTanggal;    { nested record }
    ipk   : real;
  end;

var
  mhs : array[1..MAKS] of TMahasiswa;
  jml : integer;
  i   : integer;

begin
  jml := 3;

  { ---------- 1. ISI CARA BIASA (tanpa With Do) ---------- }
  { Nama array + indeks harus ditulis berulang di setiap baris }
  mhs[1].nama        := 'Azwa Naira';
  mhs[1].nim         := '261401234';
  mhs[1].lahir.hari  := 29;
  mhs[1].lahir.bulan := 2;
  mhs[1].lahir.tahun := 2008;
  mhs[1].ipk         := 3.88;

  { ---------- 2. ISI DENGAN WITH DO ---------- }
  { Cukup tulis mhs[2] satu kali, field langsung ditulis }
  with mhs[2] do
  begin
    nama := 'Budi Santoso';
    nim  := '261401235';
    ipk  := 3.40;

    { With Do bersarang untuk nested record }
    with lahir do
    begin
      hari  := 5;
      bulan := 3;
      tahun := 2007;
    end;
  end;

  with mhs[3] do
  begin
    nama := 'Citra Lestari';
    nim  := '261401236';
    ipk  := 3.65;
    lahir.hari  := 12;      { atau cara ini: nested tanpa with bersarang }
    lahir.bulan := 11;
    lahir.tahun := 2008;
  end;

  { ---------- 3. TAMPILKAN SEMUA DATA (perulangan + With Do) ---------- }
  writeln('DAFTAR MAHASISWA');
  writeln('==================================================');
  for i := 1 to jml do
  begin
    with mhs[i] do
    begin
      writeln('Data ke-', i);
      writeln('  Nama          : ', nama);
      writeln('  NIM           : ', nim);
      writeln('  Tanggal Lahir : ', lahir.hari, '-', lahir.bulan, '-', lahir.tahun);
      writeln('  IPK           : ', ipk:0:2);
      writeln('--------------------------------------------------');
    end;
  end;

  { ---------- 4. CARI IPK TERTINGGI (With Do di dalam percabangan) ---------- }
  writeln;
  writeln('Mahasiswa dengan IPK >= 3.50 :');
  for i := 1 to jml do
    with mhs[i] do
      if ipk >= 3.50 then
        writeln('  ', nim, ' - ', nama, ' (', ipk:0:2, ')');

  writeln;
  write('Tekan Enter untuk keluar...');
  readln;
end.