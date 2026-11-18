program WithDoSaja;
{ ============================================================
  WITH DO (satu record saja, tanpa array, tanpa nested)
  Poin yang dicakup:
  1. Mengisi field TANPA With Do (nama variabel berulang)
  2. Mengisi field DENGAN With Do (nama variabel cukup sekali)
  3. Menampilkan field dengan With Do
  4. With Do di dalam percabangan if
  ============================================================ }

type
  TMahasiswa = record
    nama      : string;
    nim       : string;
    tgl_lahir : string;
    ipk       : real;
  end;

var
  mhs1, mhs2 : TMahasiswa;

begin
  { ---------- 1. TANPA WITH DO ---------- }
  mhs1.nama      := 'Azwa Naira';
  mhs1.nim       := '261401234';
  mhs1.tgl_lahir := '29 Februari 2008';
  mhs1.ipk       := 3.88;

  writeln('--- Tanpa With Do ---');
  writeln('Nama          : ', mhs1.nama);
  writeln('NIM           : ', mhs1.nim);
  writeln('Tanggal Lahir : ', mhs1.tgl_lahir);
  writeln('IPK           : ', mhs1.ipk:0:2);
  writeln;

  { ---------- 2. DENGAN WITH DO ---------- }
  { Nama variabel record cukup ditulis satu kali di "with ... do" }
  with mhs2 do
  begin
    nama      := 'Azwa Naira';
    nim       := '261401234';
    tgl_lahir := '29 Februari 2008';
    ipk       := 3.88;
  end;

  { ---------- 3. TAMPILKAN DENGAN WITH DO ---------- }
  writeln('--- Dengan With Do ---');
  with mhs2 do
  begin
    writeln('Nama          : ', nama);
    writeln('NIM           : ', nim);
    writeln('Tanggal Lahir : ', tgl_lahir);
    writeln('IPK           : ', ipk:0:2);

    { ---------- 4. WITH DO DI DALAM PERCABANGAN ---------- }
    if ipk >= 3.50 then
      writeln('Predikat      : Sangat Memuaskan')
    else
      writeln('Predikat      : Memuaskan');
  end;

  writeln;
  write('Tekan Enter untuk keluar...');
  readln;
end.