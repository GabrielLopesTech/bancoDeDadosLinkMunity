/* DER - LinkMunity: */

CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    nomeUsuario VARCHAR(100),
    nomeExibicaoUsuario VARCHAR(100),
    emailUsuario VARCHAR(155),
    senhaUsuario VARCHAR(255),
    dataNascimentoUsuario DATE,
    generoUsuario VARCHAR(20),
    fotoPerfilUsuario VARCHAR(255),
    bioUsuario TEXT,
    bairroUsuario TEXT,
    cidadeUsuario TEXT,
    estadoUsuario TEXT,
    dataCadastroUsuario DATE,
    ultimoLoginUsuario TIMESTAMP,
    statusContaUsuario CHAR(3),
    tipoUsuarioUsuario VARCHAR(100),
    telefoneUsuario CHAR(11),
    cpfUsuario CHAR(11),
    dataUltimaAtualizacaoUsuario TIMESTAMP,
    privacidadePerfilUsuario VARCHAR(255),
    idiomaPreferidoUsuario VARCHAR(100),
    linkSitePessoalUsuario VARCHAR(255),
    verificadoUsuario VARCHAR(100),
    termosAceitoUsuarios VARCHAR(255),
    notificacoesEmailUsuario TEXT,
    tokenRecuperacaoDeSenhaUsuario TEXT,
    ultimoIpUsuario VARCHAR(100),
    faixaEtariaUsuario INT,
    idLoginEmpresarial INT,
    razaoSocialLoginEmpresarial TEXT,
    nomeFantasiaLoginEmpresarial VARCHAR(100),
    cnpjLoginEmpresarial CHAR(14),
    tipoEmpresaLoginEmpresarial VARCHAR(155),
    siteLoginEmpresarial VARCHAR(255),
    horarioFuncionamentoLoginEmpresarial TIME,
    descricaoServicosLoginEmpresarial TEXT,
    verificadoEmpresaLoginEmpresarial CHAR(3),
    avaliacoesLoginEmpresarial VARCHAR(100),
    apelidoLoginCasual VARCHAR(100),
    ocupacaoLoginCasual VARCHAR(255),
    interessesLoginCasual VARCHAR(255),
    participaEmGruposLoginCasual VARCHAR(255),
    nivelEngajamentoLoginCasual VARCHAR(255),
    idLoginCasual INT,
    UNIQUE (cpfUsuario, idLoginEmpresarial, cnpjLoginEmpresarial, idLoginCasual)
);

CREATE TABLE Informacao (
    idInformacao INT PRIMARY KEY,
    idUsuarioInformacao INT,
    tituloInformacao VARCHAR(255),
    conteudoInformacao TEXT,
    dataPublicacaoInformacao DATE,
    tagInformacao VARCHAR(255),
    bairroDestinoInformacao VARCHAR(255),
    visivelParaInformacao VARCHAR(255),
    anexosInformacao VARCHAR(255),
    statusInformacao VARCHAR(255),
    foiEditadaInformacao VARCHAR(255),
    numeroCurtidasInformacao DOUBLE,
    numeroComentariosInformacao DOUBLE,
    importanteInformacao VARCHAR(255),
    validadeInformacao DATE,
    tipoEventoInformacao VARCHAR(255),
    hashtagsInformacao VARCHAR(255),
    privacidadeComentariosInformacao VARCHAR(255),
    UNIQUE (idInformacao, idUsuarioInformacao)
);

CREATE TABLE Login (
    idLogin INT PRIMARY KEY,
    idUsuarioLogin INT,
    dataHoraLogin DATE,
    ipOrigemLogin DOUBLE,
    dispositivoLogin VARCHAR(255),
    navegadorLogin VARCHAR(255),
    sistemaOperacionalLogin VARCHAR(255),
    sucessoLogin VARCHAR(255),
    tentativaFalhaMotivoLogin VARCHAR(255),
    tokenSessaoLogin VARCHAR(255),
    geolocalizacaoLogin VARCHAR(255),
    confirmadoPorEmailLogin TEXT,
    doisFatoresAtivadoLogin VARCHAR(255),
    codigoVerificacaoLogin INT,
    expiracaoTokenLogin VARCHAR(255),
    fk_Cadastro_idCadastro INT,
    fk_Cadastro_idUsuarioCadastro INT,
    fk_Cadastro_ipOrigemCadastro INT,
    UNIQUE (idLogin, idUsuarioLogin, ipOrigemLogin, fk_Cadastro_idCadastro, fk_Cadastro_idUsuarioCadastro, fk_Cadastro_ipOrigemCadastro)
);

