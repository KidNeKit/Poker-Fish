import '../../models/enums/blinds.dart';
import '../../models/lobbies/cash_lobby.dart';

List<CashLobby> cashLobbies = [
  CashLobby.creation(maxPlayers: 6, buyIn: 2.00, blinds: Blinds.twoCents),
  CashLobby.creation(maxPlayers: 9, buyIn: 2.00, blinds: Blinds.twoCents),
  CashLobby.creation(maxPlayers: 6, buyIn: 5.00, blinds: Blinds.fiveCents),
  CashLobby.creation(maxPlayers: 9, buyIn: 5.00, blinds: Blinds.fiveCents),
  CashLobby.creation(maxPlayers: 6, buyIn: 10.00, blinds: Blinds.tenCents),
  CashLobby.creation(maxPlayers: 9, buyIn: 10.00, blinds: Blinds.tenCents),
];
