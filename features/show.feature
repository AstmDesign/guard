Feature: Show

  In order to know the defined groups and plugins
  As a developer using Guard
  I want to see a table of groups and plugins

  Scenario: Show error when no Guardfile
    When I run `guard show`
    Then the output should match /No Guardfile found, please create one with `guard init`\./
    And the exit status should not be 0

  Scenario: Show error when Guardfile has no plugins
    Given an empty file named "Guardfile"
    When I run `guard show`
    Then the output should match /No Guard plugins found in Guardfile, please add at least one\.$/
    # TODO: this step fails
    # And the exit status should not be 0

  Scenario: Show plugins and their configuration
    Given a file named "Guardfile" with:
    """
    guard :ronn do
    end
    """
    When I run `guard show`
    Then the output should match /^| Default | Ronn\s+ |/