CREATE TABLE Cadastro (
    idCadastro INT PRIMARY KEY,
    idUsuarioCadastro INT,
    dataCadastro DATE,
    emailCadastro VARCHAR(255),
    senhaCadastro VARCHAR(20),
    ipOrigemCadastro DOUBLE,
    dispositivoOrigemCadastro VARCHAR(100),
    confirmadoEmailCadastro VARCHAR(255),
    codigoConfirmacaoCadastro INT,
    dataConfirmacaoCadastro DATE,
    tokenAtivacaoCadastro INT,
    statusCadastro VARCHAR(255),
    tentativasFalhasCadastro INT,
    origemCadastro VARCHAR(255),
    hashVerificacaoCadastro VARCHAR(255),
    politicasAceitasCadastro VARCHAR(255),
    dataUltimaAtualizacaoCadastro DATE,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT,
    UNIQUE (idUsuarioCadastro, idCadastro, fk_Usuario_idUsuario, fk_Usuario_idLoginEmpresarial, fk_Usuario_idLoginCasual)
);

CREATE TABLE Amizade (
    idAmizade INT PRIMARY KEY,
    bairroAmizade VARCHAR(255),
    nomeAmizade VARCHAR(255),
    grupoEmComumAmizade VARCHAR(155),
    amigoEmComunAmizade VARCHAR(255),
    statusAmizade VARCHAR(255),
    chatAmizade TEXT,
    idPrimeiroUsuarioAmizade INT,
    idSegundoUsuarioAmizade INT,
    dataSolicitacaoAmizade DATE,
    dataConfirmacaoAmizade DATE,
    bloqueadoPorAmizade VARCHAR(255),
    origemPedidoAmizade VARCHAR(255),
    mensagensHabilitadasAmizade VARCHAR(255),
    notificacaoAmizade VARCHAR(255),
    UNIQUE (idAmizade, idPrimeiroUsuarioAmizade, idSegundoUsuarioAmizade)
);

CREATE TABLE Mensagem (
    idMensagem INT PRIMARY KEY,
    idRemetenteMensagem INT,
    idDestinatarioMensagem INT,
    conteudoMensagem VARCHAR(255),
    dataEnvioMensagem DATE,
    lidaMensagem VARCHAR(255),
    dataLeituraMensagem DATE,
    tipoMensagem TEXT,
    arquivoAnexoMensagem VARCHAR(255),
    statusMensagem VARCHAR(255),
    respostaDeMensagem TEXT,
    editadaMensagem VARCHAR(255),
    dataEdicaoMensagem DATE,
    reacoesMensagem VARCHAR(255),
    visivelParaRemetenteMensagem VARCHAR(255),
    visivelParaDestinatarioMensagem VARCHAR(255),
    UNIQUE (idMensagem, idRemetenteMensagem, idDestinatarioMensagem)
);

CREATE TABLE Notificacao (
    idNotificacao INT PRIMARY KEY,
    idUsuarioNotificacao INT,
    tipoNotificacao VARCHAR(255),
    mensagemNotificacao VARCHAR(255),
    lidaNotificacao VARCHAR(100),
    dataHoraNotificacao DATE,
    urlDestinoNotificacao VARCHAR(255),
    prioridadeNotificacao VARCHAR(255),
    iconeNotificacao VARCHAR(255),
    enviadaPorSistemaNotificacao VARCHAR(255),
    idOrigemNotificacao INT,
    exibidaNotificacao VARCHAR(255),
    curtidaNotificacao VARCHAR(255),
    comentarioNotificacao TEXT,
    mensagemNotificacao VARCHAR(255),
    solicitacaoAmizadeNotificacao VARCHAR(255),
    confirmacaoEventoNotificacao VARCHAR(255),
    conviteGrupoNotificacao VARCHAR(255),
    alertaSegurancaNotificacao VARCHAR(255),
    atualizacaoSistemaNotificacao VARCHAR(255),
    UNIQUE (idNotificacao, idUsuarioNotificacao, idOrigemNotificacao)
);

CREATE TABLE Reacao (
    idReacao INT PRIMARY KEY,
    idUsuarioReacao INT,
    idPostagemReacao INT,
    tipoReacao VARCHAR(255),
    dataReacao DATE,
    UNIQUE (idReacao, idUsuarioReacao, idPostagemReacao)
);

