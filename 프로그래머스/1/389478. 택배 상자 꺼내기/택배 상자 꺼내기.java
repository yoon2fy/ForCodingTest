public class Solution {
    public static int solution(int n, int w, int num) {
        // 1. 해당 상자의 층과 위치 인덱스를 구한다
        int layer = (num - 1) / w;
        int idxInLayer = (num - 1) % w;
        
        // 방향에 따라 인덱스 보정 (홀수층이면 오른쪽 → 왼쪽이므로 뒤집기)
        if (layer % 2 == 1) {
            idxInLayer = w - 1 - idxInLayer;
        }

        // 2. 위에 쌓여 있는 상자 개수 계산
        int count = 0;
        int totalLayers = (n + w - 1) / w;  // 전체 층 수

        for (int upperLayer = layer + 1; upperLayer < totalLayers; upperLayer++) {
            int start = upperLayer * w + 1;
            int end = Math.min(n, (upperLayer + 1) * w);

            int targetIdx;
            if (upperLayer % 2 == 0) {
                targetIdx = idxInLayer;  // 왼쪽 → 오른쪽
            } else {
                targetIdx = w - 1 - idxInLayer;  // 오른쪽 → 왼쪽
            }

            if (targetIdx < (end - start + 1)) {
                count++;
            }
        }

        return count + 1;  // 본인 포함
    }
}
