const vscode = require('vscode');

function activate(context) {
  // Регистрируем поддержку языка
  const provider = vscode.languages.registerDocumentSemanticTokensProvider(
    { language: 'pas' }, // введите ID вашего языка
    new PascalABCTokenProvider(),
    legend
  );

  context.subscriptions.push(provider);
}

class PascalABCTokenProvider {
  async provideDocumentSemanticTokens(document) {
    // Здесь можно написать логику, которая извлекает символы, операторы и типы из документа
    // и возвращает массив тип "входные данные" для каждого токена.

    return tokens;
  }
}

const legend = new vscode.SemanticTokensLegend(
  [ 'entity.name.program', 'storage.type.variable', 'entity.name.function' ],
  [ 'keyword.operator', 'storage.type' ]
);

exports.activate = activate;