CREATE TABLE Tag (
    eventosTag VARCHAR(255),
    noticiasTag TEXT,
    promocaoTag TEXT,
    tagCriadaTag VARCHAR(255),
    idTag INT PRIMARY KEY,
    bairroTag VARCHAR(255),
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT,
    UNIQUE (idTag, fk_Postagem_idUsuarioPostagem, fk_Postagem_idPostagem, fk_Postagem_idGrupoPostagem)
);

CREATE TABLE Calendario (
    idCalendario INT PRIMARY KEY,
    idUsuarioCalendario INT,
    nomeCalendario VARCHAR(255),
    descricaoCalendario TEXT,
    corCalendario VARCHAR(100),
    privadoCalendario VARCHAR(255),
    dataCriacaoCalendario VARCHAR(255),
    dataUltimaEdicaoCalendario TIMESTAMP,
    ativoCalendario VARCHAR(255),
    tipoCalendario VARCHAR(255),
    compartilhadoComCalendario VARCHAR(255),
    permissaoEdicaoCalendario VARCHAR(255),
    notificacoesAtivasCalendario VARCHAR(255),
    sincronizadoComCalendario VARCHAR(255),
    localAssociadoCalendario VARCHAR(255),
    UNIQUE (idCalendario, idUsuarioCalendario)
);

CREATE TABLE HorarioOnibus (
    idHorariosOnibus INT PRIMARY KEY,
    idLinhaHorariosOnibus INT,
    idPontoHorariosOnibus INT,
    horaPartidaHorariosOnibus TIME,
    horaChegadaHorariosOnibus TIME,
    diaSemanaHorariosOnibus DATE,
    tipoServicoHorariosOnibus VARCHAR(255),
    ativoHorariosOnibus TIME,
    frequenciaMinutosHorariosOnibus TIME,
    observacoesHorariosOnibus TEXT,
    origemHorariosOnibus VARCHAR(255),
    destinoHorariosOnibus VARCHAR(255),
    tempoEstimadoViagemHorariosOnibus TIME,
    ultimaAtualizacaoHorariosOnibus TIME,
    UNIQUE (idHorariosOnibus, idLinhaHorariosOnibus, idPontoHorariosOnibus)
);

CREATE TABLE Postagem (
    idPostagem INT PRIMARY KEY,
    idUsuarioPostagem INT,
    conteudoPostagem VARCHAR(255),
    imagemUrlPostagem VARCHAR(255),
    videoUrlPostagem VARCHAR(255),
    dataPostagemPostagem DATE,
    localizacaoPostagem VARCHAR(255),
    visibilidadePostagem VARCHAR(255),
    tipoPostagemPostagem VARCHAR(255),
    curtidasPostagem VARCHAR(255),
    comentariosPostagem TEXT,
    compartilhamentosPostagem VARCHAR(255),
    fixadoPostagem TEXT,
    editadoPostagem VARCHAR(255),
    dataUltimaEdicaoPostagem TIMESTAMP,
    statusPostagem CHAR(11),
    idGrupoPostagem INT,
    TagsPostagem VARCHAR(255),
    enqueteOpcoesPostagem TEXT,
    avaliacaoPostagem VARCHAR(255),
    anexosPostagem VARCHAR(255),
    UNIQUE (idUsuarioPostagem, idGrupoPostagem)
);

CREATE TABLE Comentario (
    idComentario INT PRIMARY KEY,
    idUsuarioComentario INT,
    idPostagemComentario INT,
    conteudoComentario TEXT,
    dataCriacaoComentario DATE,
    editadoComentario VARCHAR(255),
    dataEdicaoComentario DATE,
    curtidasComentario INT,
    statusComentario VARCHAR(255),
    fixadoComentario VARCHAR(255),
    anexoUrlComentario VARCHAR(255),
    mencoesComentario TEXT,
    palavrasChaveComentario VARCHAR(255),
    moderadoPorComentario VARCHAR(255),
    UNIQUE (idPostagemComentario, idUsuarioComentario)
);

