class exitcodes {

  Exec {
    provider  => powershell,
    logoutput => true,
  }

  # straight commands
  exec {'exit 0 command - should pass':
    command   => 'exit 0',
  }

  exec {'exit 1 command - should fail':
    command   => 'exit 1',
  }

  exec {'throw error command - should fail':
    command   => 'throw "This is an error"',
  }

  exec {'write error command - should pass':
    command   => 'Write-Error "This is an error"',
  }

  exec {'write warning command - should pass':
    command   => 'Write-Warning "This is a warning"',
  }

  exec {'write output command - should pass':
    command   => 'Write-Output "This is output"',
  }

  exec {'write host command - should pass':
    command   => 'Write-Host "This is host"',
  }

  exec {'write verbose command - should pass':
    command   => 'Write-Verbose "This is verbose"',
  }

  exec {'write debug command - should pass':
    command   => 'Write-Debug "This is debug"',
  }

  exec {'empty command - should run':
    command   => '',
  }

  exec {'exit 0 file - should pass':
    command   => file('exitcodes/exit_0.ps1'),
  }

  exec {'exit 1 file - should fail':
    command   => file('exitcodes/exit_1.ps1'),
  }

  exec {'throw error file - should fail':
    command   => file('exitcodes/throw_error.ps1'),
  }

  exec {'write error file - should pass':
    command   => file('exitcodes/write_error.ps1'),
  }

  exec {'write warning file - should pass':
    command   => file('exitcodes/write_warning.ps1'),
  }

  exec {'write output file - should pass':
    command   => file('exitcodes/write_output.ps1'),
  }

  exec {'write host file - should pass':
    command   => file('exitcodes/write_host.ps1'),
  }

  exec {'write verbose file - should pass':
    command   => file('exitcodes/write_verbose.ps1'),
  }

  exec {'write debug file - should pass':
    command   => file('exitcodes/write_debug.ps1'),
  }

  exec {'write error template - should pass':
    command   => template('exitcodes/write_error.ps1'),
  }

  exec {'write warning template - should pass':
    command   => template('exitcodes/write_warning.ps1'),
  }

  exec {'write output template - should pass':
    command   => template('exitcodes/write_output.ps1'),
  }

  exec {'write host template - should pass':
    command   => template('exitcodes/write_host.ps1'),
  }

  exec {'write verbose template - should pass':
    command   => template('exitcodes/write_verbose.ps1'),
  }

  exec {'write debug template - should pass':
    command   => template('exitcodes/write_debug.ps1'),
  }

  # only if
  exec {'only if exit 0 command - should run':
    command   => 'Write-Output "I should run"',
    onlyif    => 'exit 0'
  }

  exec {'only if exit 1 command - should not run':
    command   => 'Write-Output "I should not run"',
    onlyif    => 'exit 1',
  }

  exec {'only if throw error command - should not run':
    command   => 'Write-Output "I should not run"',
    onlyif    => 'throw "This is an error"',
  }

  exec {'only if write error command - should run':
    command   => 'Write-Output "I should run"',
    onlyif    => 'Write-Error "This is an error"',
  }

  exec {'only if empty command - should run':
    command   => 'Write-Output "I should run"',
    onlyif    => '',
  }

  exec {'only if exit 0 file - should run':
    command   => 'Write-Output "I should run"',
    onlyif    => file('exitcodes/exit_0.ps1'),
  }

  exec {'only if exit 1 file - should not run':
    command   => 'Write-Output "I should not run"',
    onlyif    => file('exitcodes/exit_1.ps1'),
  }

  exec {'only if throw error file - should not run':
    command   => 'Write-Output "I should not run"',
    onlyif    => file('exitcodes/throw_error.ps1'),
  }

  exec {'only if write error file - should run':
    command   => 'Write-Output "I should run"',
    onlyif    => file('exitcodes/write_error.ps1'),
  }

  # unless
  exec {'unless exit 0 command - should not run':
    command   => 'Write-Output "I should not run"',
    unless    => 'exit 0'
  }

  exec {'unless exit 1 command - should run':
    command   => 'Write-Output "I should run"',
    unless    => 'exit 1',
  }

  exec {'unless throw error command - should run':
    command   => 'Write-Output "I should run"',
    unless    => 'throw "This is an error"',
  }

  exec {'unless write error command - should not run':
    command   => 'Write-Output "I should not run"',
    unless    => 'Write-Error "This is an error"',
  }

  exec {'unless empty command - should not run':
    command   => 'Write-Output "I should not run"',
    unless    => '',
  }

  exec {'unless exit 0 file - should not run':
    command   => 'Write-Output "I should not run"',
    unless    => file('exitcodes/exit_0.ps1'),
  }

  exec {'unless exit 1 file - should run':
    command   => 'Write-Output "I should run"',
    unless    => file('exitcodes/exit_1.ps1'),
  }

  exec {'unless throw error file - should run':
    command   => 'Write-Output "I should run"',
    unless    => file('exitcodes/throw_error.ps1'),
  }

  exec {'unless write error file - should not run':
    command   => 'Write-Output "I should not run"',
    unless    => file('exitcodes/write_error.ps1'),
  }


  # random other tests
  exec {'sleep command with timeout - should fail':
    command   => 'Write-Host "Going to sleep now..."; Start-Sleep 50',
    timeout   => 2,
  }

  exec {'sleep command with timeout retries - should fail':
    command   => 'Write-Host "Going to sleep now..."; Start-Sleep 50',
    timeout   => 2,
    tries     => 2,
    try_sleep => 1,
  }

  exec {'throw error command with returns 1 - should pass':
    command   => 'throw "This is an error"',
    returns   => [1],
  }
}
