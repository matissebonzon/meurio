Feature: Create a mobilization
  In order to mobilize people to my cause
  As an user
  I want to create a mobilization

  Background:
    Given there is a organization from "Rio de Janeiro"

  @ssi
  Scenario: when I'm logged in as admin
    Given I'm logged in as admin
    When I go to "new mobilization page"
    Then I should see "the mobilization form"

  @javascript @ssi
  Scenario: when I fill the form correctly
    Given I'm logged in as admin
    And I'm in "new mobilization page"
    And I fill "Nome do Tema" with "Estamos De Guarda no Bondinho de Santa Teresa!"
    And I fill "Título curto" with "De Guarda no Bondinho"
    And I fill "Hashtag" with "DeGuardaNoBondinho"
    And I fill "Descrição" with "O Governo do Estado do Rio de Janeiro está sucateando o patrimônio histórico nacional."
    And I attach an image to "Imagem de fundo"
    And I attach an image to "Thumbnail"
    When I press "Criar Tema"
    And I should be in "the first mobilization page"

  @javascript @ssi
  Scenario: when I don't fill the form correctly
    Given I'm logged in as admin
    And I'm in "new mobilization page"
    When I press "Criar Tema"
    Then I should be in "new mobilization page"
    And I should see "mobilization title field error"
    And I should see "mobilization short title field error"
    And I should see "mobilization hashtag field error"
    And I should see "mobilization description field error"
    And I should see "mobilization image field error"

  @javascript @ssi
  Scenario: when I create a territorial mobilization
    Given I'm logged in as admin
    And I'm in "new mobilization page"
    And I fill "Nome do Tema" with "Estamos De Guarda no Bondinho de Santa Teresa!"
    And I fill "Título curto" with "De Guarda no Bondinho"
    And I fill "Hashtag" with "DeGuardaNoBondinho"
    And I fill "Descrição" with "O Governo do Estado do Rio de Janeiro está sucateando o patrimônio histórico nacional."
    And I check "Território"
    And I attach an image to "Imagem de fundo"
    And I attach an image to "Thumbnail"
    When I press "Criar Tema"
    Then I should be in "the first mobilization page"
    And there should be a territorial mobilization