CREATE TABLE Perfil (
    idPerfil INT PRIMARY KEY,
    idUsuarioPerfil INT,
    tipoPerfil VARCHAR(255),
    dataCriacaoPerfil DATE,
    ativoPerfil VARCHAR(155),
    idPerfilAdm INT,
    idUsuarioPerfilAdm INT,
    nivelAcessoPerfilAdm VARCHAR(155),
    dataPromocaoPerfilAdm DATE,
    ativoPerfilAdm VARCHAR(155),
    responsavelPorBairrosPerfilAdm VARCHAR(255),
    podeBloquearUsuariosPerfilAdm VARCHAR(155),
    idPerfilComum INT,
    idUsuarioPerfilComum INT,
    nivelParticipacaoPerfilComum VARCHAR(155),
    verificadoBairroPerfilComum VARCHAR(155),
    participaEventosPerfilComum VARCHAR(155),
    UNIQUE (idPerfil, idUsuarioPerfil, idPerfilAdm, idUsuarioPerfilAdm, idPerfilComum, idUsuarioPerfilComum)
);

CREATE TABLE Configuracao (
    idConfiguracao INT PRIMARY KEY,
    idUsuarioconfiguracao INT,
    temaConfiguracao VARCHAR(255),
    notificacoesConfiguracao VARCHAR(255),
    privacidadeConfiguracao VARCHAR(155),
    idiomaConfiguracao VARCHAR(255),
    receberEmailConfiguracao VARCHAR(155),
    localizacaoConfiguracao VARCHAR(255),
    restricaoConteudoConfiguracao VARCHAR(255),
    acessibilidadeConfiguracao VARCHAR(255),
    somNotificacoesConfiguracao VARCHAR(255),
    vibrarNotificacoesConfiguracao VARCHAR(255),
    UNIQUE (idConfiguracao, idUsuarioconfiguracao)
);

CREATE TABLE Denuncia (
    idDenucia INT PRIMARY KEY UNIQUE,
    perfilrecebedorDenuncia VARCHAR(155),
    perfilemissorDenuncia VARCHAR(155),
    tipoDenuncia VARCHAR(255),
    validadorDenuncia VARCHAR(255)
);

CREATE TABLE Midia (
    idMidia INT PRIMARY KEY,
    idUsuarioMidia INT,
    idPostagemMidia INT,
    tipoMidia VARCHAR(255),
    urlArquivoMidia VARCHAR(255),
    nomeArquivoOriginalMidia VARCHAR(255),
    tamanhoMidia DOUBLE,
    formatoMidia VARCHAR(255),
    descricaoMidia TEXT,
    dataEnvioMidia DATE,
    visivelMidia VARCHAR(255),
    duracaoMidia TIME,
    larguraMidia DOUBLE,
    alturaMidia DOUBLE,
    miniaturaUrlMidia VARCHAR(255),
    reacoesMidia VARCHAR(255),
    moderadoMidia VARCHAR(255),
    motivoRemocaoMidia TEXT,
    compartilhavelMidia VARCHAR(255),
    UNIQUE (idPostagemMidia, idUsuarioMidia, idMidia)
);

CREATE TABLE Bairro (
    idBairro INT PRIMARY KEY,
    localizacaoBairro VARCHAR(255),
    quantidadeDePessoasBairro INT,
    comercioBairro VARCHAR(255),
    eventosBairro VARCHAR(255),
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT,
    UNIQUE (idBairro, fk_Usuario_idLoginEmpresarial, fk_Usuario_idLoginCasual, fk_Usuario_idUsuario)
);

CREATE TABLE Banimento (
    idBanimento INT PRIMARY KEY,
    motivoBanimento TEXT,
    idAdmBanimento INT,
    idbanidoBanimento INT,
    dadosContaBanimento VARCHAR(255),
    UNIQUE (idBanimento, idAdmBanimento, idbanidoBanimento)
);

CREATE TABLE Metrica (
    idMetrica INT PRIMARY KEY,
    idUsuarioMetrica INT,
    tipoMetrica VARCHAR(100),
    valorMetrica DOUBLE,
    dataMetrica DATE,
    descricaoMetrica TEXT,
    origemDispositivoMetrica VARCHAR(100),
    localizacaoMetrica TEXT,
    tempoNaPlataformaMetrica TIME,
    paginaVisitadaMetrica TIMESTAMP,
    quantidadeAcoesMetrica INT,
    eventoPersonalizadoMetrica TEXT,
    dispositivoMetrica VARCHAR(255),
    sistemaOperacionalMetrica VARCHAR(255),
    ipUsuarioMetrica INT,
    UNIQUE (idMetrica, idUsuarioMetrica, ipUsuarioMetrica)
);

