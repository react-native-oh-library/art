#pragma once

#include "RNOH/generated/BaseReactNativeCommunityArtPackage.h"

namespace rnoh {

class RNART : public BaseReactNativeCommunityArtPackage {
    using Super = BaseReactNativeCommunityArtPackage;

public:
    RNART(Package::Context ctx) : Super(ctx) {}
};
} // namespace rnoh