class exitcodes {

  Exec {
    provider  => powershell,
    logoutput => true,
  }

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

}