CREATE TABLE Feedback (
    idFeedback INT PRIMARY KEY,
    idUsuarioFeedback INT,
    tipoFeedback VARCHAR(155),
    mensagemFeedback TEXT,
    dataEnvioFeedback DATE,
    statusFeedback VARCHAR(255),
    respostaAdminFeedback TEXT,
    dataRespostaFeedback DATE,
    prioridadeFeedback VARCHAR(155),
    origemFeedback VARCHAR(255),
    anexoUrlFeedback VARCHAR(255),
    UNIQUE (idFeedback, idUsuarioFeedback)
);

CREATE TABLE Assinatura (
    idAssinatura INT PRIMARY KEY,
    idUsuarioAssinatura INT,
    tipoAssinatura VARCHAR(255),
    dataInicioAssinatura DATE,
    dataFimAssinatura DATE,
    statusAssinatura VARCHAR(255),
    renovacaoAutomaticaAssinatura VARCHAR(255),
    formaPagamentoAssinatura VARCHAR(255),
    valorAssinatura REAL,
    beneficiosAssinatura TEXT,
    limiteUsoAssinatura INT,
    canceladaEmAssinatura VARCHAR(255),
    UNIQUE (idAssinatura, idUsuarioAssinatura)
);

CREATE TABLE FormaDePagamento (
    idFormaDePagamento INT PRIMARY KEY,
    creditoFormaDePagamento CHAR(1),
    debitoFormaDePagamento CHAR(1),
    pixFormaDePagamento VARCHAR(255),
    boletoFormaDePagamento VARCHAR(255),
    transacaoBancariaFormaDePagamento VARCHAR(255),
    notaFiscalFormaDePagamento VARCHAR(255)
);

CREATE TABLE LinkCurto (
    idLinkCurto INT PRIMARY KEY UNIQUE,
    duracaoLinkCurto TIME,
    dataLinkCurto DATE,
    midiaLinkCurto VARCHAR(255)
);

CREATE TABLE Beneficio (
    idBeneficio INT PRIMARY KEY UNIQUE,
    nomeBeneficio VARCHAR(255),
    descricaoBeneficio TEXT,
    tipoBeneficio VARCHAR(255),
    dataInicioBeneficio DATE,
    dataFimBeneficio DATE,
    bairroDestinoBeneficio VARCHAR(255),
    parceiroResponsavelBeneficio VARCHAR(155),
    ativoBeneficio VARCHAR(255),
    quantidadeDisponivelBeneficio INT,
    regrasBeneficio TEXT,
    usadoPorBeneficio VARCHAR(255),
    dataCadastroBeneficio DATE,
    ultimaAtualizacaoBeneficio VARCHAR(255)
);

