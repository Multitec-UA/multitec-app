import 'package:flutter/widgets.dart';

AppSizes sizes = AppSizes();
AppSpacings spacings = AppSpacings();
AppPaddings paddings = AppPaddings();

class AppSizes {
  final double s1 = 1;
  final double s3 = 3;
  final double s4 = 4;
  final double s6 = 6;
  final double s8 = 8;
  final double s12 = 12;
  final double s14 = 14;
  final double s16 = 16;
  final double s20 = 20;
  final double s24 = 24;
  final double s32 = 32;
  final double s40 = 40;
  final double s48 = 48;
  final double s56 = 56;
  final double s64 = 64;
  final double s80 = 80;
  final double s96 = 96;
}

class AppSpacings {
  final x = _SpaceSize.x();
  final y = _SpaceSize.y();
}

class _SpaceSize {
  _SpaceSize.x() : axis = Axis.horizontal;

  _SpaceSize.y() : axis = Axis.vertical;

  final Axis axis;

  _SpaceBox _box(double size) => _SpaceBox(
        axis == Axis.horizontal ? size : null,
        axis == Axis.vertical ? size : null,
      );

  SizedBox get s1 => _box(sizes.s1).sizedBox;

  SliverToBoxAdapter get sliver1 => _box(sizes.s1).sliverSizedBox;

  SizedBox get s4 => _box(sizes.s4).sizedBox;

  SliverToBoxAdapter get sliver4 => _box(sizes.s4).sliverSizedBox;

  SizedBox get s6 => _box(sizes.s6).sizedBox;

  SliverToBoxAdapter get sliver6 => _box(sizes.s6).sliverSizedBox;

  SizedBox get s8 => _box(sizes.s8).sizedBox;

  SliverToBoxAdapter get sliver8 => _box(sizes.s8).sliverSizedBox;

  SizedBox get s12 => _box(sizes.s12).sizedBox;

  SliverToBoxAdapter get sliver12 => _box(sizes.s12).sliverSizedBox;

  SizedBox get s14 => _box(sizes.s14).sizedBox;

  SliverToBoxAdapter get sliver14 => _box(sizes.s14).sliverSizedBox;

  SizedBox get s16 => _box(sizes.s16).sizedBox;

  SliverToBoxAdapter get sliver16 => _box(sizes.s16).sliverSizedBox;

  SizedBox get s20 => _box(sizes.s20).sizedBox;

  SliverToBoxAdapter get sliver20 => _box(sizes.s20).sliverSizedBox;

  SizedBox get s24 => _box(sizes.s24).sizedBox;

  SliverToBoxAdapter get sliver24 => _box(sizes.s24).sliverSizedBox;

  SizedBox get s32 => _box(sizes.s32).sizedBox;

  SliverToBoxAdapter get sliver32 => _box(sizes.s32).sliverSizedBox;

  SizedBox get s40 => _box(sizes.s40).sizedBox;

  SliverToBoxAdapter get sliver40 => _box(sizes.s40).sliverSizedBox;

  SizedBox get s48 => _box(sizes.s48).sizedBox;

  SliverToBoxAdapter get sliver48 => _box(sizes.s48).sliverSizedBox;

  SizedBox get s56 => _box(sizes.s56).sizedBox;

  SliverToBoxAdapter get sliver56 => _box(sizes.s56).sliverSizedBox;

  SizedBox get s64 => _box(sizes.s64).sizedBox;

  SliverToBoxAdapter get sliver64 => _box(sizes.s64).sliverSizedBox;

  SizedBox get s80 => _box(sizes.s80).sizedBox;

  SliverToBoxAdapter get sliver80 => _box(sizes.s80).sliverSizedBox;

  SizedBox get s96 => _box(sizes.s96).sizedBox;

  SliverToBoxAdapter get sliver96 => _box(sizes.s96).sliverSizedBox;
}

class _SpaceBox {
  _SpaceBox(this._width, this._height)
      : assert(
          (_width != null || _height != null) ||
              (_width != null && _height != null),
          'You must provide one of width or height',
        );

  final double? _width;
  final double? _height;

  SizedBox get sizedBox => SizedBox(width: _width, height: _height);

