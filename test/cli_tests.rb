class TestSensuCLI < TestCase
  def test_cli_arguments
    options = Sensu::CLI.read([
      '-c', @options[:config_file],
      '-d', @options[:config_dir],
      '-v',
      '-l', '/tmp/sensu_test.log',
      '-p', '/tmp/sensu_test.pid',
      '-b'
    ])
    expected = {
      :config_file => @options[:config_file],
      :config_dir => @options[:config_dir],
      :verbose => true,
      :log_file => '/tmp/sensu_test.log',
      :pid_file => '/tmp/sensu_test.pid',
      :daemonize => true
    }
    assert_equal(expected, options)
    done
  end
end