CREATE TABLE Conectar (
    fk_Login_idLogin INT,
    fk_Login_idUsuarioLogin INT,
    fk_Login_ipOrigemLogin INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Gerenciar (
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT,
    fk_Amizade_idAmizade INT,
    fk_Amizade_idPrimeiroUsuarioAmizade INT,
    fk_Amizade_idSegundoUsuarioAmizade INT
);

CREATE TABLE Reagir (
    fk_Reacao_idReacao INT,
    fk_Reacao_idUsuarioReacao INT,
    fk_Reacao_idPostagemReacao INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Mandar (
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT,
    fk_Mensagem_idMensagem INT,
    fk_Mensagem_idRemetenteMensagem INT,
    fk_Mensagem_idDestinatarioMensagem INT
);

CREATE TABLE receber (
    fk_Amizade_idAmizade INT,
    fk_Amizade_idPrimeiroUsuarioAmizade INT,
    fk_Amizade_idSegundoUsuarioAmizade INT,
    fk_Mensagem_idMensagem INT,
    fk_Mensagem_idRemetenteMensagem INT,
    fk_Mensagem_idDestinatarioMensagem INT
);

CREATE TABLE Exibir (
    fk_HorarioOnibus_idHorariosOnibus INT,
    fk_HorarioOnibus_idLinhaHorariosOnibus INT,
    fk_HorarioOnibus_idPontoHorariosOnibus INT,
    fk_Informacao_idInformacao INT,
    fk_Informacao_idUsuarioInformacao INT
);

CREATE TABLE Receber (
    fk_Notificacao_idNotificacao INT,
    fk_Notificacao_idUsuarioNotificacao INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE notificar (
    fk_Notificacao_idNotificacao INT,
    fk_Notificacao_idUsuarioNotificacao INT,
    fk_Informacao_idInformacao INT,
    fk_Informacao_idUsuarioInformacao INT
);

CREATE TABLE Lembrar (
    fk_Calendario_idCalendario INT,
    fk_Calendario_idUsuarioCalendario INT,
    fk_Informacao_idInformacao INT,
    fk_Informacao_idUsuarioInformacao INT
);

CREATE TABLE Selecionar (
    fk_Tag_idTag INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Postar (
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Comentar (
    fk_Comentario_idComentario INT,
    fk_Comentario_idUsuarioComentario INT,
    fk_Comentario_idPostagemComentario INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Exibir (
    fk_Comentario_idComentario INT,
    fk_Comentario_idUsuarioComentario INT,
    fk_Comentario_idPostagemComentario INT,
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT
);

CREATE TABLE Estilizar (
    fk_Perfil_idPerfil INT,
    fk_Perfil_idUsuarioPerfil INT,
    fk_Perfil_idPerfilAdm INT,
    fk_Perfil_idUsuarioPerfilAdm INT,
    fk_Perfil_idPerfilComum INT,
    fk_Perfil_idUsuarioPerfilComum INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Configurar (
    fk_Configuracao_idConfiguracao INT,
    fk_Configuracao_idUsuarioconfiguracao INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Colocar (
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT,
    fk_Midia_idMidia INT,
    fk_Midia_idUsuarioMidia INT,
    fk_Midia_idPostagemMidia INT
);

CREATE TABLE Atribuir (
    fk_Midia_idMidia INT,
    fk_Midia_idUsuarioMidia INT,
    fk_Midia_idPostagemMidia INT,
    fk_Informacao_idInformacao INT,
    fk_Informacao_idUsuarioInformacao INT
);

CREATE TABLE Administrar (
    fk_Banimento_idBanimento INT,
    fk_Banimento_idAdmBanimento INT,
    fk_Banimento_idbanidoBanimento INT,
    fk_Perfil_idPerfil INT,
    fk_Perfil_idUsuarioPerfil INT,
    fk_Perfil_idPerfilAdm INT,
    fk_Perfil_idUsuarioPerfilAdm INT,
    fk_Perfil_idPerfilComum INT,
    fk_Perfil_idUsuarioPerfilComum INT
);

CREATE TABLE Dar (
    fk_Feedback_idFeedback INT,
    fk_Feedback_idUsuarioFeedback INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Fazer (
    fk_Metrica_idMetrica INT,
    fk_Metrica_idUsuarioMetrica INT,
    fk_Metrica_ipUsuarioMetrica INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Adquirir (
    fk_Assinatura_idAssinatura INT,
    fk_Assinatura_idUsuarioAssinatura INT,
    fk_FormaDePagamento_idFormaDePagamento INT
);

CREATE TABLE Escolhe (
    fk_FormaDePagamento_idFormaDePagamento INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT
);

CREATE TABLE Denunciar_Denuncia_Usuario_Postagem (
    fk_Denuncia_idDenucia INT,
    fk_Usuario_idUsuario INT,
    fk_Usuario_idLoginEmpresarial INT,
    fk_Usuario_idLoginCasual INT,
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT
);

CREATE TABLE Ganhar (
    fk_Beneficio_idBeneficio INT,
    fk_Assinatura_idAssinatura INT,
    fk_Assinatura_idUsuarioAssinatura INT
);

CREATE TABLE Linkar (
    fk_LinkCurto_idLinkCurto INT,
    fk_Postagem_idPostagem INT,
    fk_Postagem_idUsuarioPostagem INT,
    fk_Postagem_idGrupoPostagem INT
);
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (fk_Cadastro_idCadastro) REFERENCES Cadastro (idCadastro)
    ON DELETE RESTRICT;
 
ALTER TABLE Cadastro ADD CONSTRAINT FK_Cadastro_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Tag ADD CONSTRAINT FK_Tag_2
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_1
    FOREIGN KEY (fk_Login_idLogin) REFERENCES Login (idLogin)
    ON DELETE RESTRICT;
 
ALTER TABLE Conectar ADD CONSTRAINT FK_Conectar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Gerenciar ADD CONSTRAINT FK_Gerenciar_1
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE RESTRICT;
 
ALTER TABLE Gerenciar ADD CONSTRAINT FK_Gerenciar_2
    FOREIGN KEY (fk_Amizade_idAmizade) REFERENCES Amizade (idAmizade)
    ON DELETE SET NULL;
 
ALTER TABLE Reagir ADD CONSTRAINT FK_Reagir_1
    FOREIGN KEY (fk_Reacao_idReacao) REFERENCES Reacao (idReacao)
    ON DELETE SET NULL;
 
ALTER TABLE Reagir ADD CONSTRAINT FK_Reagir_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Mandar ADD CONSTRAINT FK_Mandar_1
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Mandar ADD CONSTRAINT FK_Mandar_2
    FOREIGN KEY (fk_Mensagem_idMensagem) REFERENCES Mensagem (idMensagem)
    ON DELETE SET NULL;
 
ALTER TABLE receber ADD CONSTRAINT FK_receber_1
    FOREIGN KEY (fk_Amizade_idAmizade) REFERENCES Amizade (idAmizade)
    ON DELETE SET NULL;
 
ALTER TABLE receber ADD CONSTRAINT FK_receber_2
    FOREIGN KEY (fk_Mensagem_idMensagem) REFERENCES Mensagem (idMensagem)
    ON DELETE SET NULL;
 
ALTER TABLE Exibir ADD CONSTRAINT FK_Exibir_1
    FOREIGN KEY (fk_HorarioOnibus_idHorariosOnibus) REFERENCES HorarioOnibus (idHorariosOnibus)
    ON DELETE RESTRICT;
 
ALTER TABLE Exibir ADD CONSTRAINT FK_Exibir_2
    FOREIGN KEY (fk_Informacao_idInformacao) REFERENCES Informacao (idInformacao)
    ON DELETE SET NULL;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_1
    FOREIGN KEY (fk_Notificacao_idNotificacao) REFERENCES Notificacao (idNotificacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Receber ADD CONSTRAINT FK_Receber_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE notificar ADD CONSTRAINT FK_notificar_1
    FOREIGN KEY (fk_Notificacao_idNotificacao) REFERENCES Notificacao (idNotificacao)
    ON DELETE RESTRICT;
 
ALTER TABLE notificar ADD CONSTRAINT FK_notificar_2
    FOREIGN KEY (fk_Informacao_idInformacao) REFERENCES Informacao (idInformacao)
    ON DELETE SET NULL;
 
ALTER TABLE Lembrar ADD CONSTRAINT FK_Lembrar_1
    FOREIGN KEY (fk_Calendario_idCalendario) REFERENCES Calendario (idCalendario)
    ON DELETE SET NULL;
 
ALTER TABLE Lembrar ADD CONSTRAINT FK_Lembrar_2
    FOREIGN KEY (fk_Informacao_idInformacao) REFERENCES Informacao (idInformacao)
    ON DELETE SET NULL;
 
ALTER TABLE Selecionar ADD CONSTRAINT FK_Selecionar_1
    FOREIGN KEY (fk_Tag_idTag)
    REFERENCES Tag (idTag)
    ON DELETE SET NULL;
 
ALTER TABLE Selecionar ADD CONSTRAINT FK_Selecionar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Postar ADD CONSTRAINT FK_Postar_1
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE RESTRICT;
 
ALTER TABLE Postar ADD CONSTRAINT FK_Postar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Comentar ADD CONSTRAINT FK_Comentar_1
    FOREIGN KEY (fk_Comentario_idComentario) REFERENCES Comentario (idComentario)
    ON DELETE SET NULL;
 
ALTER TABLE Comentar ADD CONSTRAINT FK_Comentar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Exibir ADD CONSTRAINT FK_Exibir_1
    FOREIGN KEY (fk_Comentario_idComentario) REFERENCES Comentario (idComentario)
    ON DELETE SET NULL;
 
ALTER TABLE Exibir ADD CONSTRAINT FK_Exibir_2
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE SET NULL;
 
ALTER TABLE Estilizar ADD CONSTRAINT FK_Estilizar_1
    FOREIGN KEY (fk_Perfil_idPerfil) REFERENCES Perfil (idPerfil)
    ON DELETE SET NULL;
 
ALTER TABLE Estilizar ADD CONSTRAINT FK_Estilizar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Configurar ADD CONSTRAINT FK_Configurar_1
    FOREIGN KEY (fk_Configuracao_idConfiguracao) REFERENCES Configuracao (idConfiguracao)
    ON DELETE SET NULL;
 
ALTER TABLE Configurar ADD CONSTRAINT FK_Configurar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Colocar ADD CONSTRAINT FK_Colocar_1
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE SET NULL;
 
ALTER TABLE Colocar ADD CONSTRAINT FK_Colocar_2
    FOREIGN KEY (fk_Midia_idMidia) REFERENCES Midia (idMidia)
    ON DELETE SET NULL;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_1
    FOREIGN KEY (fk_Midia_idMidia) REFERENCES Midia (idMidia)
    ON DELETE SET NULL;
 
ALTER TABLE Atribuir ADD CONSTRAINT FK_Atribuir_2
    FOREIGN KEY (fk_Informacao_idInformacao) REFERENCES Informacao (idInformacao)
    ON DELETE SET NULL;
 
ALTER TABLE Administrar ADD CONSTRAINT FK_Administrar_1
    FOREIGN KEY (fk_Banimento_idBanimento) REFERENCES Banimento (idBanimento)
    ON DELETE RESTRICT;
 
ALTER TABLE Administrar ADD CONSTRAINT FK_Administrar_2
    FOREIGN KEY (fk_Perfil_idPerfil) REFERENCES Perfil (idPerfil)
    ON DELETE SET NULL;
 
ALTER TABLE Dar ADD CONSTRAINT FK_Dar_1
    FOREIGN KEY (fk_Feedback_idFeedback) REFERENCES Feedback (idFeedback)
    ON DELETE SET NULL;
 
ALTER TABLE Dar ADD CONSTRAINT FK_Dar_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Fazer ADD CONSTRAINT FK_Fazer_1
    FOREIGN KEY (fk_Metrica_idMetrica) REFERENCES Metrica (idMetrica)
    ON DELETE SET NULL;
 
ALTER TABLE Fazer ADD CONSTRAINT FK_Fazer_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Adquirir ADD CONSTRAINT FK_Adquirir_1
    FOREIGN KEY (fk_Assinatura_idAssinatura) REFERENCES Assinatura (idAssinatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Adquirir ADD CONSTRAINT FK_Adquirir_2
    FOREIGN KEY (fk_FormaDePagamento_idFormaDePagamento)
    REFERENCES FormaDePagamento (idFormaDePagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Escolhe ADD CONSTRAINT FK_Escolhe_1
    FOREIGN KEY (fk_FormaDePagamento_idFormaDePagamento)
    REFERENCES FormaDePagamento (idFormaDePagamento)
    ON DELETE RESTRICT;
 
ALTER TABLE Escolhe ADD CONSTRAINT FK_Escolhe_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE SET NULL;
 
ALTER TABLE Denunciar_Denuncia_Usuario_Postagem ADD CONSTRAINT FK_Denunciar_Denuncia_Usuario_Postagem_1
    FOREIGN KEY (fk_Denuncia_idDenucia)
    REFERENCES Denuncia (idDenucia)
    ON DELETE NO ACTION;
 
ALTER TABLE Denunciar_Denuncia_Usuario_Postagem ADD CONSTRAINT FK_Denunciar_Denuncia_Usuario_Postagem_2
    FOREIGN KEY (fk_Usuario_idUsuario) REFERENCES Usuario (idUsuario)
    ON DELETE NO ACTION;
 
ALTER TABLE Denunciar_Denuncia_Usuario_Postagem ADD CONSTRAINT FK_Denunciar_Denuncia_Usuario_Postagem_3
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE NO ACTION;
 
ALTER TABLE Ganhar ADD CONSTRAINT FK_Ganhar_1
    FOREIGN KEY (fk_Beneficio_idBeneficio)
    REFERENCES Beneficio (idBeneficio)
    ON DELETE RESTRICT;
 
ALTER TABLE Ganhar ADD CONSTRAINT FK_Ganhar_2
    FOREIGN KEY (fk_Assinatura_idAssinatura) REFERENCES Assinatura (idAssinatura)
    ON DELETE SET NULL;
 
ALTER TABLE Linkar ADD CONSTRAINT FK_Linkar_1
    FOREIGN KEY (fk_LinkCurto_idLinkCurto)
    REFERENCES LinkCurto (idLinkCurto)
    ON DELETE SET NULL;
 
ALTER TABLE Linkar ADD CONSTRAINT FK_Linkar_2
    FOREIGN KEY (fk_Postagem_idPostagem) REFERENCES Postagem (idPostagem)
    ON DELETE SET NULL;