  SliverToBoxAdapter get sliverSizedBox => SliverToBoxAdapter(child: sizedBox);
}

class AppPaddings {
  final left = _PaddingSide(_PaddingSidesFlags.left());
  final top = _PaddingSide(_PaddingSidesFlags.top());
  final right = _PaddingSide(_PaddingSidesFlags.right());
  final bottom = _PaddingSide(_PaddingSidesFlags.bottom());
  final x = _PaddingSide(_PaddingSidesFlags.x());
  final y = _PaddingSide(_PaddingSidesFlags.y());
  final all = _PaddingSide(_PaddingSidesFlags.all());
}

class _PaddingSide {
  _PaddingSide(this.sidesFlag);

  final _PaddingSidesFlags sidesFlag;

  EdgeInsets get s1 => _PaddingSize(sidesFlag, sizes.s1).edgeInsets;

  EdgeInsets get s3 => _PaddingSize(sidesFlag, sizes.s3).edgeInsets;

  EdgeInsets get s4 => _PaddingSize(sidesFlag, sizes.s4).edgeInsets;

  EdgeInsets get s6 => _PaddingSize(sidesFlag, sizes.s6).edgeInsets;

  EdgeInsets get s8 => _PaddingSize(sidesFlag, sizes.s8).edgeInsets;

  EdgeInsets get s12 => _PaddingSize(sidesFlag, sizes.s12).edgeInsets;

  EdgeInsets get s14 => _PaddingSize(sidesFlag, sizes.s14).edgeInsets;

  EdgeInsets get s16 => _PaddingSize(sidesFlag, sizes.s16).edgeInsets;

  EdgeInsets get s20 => _PaddingSize(sidesFlag, sizes.s20).edgeInsets;

  EdgeInsets get s24 => _PaddingSize(sidesFlag, sizes.s24).edgeInsets;

  EdgeInsets get s32 => _PaddingSize(sidesFlag, sizes.s32).edgeInsets;

  EdgeInsets get s40 => _PaddingSize(sidesFlag, sizes.s40).edgeInsets;

  EdgeInsets get s48 => _PaddingSize(sidesFlag, sizes.s48).edgeInsets;

  EdgeInsets get s56 => _PaddingSize(sidesFlag, sizes.s56).edgeInsets;

  EdgeInsets get s64 => _PaddingSize(sidesFlag, sizes.s64).edgeInsets;

  EdgeInsets get s80 => _PaddingSize(sidesFlag, sizes.s80).edgeInsets;

  EdgeInsets get s96 => _PaddingSize(sidesFlag, sizes.s96).edgeInsets;
}

class _PaddingSidesFlags {
  _PaddingSidesFlags(
    this.leftFlag,
    this.topFlag,
    this.rightFlag,
    this.bottomFlag,
  );

  factory _PaddingSidesFlags.left() =>
      _PaddingSidesFlags(true, false, false, false);

  factory _PaddingSidesFlags.top() =>
      _PaddingSidesFlags(false, true, false, false);

  factory _PaddingSidesFlags.right() =>
      _PaddingSidesFlags(false, false, true, false);

  factory _PaddingSidesFlags.bottom() =>
      _PaddingSidesFlags(false, false, false, true);

  factory _PaddingSidesFlags.x() =>
      _PaddingSidesFlags(true, false, true, false);

  factory _PaddingSidesFlags.y() =>
      _PaddingSidesFlags(false, true, false, true);

  factory _PaddingSidesFlags.all() =>
      _PaddingSidesFlags(true, true, true, true);

  final bool leftFlag;
  final bool topFlag;
  final bool rightFlag;
  final bool bottomFlag;
}

class _PaddingSize {
  _PaddingSize(this.sidesFlag, this.size);

  final _PaddingSidesFlags sidesFlag;
  final double size;

  EdgeInsets get edgeInsets => EdgeInsets.fromLTRB(
        sidesFlag.leftFlag ? size : 0,
        sidesFlag.topFlag ? size : 0,
        sidesFlag.rightFlag ? size : 0,
        sidesFlag.bottomFlag ? size : 0,
      );
}
