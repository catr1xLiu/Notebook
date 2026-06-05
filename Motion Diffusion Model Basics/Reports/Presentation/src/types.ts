export interface SlideItem {
  id: string;
  title: string;
  subtitle?: string;
  section: 'Introduction' | 'Methodology' | 'Results & Evaluation' | 'Discussion' | 'Interactive Demo';
  speakerNotes: string[];
  suggestedDuration: number; // in seconds
  highlight: string;
}

export interface JointAngleData {
  phase: number; // 0 to 100% of gait cycle
  youngHip: number;
  oldHip: number;
  youngKnee: number;
  oldKnee: number;
}

export interface GaitMetrics {
  speed: number;        // m/s
  strideLength: number; // meters
  cadence: number;      // steps/min
  hipRoM: number;       // degrees
  kneeRoM: number;      // degrees
  strideCV: number;     // %
}
