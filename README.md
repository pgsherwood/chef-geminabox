# geminabox-cookbook

Installs [Gem In a Box](https://github.com/geminabox/geminabox) ruby gem server and hosts the [Napa](https://github.com/bellycard/napa) gem on it.

## Supported Platforms

Ubuntu 12.04

## Requirements

###Chef Cookbooks
- [rvm](https://github.com/fnichol/chef-rvm)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['geminabox']['port']</tt></td>
    <td>String</td>
    <td>Port number where the geminabox service listens</td>
    <td><tt>8080</tt></td>
  </tr>
  <tr>
    <td><tt>['geminabox']['conf_dir']</tt></td>
    <td>String</td>
    <td>Directory for geminabox service config files</td>
    <td><tt>/etc/geminabox</tt></td>
  </tr>
    <tr>
    <td><tt>['geminabox']['log_dir']</tt></td>
    <td>String</td>
    <td>Directory for the geminabox service log files</td>
    <td><tt>/var/log/geminabox</tt></td>
  </tr>
  <tr>
    <td><tt>['geminabox']['data_dir']</tt></td>
    <td>String</td>
    <td>Directory for geminabox service data files</td>
    <td><tt>/var/geminabox-data</tt></td>
  </tr>
  <tr>
    <td><tt>['geminabox']['pid_dir']</tt></td>
    <td>String</td>
    <td>Directory for geminabox service PID files</td>
    <td><tt>/var/run/geminabox</tt></td>
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
