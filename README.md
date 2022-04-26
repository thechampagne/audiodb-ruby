# TheAudioDB

[![](https://img.shields.io/github/v/tag/thechampagne/audiodb-ruby?label=version)](https://github.com/thechampagne/audiodb-ruby/releases/latest) [![](https://img.shields.io/github/license/thechampagne/audiodb-ruby)](https://github.com/thechampagne/audiodb-ruby/blob/main/LICENSE)

TheAudioDB API client for **Ruby**.

### Download
[RubyGems](https://rubygems.org/gems/audiodb)

```
gem install audiodb
```

### Example

```ruby
require 'audiodb'

puts AudioDB::search_albums_by_artist_id(111674)
```

### License

TheAudioDB API client is released under the [Apache License 2.0](https://github.com/thechampagne/audiodb-ruby/blob/main/LICENSE).

```
 Copyright 2022 XXIV

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
```