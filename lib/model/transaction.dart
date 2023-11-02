class TransactionList {
  String transactionDate;
  String transactionTime;
  bool transactionStatus;
  String transactionAmount;
  String transactionId;
  String orderId;
  TransactionList(
      {required this.orderId,
      required this.transactionAmount,
      required this.transactionId,
      required this.transactionDate,
      required this.transactionStatus,
      required this.transactionTime});
}

List<TransactionList> transaction = [
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  TransactionList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
];
