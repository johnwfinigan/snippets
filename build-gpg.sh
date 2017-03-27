#!/bin/bash

# for building GPG from mainline source on Centos 7
# need to gpg --import key at https://www.gnupg.org/signature_key.html

set -e

#sudo yum install libassuan-devel libgpg-error-devel  libksba-devel zlib-devel pth-devel

GPG_PATH=$HOME/local

mkdir -p $GPG_PATH/src && cd  $GPG_PATH/src

LIBGPG_ERR_SRC=libgpg-error-1.27
GNUPG_SRC=gnupg-2.0.30
LIBGCRYPT_SRC=libgcrypt-1.7.6

curl -O https://www.gnupg.org/ftp/gcrypt/libgpg-error/$LIBGPG_ERR_SRC.tar.bz2
curl -O https://www.gnupg.org/ftp/gcrypt/gnupg/$GNUPG_SRC.tar.bz2
curl -O https://www.gnupg.org/ftp/gcrypt/libgcrypt/$LIBGCRYPT_SRC.tar.bz2

curl -O https://www.gnupg.org/ftp/gcrypt/libgpg-error/$LIBGPG_ERR_SRC.tar.bz2.sig
curl -O https://www.gnupg.org/ftp/gcrypt/gnupg/$GNUPG_SRC.tar.bz2.sig
curl -O https://www.gnupg.org/ftp/gcrypt/libgcrypt/$LIBGCRYPT_SRC.tar.bz2.sig

gpg --verify $LIBGPG_ERR_SRC.tar.bz2.sig $LIBGPG_ERR_SRC.tar.bz2
gpg --verify $GNUPG_SRC.tar.bz2.sig $GNUPG_SRC.tar.bz2
gpg --verify $LIBGCRYPT_SRC.tar.bz2.sig $LIBGCRYPT_SRC.tar.bz2

tar jxf $LIBGPG_ERR_SRC.tar.bz2
tar jxf $GNUPG_SRC.tar.bz2
tar jxf $LIBGCRYPT_SRC.tar.bz2

cd $LIBGPG_ERR_SRC
./configure --prefix=$GPG_PATH && make && make install
cd $GPG_PATH/src

cd $LIBGCRYPT_SRC
./configure --prefix=$GPG_PATH  --with-libgpg-error-prefix=$GPG_PATH && make && make install
cd $GPG_PATH/src

cd $GNUPG_SRC
export LD_LIBRARY_PATH=$GPG_PATH/lib:$LD_LIBRARY_PATH
./configure --prefix=$GPG_PATH  --with-libgpg-error-prefix=$GPG_PATH --with-libgcrypt-prefix=$GPG_PATH && make && make install


# LD_LIBRARY_PATH=$GPG_PATH/lib $GPG_PATH/bin/gpg2

