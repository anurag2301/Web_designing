package com.model;

public class CheckSum {
	private String iccid;
	private long checkSum;
	private String newIccid;

	public long generateCheckSum(String iccid) {
		this.iccid = iccid;

		long altInd = 0, sumO = 0, checkSum = 0;
		int iccidLen, num = 0;
		iccidLen = iccid.length();

		for (int i = iccidLen - 1; i >= 0; i--) {
			altInd = i % 2;
			num = Integer.parseInt(iccid.substring(i, i+1));

			if (altInd == 0) {
				num = num * 2;
				if (num > 9) {
					num = (num % 10) + 1;
				}
			}

			sumO = sumO + num;
		}

		checkSum = (10 - (sumO % 10)) % 10;
		System.out.println("\nCheck sum for ICCID " + iccid + "  is " + checkSum);
		this.checkSum = checkSum;
		return Long.parseLong(iccid+checkSum);
	}
}
