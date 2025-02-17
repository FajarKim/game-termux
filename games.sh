#!/data/data/com.termux/files/usr/bin/bash
# termux-games: This is a simple tools for played games in Termux App
# Use this tool wisely. It is forbidden to distribute, copy, modify,
# and/or trading is the tool.
#
# BSD 3-Clause License
#
# Copyright (c) 2022-2023, Rangga Fajar Oktariansyah
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS AS IS
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
skip=95
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
]   �������� �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��f����J��jo�>��0o��d��$젺n�ot㬯�y�rq��L���U��Ă7�	�7�ۏ�+j��AO|1]I2Lv�:�o/�c��)E�Q�����߫���\\"�M�./@^?��{�6Buk�H���G�`"7����H�>�)�W(N���Q����d�&�9FF��d�W�����1ӱ�E1Y��i�{� Z ���Ɗ7���S�/���G�����Nv�q�f�7�#����s��pu	񴪺�^�u�#�=ƿ��~R������v��kb�5&��&urׅrK�oσ���g%�`ߊP�,��V�_o�,�i�7��@�L|¾	
�~��}vl:uxo��P0�U�P����� �B�QUYsҙɉ[��		��X�XX�M��.�����_�cS���E[L���FM�	����6Z�͊�������9g�S�;4���~�I�oE�)/
��MKd9䶒�{���C}@d���T�&����z��`m�D�BM��x=����U�B���W�`���?[��9��H���N����3��7����J@c&m�\�rv�
. V�_˩���$Y��ee�V�_�IRhv����B���w�t�g�����* :?Ά��`���`��ۆȂ#�.gϩ�v���ڑьl[Gج���6Y��%�S�cM<5t]���%㾘���r��_,z�A"W�~��G�Rϱ���zu���k+^T������c����J�+]���`���MFޟ/�f��&��C�������Y_uH�iN���N��n���A��7�f��bS�ب���DR��o��ݑ&w��D��i=*rT��8������ٰG�=k�$�)EoP��=3;|[YS(����9L���yX�7�.�u�'����?�����5#�(��Ό��)Ѝ7Ȫm{���q�;
L��,������>��B�VU9��\�e��4��p���`c��4�����_Q�#���b4/��Mɿ��gn��%o��i���d���#i��D��1-����\V��i	�.��-�����X ǒz��m�@y:���r�B4���t=$?�I�&�,�0=���u �<�UfT�`���T)�v��j�	Y����3Anԡ%��B8��Ժ���@���-���4�'z������6c�.�J�yUC
�<ʶf`ڿ���+�R��d�n��:�x2hSƘ(]�ߖ4����;E�H�`k�����$=�_�Na����۶u�Ẳ� 4s�,���]�x�3^d��`T�I�����.�c$���Q�cA��;�`e�U�N��fՕ/P�k
�$����Ӕ �ǩ�q�*��Z4���_��.������E�� O�>�ے�o(V>.����!0��v�n����������M �4p�ê�o�V�\�q@�lv���ҙ�y#���mG0��s���kY��IFIC�<�br�zl�=g�E��l��L].�9����V`tާ��.�����/3>?�Ѽ��N���	�����ۓ�	�M�Z�q�F�X5��+T�!`�*�2겶�l������jZ��-�W<����O&N�h=j�m�O �������|�/�S=e��O�f�lD��zxè�J��(�1����F?��!�%#�¾�� /�Ɵ!X7�E�/Pr��LJi+i����eD/D�g��|<Pe���ϱ4� �Nڐ�3'��� [�QI�� �uޒ��,��Z��%���t{���'��ƶ��{�� ����;F-�o7�ہ2��J1flZFם� �!�b��{Vٝ
mf�e���A�=��y�[t���>:L������-a���)�-���Ӆ{���ލ�6H6���)��U���!P�Qt�K��\�-�ž���$>��+��5@����5��Z�tj�K0�����ϙ�J�N��"�a��t/�;�:��~�S��l����"+jtsĜ0ɵ�����WincbdzF[ݎCv.�3!�����b��U��ϧ�"�ԑ��3K���x��c`�S�}����]No�
�[��3�p��4�%�St+K�A>va#��G�)�Q�:��`/�e{AT��V�.�Z��O���"��R~=8Lթ%�V����=�p��.1��!�v��o��Z��bj�����Fc����)�����	OBx��՝H\����>)���YQ6h�(aY5P��?�/���xS�L^VK�R���>�R.Ofj�F�*<dZw-����a�9���X��ҲY�6N��N�����0[NO�8|��uM �&2�o�v�HwA�p������g����B͜Rq�u)8k�{��LR�I��nT"3'YgO�Ât8#�H�iu?"R���I�}-����{�g�1����_�D@R��|��X,�	ܮɦ� fC�(�t�s���ݴ�`5��,��ֱFnj�5�g �Ջ�8�����?MȳI��a�cC^L��û/����k*��N����fM�'�E,���=�q�=	�_F��.���]a���*"ş���s�1)�������V�	��{��
��TR���O�2ϟ���o�@��ꮉC��ST~$�%i�3=�~X��{��@�6�Š4 �u����1��,b!}�1���U�4����B�siz�$#z�,x����=5M!���X��pJ#`��&�X��h��n��Yw1{I�N������71���dN�D�� nJ��w�+��O����gw�0�Vٷ��O��w��A�8U�VH�����N�H��?���`�Z��5U��#��;b����㸴�zc��k%�S�/����Uo��>��[pĒ7��%�+qv�\�;T�؂����Q�/r�Ȭ!�R��2��(�=�.��5v ��(<)w��.���*V2?�����r���a'~Ejӊ)����a9N��F��z�m�����r}q0�&�nՃA�'&s�"<D,�"���}������-��1���<�J���P�ӷԐ��ζ��_-PK%
ZX�W�Zø��f�8'SY��L�QV-�b��m:�������#>�!�?�J4�N]����"L����!����N���j%�
���EfG]T@��>�j�qN������T2����H�9�z���(��ם�$ c1[�ʎn0�!���)�H�-B^�X+J�W���Ɯ-�j�#�]r�6��`��!o`<"ڮI���NC$����m�<��u'ҟ�F�l'���# ��H��U/z�e���l������?��z��[Sw�ɫ���MsE��M��d���1�����<a�E�;;���X=Z�i���=������~���n�����״��yST��X���&��cCZ�AZ�m���p��䤐�妌�V�W���~d����)���ٶf���]�,wv�'���a*� &hC⃼p�>�c�hF�,k�x4�yjS���ˡ@��,�d�֜���0��S�nK�2����"ZWH���4��b�0�Z6���6W�!�q���l�gܥ!�H9C���
���DOQ8�0�E+��0���ɹ�M�����j��g�֩Ϋ��n��g�@��E�0s!���3N%	�����9����2�c��_��"�|�NQ.X�H�*�·{Ϩ�����+�i!G�����:"����?�0A8`�������"�I7��~��l�c�&�+�o�%��X����k]��N��>G�i�4v�60����ƶ	����~��ef�E�GX�%{P�&��c������8��D�[1�k������]'3-y�]l�%�	�L�Z�}P�=�3�X)+��q�g2�=;_�9�Eu��Zf��36A�xn0Q;d��$��m{s�Xc��ф��9��1$Щ;s�8	�����Crf2� Oo����!�`h	�{XK/rs�2ٻ���&�b�<��	�����i,����]��G�8(���Q8 ݤ֩�[`6��̑��m���𚏭|+Ը m<�cC��N�7�:`t�P>!GA#��<��۟vnLV�ꨂe��J�v�8�>��{���Y�5�l/)�m?�B��;�ZK���5MQ���7K�.���}�Xw�CBB]S��6����Y��G~Xu�J�N8��Շg�3���m�L�L�Y����w�
���Up՝r���
�m���g��j$������V�Z��@]�V[1M�_q�3�M�}��-�O�1�~02��'-��jQ�s��Q��qܰ0̇7���k�Y~��
�����N��{���ha�=a�)%�-�sЇ�WnV��ezF��HR�%� �
�����E���+���.���V��s[�
t(�a���BTm�8�`	�?���@o":tV+�m_'��wg������IJ�����;�6���)8���I�Tc����	M��R�ƻV p	K���l`~{��b
1���>��ջVRDIQ�����J}:�q$���m.���̉����织i�Q�#�8����a�&}Q�GN55�x�81���,�t/��C���+�=���|w�	gnY�K
�D\x���E�9�W�?U2Wi��0�H�Ɍ���{:�x'�F�z�^�!�0�E�xk��cU�����K���@���`��T�`��a�)%e�V3�{5�%�/�3��=S>Ļe�+1d���]�(X�_�zc�V����r�p�O�	tZΚL^�M�
R�J�\E�^k�n3�>֜�F_�mjs톤������1R�cW���sj x	��x�su�R��/?(�ke�u�sœ/~����MIZ�7�"D�f� H6CM4 �-�4�@m�Id�=lw�g�g�-����G�Bi��g���[����,�(�����.�"b%|3�Є@���1�o��ލ\O�F���G-��z�=�5�-?à ��������ԃ�r�!�5{|�wx%�*�y�~ .Z���k>�i1$Ao�,�k9Ő��h��qH�ݸZÐ曖|媿�����F��,4T��{�����3F%*�����/=�����s�(��/QH�bE.m)�
�"`��^́=��P*��羢v�$���[V1)���I�����nzO��]�)�
�;�:�\%�����p��~��b��h��=��l���E�٤�7�-���0N�Qv�ҏ:.�� �̪�wg�h�x��k����)�Hi�O�6�KOw�jAS
v
�tӰ���)����I���+6T� ��΢��NU2y�x-�O,�1N�̤c _ǎ2�����%�Cf�^*g"7@����]@��?�`� ��Wb�C^d��Ւ��n��	H��$.��?��J1����R �7�̊��!�1ې.ßϪ�ly�w3:���Ӗ�
�J��#�~���y�L�ay�E��@�j���J���kE�ӝ�05S)|�Fde��%��F���I죡�˨H���r%"C��4������q"�d��x'�k���x���)f����|0��J%0ba�/L%��}�Žћ!��|J�%�N�D̓,d�*�Ԡ\��Y��s�ذV���7�ZH2�	�թ���;������/��G+���)"�K+8�����s��$VH w���c�r�y�l$��bb����}P����2���[�g�z͙B�!�J�t�����|�mܞ%���!q��Y��d|�d]���f�Z�0r�Ų����� �6v5�}��>)�u$j�K��1�l�����:��&܄5�b�$��A��#z����g���O���.���a���0|뱽��ʈ�n.�]9d�I�\8HN��c��.HeÛ��u!AHx�1��%'��Kt�T��#��-��:ko��������d��Fze���
s���(E��|!bFQ�/��V*S��t������I=3����Co	��*����" b*�[Yܕ�I0B����$���Б���g�}��aws��`���[ G�c��H�OI�@�-[iV ��������A�I<T���3�E�r�(e�����T�Ֆ���������׌����Os5#��MLl�%(ɷV�-��D���s��\H�]:�`m4ф�����+��gD��89T�0��J��'5ԞO����w)"B���`�z'�6�ˣ��Ѳ��T3�dF�l�kl�U1ޢ��I������C���2?x���Mb�h�> ��ɾ�Ag�0�,�M��e��b����|3BM�K8���J�Rs'G���'�5T.D6����;�(vzOŝ�w�m����z`u Ѣ����]
�Qj�Î7�Ώ�9