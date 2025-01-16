/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @flow
 */

import {default as Transform} from 'art/core/transform';
import {default as Path} from './ARTSerializablePath';
import {default as Surface} from './Surface';
import {default as Group} from './Group';
import {default as Shape} from './Shape';
import {default as Text} from './Text';
import {default as ClippingRectangle} from './ClippingRectangle';
import {default as LinearGradient} from './LinearGradient';
import {default as RadialGradient} from './RadialGradient';
import {default as Pattern} from './Pattern';

const ART = {
    LinearGradient: LinearGradient,
    RadialGradient: RadialGradient,
    Pattern: Pattern,
    Transform: Transform,
    Path: Path,
    Surface: Surface,
    Group: Group,
    ClippingRectangle: ClippingRectangle,
    Shape: Shape,
    Text: Text,
  };

export {
    ART,
    Transform,
    Path,
    Surface,
    Group,
    Shape,
    Text,
    ClippingRectangle,
    LinearGradient,
    RadialGradient,
    Pattern,
};
console.log('%c  LinearGradient:', 'color: #0e93e0;background: #aaefe5;', LinearGradient);



