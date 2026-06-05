import React, { useState, useEffect } from 'react';
import { 
  Sliders, 
  Brain, 
  Flame, 
  Activity, 
  Sparkles, 
  AlertCircle
} from 'lucide-react';

export const InteractivePlayground: React.FC = () => {
  // Simulator state variables
  const [backFlexion, setBackFlexion] = useState<number>(5);     // 0 to 30 degrees
  const [hipRange, setHipRange] = useState<number>(24);         // 15 to 30 degrees
  const [cadence, setCadence] = useState<number>(105);          // 80 to 130 steps/min
  const [sensorNoise, setSensorNoise] = useState<number>(0.1);    // 0.01 to 0.4 (represents diffusion stochastic noise)

  // ST-GCN simulated response
  const [prediction, setPrediction] = useState<{ young: number; mid: number; old: number }>({ young: 45, mid: 35, old: 20 });
  const [predictedClass, setPredictedClass] = useState<string>("Young");

  // Recalculate simulated ST-GCN classification based on clinical mechanics sliders
  useEffect(() => {
    // Basic heuristic models matching the paper's ST-GCN findings (Old is characterized by low hip RoM, high hunch/backFlexion, low cadence)
    let oldScore = (backFlexion * 2.8) + (26 - hipRange) * 3 + (110 - cadence) * 0.8;
    let youngScore = (30 - backFlexion) * 2 + (hipRange - 18) * 3.5 + (cadence - 90) * 1.1;
    let midScore = 40 + (105 - Math.abs(cadence - 105)) * 0.5 + (22 - Math.abs(hipRange - 22)) * 0.5;

    // Normalise
    const sum = Math.max(1, oldScore + youngScore + midScore);
    const youngPct = Math.round((Math.max(0, youngScore) / sum) * 100);
    const oldPct = Math.round((Math.max(0, oldScore) / sum) * 100);
    const midPct = 100 - youngPct - oldPct;

    setPrediction({ young: youngPct, mid: midPct, old: oldPct });

    if (youngPct >= midPct && youngPct >= oldPct) setPredictedClass("Young (<35)");
    else if (oldPct >= youngPct && oldPct >= midPct) setPredictedClass("Elderly (≥60)");
    else setPredictedClass("Mid-age (35-60)");

  }, [backFlexion, hipRange, cadence]);

  // Derived Spatiotemporal results comparing Dataset baseline vs Generated output (incorporating noise)
  const simulatedSpeed = (hipRange / 20) * (cadence / 100);
  const strideVariabilityCV = 8.9 + (sensorNoise * 26.5); // Stride CV spikes dynamically based on noise

  return (
    <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col justify-between h-full font-sans">
      <div>
        <div className="flex justify-between items-center mb-3">
          <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
            Paper Sec IV-B & D
          </span>
          <h4 className="text-sm font-semibold text-nat-text-deep">Session Demo: ST-GCN Classifier Sandbox</h4>
        </div>
        <p className="text-xs text-nat-text-body mb-5 leading-relaxed font-serif">
          The paper uses a Spatial-Temporal Graph Convolutional Network (ST-GCN++) to detect age styles from joint lines. Adjust the gait posture nodes below to see how clinical statistics alter the STGCN age classification.
        </p>

        {/* Sliders Grid */}
        <div className="space-y-4 mb-6">
          {/* Slider 1 */}
          <div>
            <div className="flex justify-between text-xs mb-1.5 text-nat-accent-light font-semibold">
              <span className="flex items-center gap-1"><Sliders size={12} /> Hunch Angle (Spinal Flexion)</span>
              <span className="text-nat-text-deep font-bold">{backFlexion}°</span>
            </div>
            <input 
              type="range" 
              min="0" 
              max="30" 
              step="1"
              value={backFlexion}
              onChange={(e) => setBackFlexion(Number(e.target.value))}
              className="w-full h-1 bg-[#F2F1ED] rounded-lg appearance-none cursor-pointer accent-[#5A5A40]" 
            />
            <div className="flex justify-between text-[8px] font-sans text-[#8C8C73] mt-1 font-bold">
              <span>0° (Erect)</span>
              <span>15° (Subtle Curve)</span>
              <span>30° (Severe Hunch)</span>
            </div>
          </div>

          {/* Slider 2 */}
          <div>
            <div className="flex justify-between text-xs mb-1.5 text-nat-accent-light font-semibold">
              <span className="flex items-center gap-1"><Activity size={12} /> Hip Range of Motion (RoM)</span>
              <span className="text-nat-accent font-bold">{hipRange}°</span>
            </div>
            <input 
              type="range" 
              min="15" 
              max="30" 
              step="0.5"
              value={hipRange}
              onChange={(e) => setHipRange(Number(e.target.value))}
              className="w-full h-1 bg-[#F2F1ED] rounded-lg appearance-none cursor-pointer accent-[#5A5A40]" 
            />
            <div className="flex justify-between text-[8px] font-sans text-[#8C8C73] mt-1 font-bold">
              <span>15° (Elderly Constrained)</span>
              <span>24° (Normal Median)</span>
              <span>30° (High Athleticism)</span>
            </div>
          </div>

          {/* Slider 3 */}
          <div>
            <div className="flex justify-between text-xs mb-1.5 text-nat-accent-light font-semibold">
              <span className="flex items-center gap-1"><Flame size={12} /> Stride Cadence</span>
              <span className="text-nat-accent font-bold">{cadence} steps/min</span>
            </div>
            <input 
              type="range" 
              min="80" 
              max="135" 
              step="1"
              value={cadence}
              onChange={(e) => setCadence(Number(e.target.value))}
              className="w-full h-1 bg-[#F2F1ED] rounded-lg appearance-none cursor-pointer accent-[#5A5A40]" 
            />
            <div className="flex justify-between text-[8px] font-sans text-[#8C8C73] mt-1 font-bold">
              <span>80 spm (Slow walk)</span>
              <span>110 spm (Moderate)</span>
              <span>135 spm (Rapid speed)</span>
            </div>
          </div>

          {/* Slider 4 */}
          <div>
            <div className="flex justify-between text-xs mb-1.5 text-nat-accent-light font-semibold">
              <span className="flex items-center gap-1 text-[#8C8C73]"><Brain size={12} /> Diffusion Stochastic Noise</span>
              <span className="text-[#5A5A40] font-bold">{(sensorNoise * 10).toFixed(1)}x</span>
            </div>
            <input 
              type="range" 
              min="0.01" 
              max="0.4" 
              step="0.02"
              value={sensorNoise}
              onChange={(e) => setSensorNoise(Number(e.target.value))}
              className="w-full h-1 bg-[#F2F1ED] rounded-lg appearance-none cursor-pointer accent-[#5A5A40]" 
            />
            <div className="flex justify-between text-[8px] font-sans text-[#8C8C73] mt-1 font-bold">
              <span>0 (Stable GT)</span>
              <span>2.5 (Standard Diffusion)</span>
              <span>4.0 (High Stride Jitter)</span>
            </div>
          </div>
        </div>

        {/* Real-time Simulated ST-GCN Outputs */}
        <div className="p-4 bg-[#F9F8F4] rounded-xl border border-nat-border shadow-inner">
          <div className="flex justify-between items-center mb-3">
            <span className="text-[10px] font-sans text-[#8C8C73] font-bold">ST-GCN++ CLASSIFICATION MODEL</span>
            <span className="text-[10px] font-sans bg-nat-nested text-[#2D2D2A] px-2.5 py-0.5 rounded border border-nat-border font-bold">
              {predictedClass}
            </span>
          </div>

          <div className="space-y-2">
            {/* Young */}
            <div>
              <div className="flex justify-between text-[10px] font-sans text-nat-accent-light mb-1 font-bold">
                <span>Young Adult (&lt;35)</span>
                <span className="text-nat-text-deep font-bold">{prediction.young}%</span>
              </div>
              <div className="w-full h-2 bg-white rounded overflow-hidden border border-nat-border/50">
                <div className="h-full bg-[#5A5A40] transition-all duration-300" style={{ width: `${prediction.young}%` }} />
              </div>
            </div>

            {/* Mid */}
            <div>
              <div className="flex justify-between text-[10px] font-sans text-nat-accent-light mb-1 font-bold">
                <span>Mid-age (35-60)</span>
                <span className="text-nat-text-deep font-bold">{prediction.mid}%</span>
              </div>
              <div className="w-full h-2 bg-white rounded overflow-hidden border border-nat-border/50">
                <div className="h-full bg-[#8C8C73] transition-all duration-300" style={{ width: `${prediction.mid}%` }} />
              </div>
            </div>

            {/* Old */}
            <div>
              <div className="flex justify-between text-[10px] font-sans text-nat-accent-light mb-1 font-bold">
                <span>Elderly (&ge;60)</span>
                <span className="text-nat-text-deep font-bold">{prediction.old}%</span>
              </div>
              <div className="w-full h-2 bg-white rounded overflow-hidden border border-nat-border/50">
                <div className="h-full bg-[#2D2D2A] transition-all duration-300" style={{ width: `${prediction.old}%` }} />
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Critical Paper Insight: Stride Variability Over-shoot */}
      <div className="mt-4 p-3 rounded-lg border border-nat-border bg-nat-nested text-[#2D2D2A] flex flex-col gap-1.5">
        <div className="flex gap-1.5 items-center text-[10px] font-bold tracking-tight">
          <AlertCircle size={14} className="shrink-0 text-nat-accent" />
          <span>STOCHASTIC STRIDE CV ANOMALY</span>
        </div>
        <p className="text-[10px] leading-relaxed text-nat-text-body font-serif">
          <strong>Key Finding:</strong> Generating motion via LoRA diffusion causes the gait CV to spike to <span className="font-sans text-[#2D2D2A] font-extrabold underline">{strideVariabilityCV.toFixed(1)}%</span> (GT baseline: 8.9% - 15.0%). Stochastic noise disrupts the temporal biomechanical chain!
        </p>
      </div>
    </div>
  );
};
