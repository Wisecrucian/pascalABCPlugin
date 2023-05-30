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
    const syntaxDefinitionPath = "https://github.com/pascalabcnet/pascalabcnet/blob/master/YMC/Highlighting/Light/lex.xshd";
    const syntaxDefinition = await fs.readFile(syntaxDefinitionPath, { encoding: 'utf-8' });
    const result = await parser.parseStringPromise(syntaxDefinition);

    const colors = result.SyntaxDefinition.Color;

    colors.forEach((color) => {
      const name = color.$.name;
      const foreground = color.$.foreground;
    });

    return tokens;
  }
}

const legend = new vscode.SemanticTokensLegend(
  [ 'entity.name.program', 'storage.type.variable', 'entity.name.function' ],
  [ 'keyword.operator', 'storage.type' ]
);

exports.activate = activate;
