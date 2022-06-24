#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

bz2tmpdir=
trap 'res=$?
  test -n "$bz2tmpdir" && rm -fr "$bz2tmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  bz2tmpdir=`mktemp -d "${TMPDIR}bz2tmpXXXXXXXXX"`
else
  bz2tmpdir=${TMPDIR}bz2tmp$$; mkdir $bz2tmpdir
fi || { (exit 127); exit 127; }

bz2tmp=$bz2tmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bz2tmp" && rm -r "$bz2tmp";;
*/*) bz2tmp=$bz2tmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bz2tmp"; then
  umask $umask
  chmod 700 "$bz2tmp"
  (sleep 5; rm -fr "$bz2tmpdir") 2>/dev/null &
  "$bz2tmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s' "Cannot decompress ${0##*/}" "Report bugs <fajarrkim@gmail.com>"
  (exit 127); res=127
fi; exit $res
BZh91AY&SYl��7 T��|_}�����Y�����hH��Hx `�a۾��<�g�E �7�4$d��d�i�M4�=#�� 2�  2���)6��ji��� � ��  	CI����#@z�=@ �A�    5?J���h �d�`L ���� !�L`��Szi=F���&5��# �4`�`�@!�"H��5��LҞ��S&�zMOF�сS�M��F�h΂" v�b�ΰ%9�R�Z�)upU�����	��4���c\aBUB� ��f�Z�2�0>ݙ!� ��%o�ѷ4:�]v��p�t!e6��]kU7N�ެq*�������; j �~��6�:�7��Ǎ��A ��Gع��0ˈ�۩�Ec�g��ff�D��&L�g�~}n.,��yf�HِYC�2g{;E��Ի�egL�7�1����)"fqAz= �Zn�wHJNn��� a��"�ĒHw=���	$@��	F1��I�f!(& q�^�
)s�ts�8N��^�_/aꊪ���W��{ߑ�f,���#_�w5n���V�:���q��W(ҕ�W�f�@xn		$;7��՟�fݼ�msɦ$�8�e�{6H$�瞋6��S��lx<8eB"����m�x�� �Q�qNs�s�� �U^�UՆPg������9-��`��
��6��!�m3( FD�s!� >�A8�Z�0��,����Zq()�d��m��m��m�ۢP�eB11k��*yU"��< Z�"��ؘ�e5N��VcN�O(��{(���P7���ŭ����^�g�ABHHAlk��uM�_r���@���H$P"�S���>��Ξ�"-jR�y�m^�D�!fx�T�EZ�����/!�C�߯�����;3?����t���l�[�H0yy$�����v�;KE�E�xG�����"�a� 2��KhT��U�aʸt��ƈd�1C9~oY�LtJ�	�V�(.�z!�X"|H�l�(Hy>kZLeU�}ۙq�|]X� \�<<��[�{�6o�}��$.��	���%          )J
��d�4�g��"d�D�L+�26[t�*�Ūݩ�~��dKDd_��+�A���A(;ku�R�Ri)6	I&��˵�JѪװC�&O�5��a���@Y���s9�71dLp$H�$L�}1F��H�9Wv���`�Q�%�/ ˸���|��A,��UW/nWд��-i�ƵK9���ՕB�$q��BxQ��N�:���yw���p�1sz��`s�D�H�y��6�DЉchn�`�4��\6Fȕ���ć§�ƀ���!"�Q��Ib�ww���  g�aإ��2�=(��D��HT�cŝQ!�����{��^U��b��<j8$��D�%��n�#t������JJQi�5��C��1ډ�q�f��\�R�;��þ�C��:ϡ6�����9���DH*l35�*P�K�Zp��I�I��wрt ���`T�J,B�ƒg�I|�82.��	P����� �&��uJh�Qb�-7�� u���,d4)�!��A�������r�;�\��F��4�rY��XL`���Eq��q+��\݆A蝩$�&%>d�k^wˍӏ�G���:��i;���q���SA����2[g�,<���x2.�4
��H�u�_P������UB ��1!1GaP	~�`+�Q({�1N�(���"Y0�U�Q�elJ�b%5��I��(��Բ�fk`A"���rE8P�l��7