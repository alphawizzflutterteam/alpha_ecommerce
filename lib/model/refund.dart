class RefundList {
  String transactionDate;
  String transactionTime;
  bool transactionStatus;
  String transactionAmount;
  String transactionId;
  String orderId;
  RefundList(
      {required this.orderId,
      required this.transactionAmount,
      required this.transactionId,
      required this.transactionDate,
      required this.transactionStatus,
      required this.transactionTime});
}

List<RefundList> refund = [
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: 'OID52466246325',
      transactionDate: '2 Oct 2023',
      transactionStatus: true,
      transactionTime: '04:45 PM'),
  RefundList(
      orderId: 'OID53466246325',
      transactionAmount: '\$2562',
      transactionId: '',
      transactionDate: '2 Oct 2023',
      transactionStatus: false,
      transactionTime: '04:45 PM'),
];
