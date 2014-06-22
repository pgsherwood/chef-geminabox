# geminabox-cookbook

Installs [Gem In a Box](https://github.com/geminabox/geminabox) ruby gem server and hosts the [Napa](https://github.com/bellycard/napa) gem on it.

## Supported Platforms

Ubuntu 12.04

## Requirements


## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['geminabox']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### geminabox::default

Include `geminabox` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[geminabox::default]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Greg Sherwood (<pgscode@gmail.com>)
