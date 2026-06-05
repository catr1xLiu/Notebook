import React, { useState, useEffect } from 'react';
import {
  Database,
  Activity,
  Layers,
  Cpu,
  Sparkles,
  ArrowRight,
  Play,
  Pause,
} from 'lucide-react';

// ==========================================
// FIGURE 1: OVERVIEW FLOWCHART
// ==========================================
export const Fig1Overview: React.FC = () => {
  const [activeStep, setActiveStep] = useState<number>(0);
  
  const pipelineSteps = [
    {
      title: "1. Raw Clinical MoCap",
      desc: "Van Criekinge dataset containing 138 subjects across life spans (ages 21-86) producing clinical markers at 100Hz.",
      metric: "138 subjects, 100Hz frequency",
      color: "bg-nat-accent/15 border-nat-accent text-nat-text-deep"
    },
    {
      title: "2. VPoser Optimization",
      desc: "Converts marker recordings into SMPL body parameters using L-BFGS frame-by-frame optimization to resolve artifacts.",
      metric: "SMPL Parameters (θ: 72, β: 10)",
      color: "bg-nat-accent/15 border-nat-accent text-nat-text-deep"
    },
    {
      title: "3. Feature Extraction",
      desc: "Extracted into 263-dimensional HumanML3D-compatible skeletal representation at a downsampled 20Hz frame rate.",
      metric: "263-D representation",
      color: "bg-nat-accent/15 border-nat-accent text-nat-text-deep"
    },
    {
      title: "4. Dual Modeling Stream",
      desc: "Skeletal data splits to train an ST-GCN age classifier and fine-tune a Motion Diffusion Model (MDM) using LoRA adapters.",
      metric: "ST-GCN classifier & MDM LoRA",
      color: "bg-nat-accent/15 border-nat-accent text-nat-text-deep"
    }
  ];

  return (
    <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col h-full justify-between">
      <div>
        <div className="flex justify-between items-center mb-4">
          <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
            Paper Fig 1
          </span>
          <h4 className="text-sm font-semibold font-sans text-nat-text-deep">Interactive Pipeline Overview</h4>
        </div>
        <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
          The processing pipeline transforms <strong>clinical gait recordings</strong> into age-tuned motions via localized SMPL optimization, graph neural classification, and LoRA diffusion adaptation. Click steps to view technical dimensions.
        </p>

        {/* Horizontal interactive rail */}
        <div className="grid grid-cols-4 gap-2 mb-6">
          {pipelineSteps.map((step, idx) => (
            <button
              key={idx}
              onClick={() => setActiveStep(idx)}
              className={`p-3 rounded-lg border text-left transition-all duration-200 cursor-pointer h-full flex flex-col justify-between ${
                activeStep === idx 
                  ? 'border-[#5A5A40] bg-[#F2F1ED] text-nat-text-deep ring-2 ring-[#8C8C73]/30 font-bold' 
                  : 'border-nat-border bg-white text-nat-accent-light hover:border-nat-border-hover hover:text-nat-text-deep'
              }`}
            >
              <div className="text-[10px] font-sans mb-1 font-semibold text-[#8C8C73]">STAGE 0{idx + 1}</div>
              <div className="text-[11px] leading-tight font-sans truncate">{step.title.split(". ")[1]}</div>
            </button>
          ))}
        </div>

        {/* Selected Step Detail Panel */}
        <div className="p-4 rounded-xl border border-nat-border bg-[#F9F8F4] shadow-inner">
          <div className="flex items-center gap-2 mb-2">
            <span className="p-1.5 rounded-full bg-[#E8E6DF] text-nat-accent">
              {activeStep === 0 && <Database size={15} />}
              {activeStep === 1 && <Cpu size={15} />}
              {activeStep === 2 && <Layers size={15} />}
              {activeStep === 3 && <Activity size={15} />}
            </span>
            <span className="text-sm font-bold font-sans text-nat-text-deep">{pipelineSteps[activeStep].title}</span>
          </div>
          <p className="text-xs text-nat-text-body font-serif leading-relaxed min-h-[48px]">
            {pipelineSteps[activeStep].desc}
          </p>
          <div className="mt-3 pt-3 border-t border-nat-border flex justify-between items-center text-[10px] font-sans text-[#5A5A40] font-bold">
            <span>KEY REPRESENTATION:</span>
            <span className="bg-white px-2 py-0.5 rounded border border-nat-border">{pipelineSteps[activeStep].metric}</span>
          </div>
        </div>
      </div>

      {/* Visual Pipeline flow chart */}
      <div className="mt-4 pt-4 border-t border-nat-border flex items-center justify-between text-[11px] font-sans text-nat-accent-light overflow-x-auto gap-4 py-2">
        <div className="flex items-center gap-1.5 shrink-0">
          <Database size={14} className="text-[#8C8C73]" />
          <span>Clinical Markers</span>
        </div>
        <ArrowRight size={12} className="text-nat-border shrink-0" />
        <div className="flex items-center gap-1.5 shrink-0 text-[#5A5A40] font-semibold">
          <Cpu size={14} />
          <span>VPoser (SMPL)</span>
        </div>
        <ArrowRight size={12} className="text-nat-border shrink-0" />
        <div className="flex items-center gap-1.5 shrink-0 text-nat-text-body">
          <span>HumanML3D Feature</span>
        </div>
        <ArrowRight size={12} className="text-nat-border shrink-0" />
        <div className="flex items-center gap-1.5 shrink-0 text-[#5A5A40] font-semibold">
          <Sparkles size={14} />
          <span>LoRA + MDM</span>
        </div>
      </div>
    </div>
  );
};


// ==========================================
// FIGURE 2: DATA PIPELINE — THREE STAGES
// ==========================================
const PipelinePanel: React.FC<{
  src: string; alt: string; step: string; label: string; detail: string;
}> = ({ src, alt, step, label, detail }) => (
  <div className="flex flex-col gap-2 min-w-0">
    <div className="flex-1 bg-[#F2F1ED] rounded-xl border border-nat-border flex items-center justify-center p-2 overflow-hidden" style={{ minHeight: 0 }}>
      <img src={src} alt={alt} className="max-h-full max-w-full object-contain" />
    </div>
    <div className="text-center shrink-0">
      <div className="text-[9px] font-sans font-bold uppercase tracking-widest text-nat-accent mb-0.5">{step}</div>
      <div className="text-[11px] font-sans font-semibold text-nat-text-deep leading-tight">{label}</div>
      <div className="text-[9px] font-sans text-nat-accent-light mt-0.5">{detail}</div>
    </div>
  </div>
);

export const Fig2Artifacts: React.FC = () => (
  <div className="border border-nat-border rounded-xl bg-nat-card p-5 flex flex-col h-full gap-3">
    <div className="flex justify-between items-center shrink-0">
      <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
        Paper Fig 1 (Top)
      </span>
      <h4 className="text-sm font-semibold font-sans text-nat-text-deep">Data Pipeline: MoCap → SMPL → HumanML3D</h4>
    </div>
    <div className="flex-1 grid grid-cols-3 gap-4 min-h-0">
      <PipelinePanel
        src="/figs/pipeline-mocap.png"
        alt="Van Criekinge clinical MoCap dataset: 58 labeled 3D markers at 100Hz"
        step="Stage 01"
        label="Raw Clinical MoCap"
        detail="58 markers · 100 Hz · 138 subjects"
      />
      <PipelinePanel
        src="/figs/pipeline-smpl.png"
        alt="VPoser-based SMPL mesh parameter optimization: L-BFGS with marker position, motion smoothness, and biomechanical priors"
        step="Stage 02"
        label="VPoser SMPL Fitting"
        detail="θ: (T, 72)  ·  β: (10)"
      />
      <PipelinePanel
        src="/figs/pipeline-humanml3d.png"
        alt="HumanML3D convertor producing machine-learnable graph at T·20Hz with 22 joints"
        step="Stage 03"
        label="HumanML3D Features"
        detail="(T · 20 Hz, 22, 3)"
      />
    </div>
  </div>
);


// ==========================================
// FIGURE 3: YOUNG VS ELDERLY STICK FIGURES
// ==========================================
export const Fig3GeneratedWalking: React.FC = () => {
  const [isPlaying, setIsPlaying] = useState<boolean>(true);
  const [ageGroup, setAgeGroup] = useState<'young' | 'old'>('young');
  const [frame, setFrame] = useState<number>(0);

  // Animation cycle loop
  useEffect(() => {
    if (!isPlaying) return;
    const interval = setInterval(() => {
      setFrame((prev) => (prev + 1) % 360);
    }, 30);
    return () => clearInterval(interval);
  }, [isPlaying]);

  // Biomechanical coefficients matching paper's findings (Fig 3 & VIOLIN PLOTS in Fig 9)
  const speed = ageGroup === 'young' ? 1.22 : 1.10; // m/s
  const strideLength = ageGroup === 'young' ? 1.34 : 1.26; // m
  const hipRoM = ageGroup === 'young' ? 25.0 : 21.5; // degrees peak RoM
  const kneeRoM = ageGroup === 'young' ? 54.9 : 51.5; // degrees
  const verticalStature = ageGroup === 'young' ? 0.0 : 15.0; // 0 flexion vs hunch

  // Calculate coordinates based on phase (frame)
  const phaseRad = (frame * Math.PI) / 180;
  const bobbing = Math.sin(phaseRad * 2) * 2.5; // pelvis bobbing
  
  // Pivot points
  const pelvisX = 50;
  const pelvisY = 65 + (ageGroup === 'elderly' ? 5 : 0) - bobbing;
  
  // Stride swing mechanics
  const hipAngle = Math.sin(phaseRad) * (hipRoM * Math.PI / 180);
  const kneeAngle = Math.sin(phaseRad - Math.PI/4) * (kneeRoM * Math.PI / 180) + (Math.PI / 6);
  
  // Left leg calculations
  const lThighX = pelvisX + Math.sin(hipAngle) * 30 * strideLength;
  const lThighY = pelvisY + Math.cos(hipAngle) * 30;
  
  const lShinX = lThighX + Math.sin(hipAngle - kneeAngle) * 28;
  const lShinY = lThighY + Math.cos(hipAngle - kneeAngle) * 28;

  // Right leg (opposite phase)
  const oppHipAngle = Math.sin(phaseRad + Math.PI) * (hipRoM * Math.PI / 180);
  const oppKneeAngle = Math.sin(phaseRad + Math.PI - Math.PI/4) * (kneeRoM * Math.PI / 180) + (Math.PI / 6);

  const rThighX = pelvisX + Math.sin(oppHipAngle) * 30 * strideLength;
  const rThighY = pelvisY + Math.cos(oppHipAngle) * 30;
  
  const rShinX = rThighX + Math.sin(oppHipAngle - oppKneeAngle) * 28;
  const rShinY = rThighY + Math.cos(oppHipAngle - oppKneeAngle) * 28;

  // Trunk/spine tilt representation (humped back vs erect posture)
  const neckX = pelvisX - Math.sin(verticalStature * Math.PI / 180) * 32;
  const neckY = pelvisY - Math.cos(verticalStature * Math.PI / 180) * 32;
  
  const headX = neckX - Math.sin((verticalStature + 12) * Math.PI / 180) * 8;
  const headY = neckY - Math.cos((verticalStature + 12) * Math.PI / 180) * 8;

  return (
    <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col justify-between h-full">
      <div>
        <div className="flex justify-between items-center mb-3">
          <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
            Paper Fig 3 & 9
          </span>
          <h4 className="text-sm font-semibold font-sans text-nat-text-deep">Generated Biomechanical Gait Engine</h4>
        </div>
        <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
          The fine-tuned <strong>LoRA model</strong> successfully captures spatial biomechanical extremes. Compare how <strong>Young</strong> and <strong>Elderly</strong> conditions alter hunch posture, pelvis bobbing, and range of joint motion.
        </p>

        {/* Style selection */}
        <div className="flex gap-2 mb-4 bg-nat-nested p-1 rounded-lg">
          <button
            onClick={() => setAgeGroup('young')}
            className={`flex-1 py-1 text-xs rounded transition-all cursor-pointer font-medium font-sans ${
              ageGroup === 'young' ? 'bg-nat-accent text-white shadow' : 'text-nat-[#8C8C73] hover:text-nat-text-deep'
            }`}
          >
            Young Condition
          </button>
          <button
            onClick={() => setAgeGroup('old')}
            className={`flex-1 py-1 text-xs rounded transition-all cursor-pointer font-medium font-sans ${
              ageGroup === 'old' ? 'bg-nat-accent text-white shadow' : 'text-nat-[#8C8C73] hover:text-nat-text-deep'
            }`}
          >
            Elderly Condition
          </button>
        </div>

        {/* 2D Kinematics Stage */}
        <div className="h-44 bg-[#F2F1ED] rounded-xl border border-nat-border flex items-center justify-center p-3 relative">
          <div className="absolute top-2 left-2 text-[8px] font-sans text-nat-accent-light font-bold flex items-center gap-1">
            <span className={`w-1.5 h-1.5 rounded-full ${isPlaying ? 'bg-[#5A5A40] animate-ping' : 'bg-rose-500'}`} />
            20HZ GAIT FRAME SIMULATION
          </div>
          
          <button 
            onClick={() => setIsPlaying(!isPlaying)}
            className="absolute bottom-2 right-2 p-1 bg-white rounded border border-nat-border text-nat-accent hover:text-nat-text-deep cursor-pointer text-xs"
          >
            {isPlaying ? <Pause size={12} /> : <Play size={12} />}
          </button>

          {/* SVG Biomechanics Simulator */}
          <svg className="w-full h-full max-w-[120px]" viewBox="0 0 100 150">
            {/* Ground Line */}
            <line x1="0" y1="135" x2="100" y2="135" stroke="rgba(140, 140, 115, 0.25)" strokeWidth="1" />
            
            {/* Skeletal Rig drawing */}
            <g strokeLinecap="round" strokeLinejoin="round">
              
              {/* Back Leg (Right leg - shaded) */}
              <line 
                x1={pelvisX} y1={pelvisY} 
                x2={rThighX} y2={rThighY} 
                stroke={ageGroup === 'young' ? 'rgba(90, 90, 64, 0.4)' : 'rgba(140, 140, 115, 0.5)'} 
                strokeWidth="2.5" 
              />
              <line 
                x1={rThighX} y1={rThighY} 
                x2={rShinX} y2={rShinY} 
                stroke={ageGroup === 'young' ? 'rgba(90, 90, 64, 0.4)' : 'rgba(140, 140, 115, 0.5)'} 
                strokeWidth="2.5" 
              />
              <line 
                x1={rShinX} y1={rShinY} 
                x2={rShinX + 5} y2={rShinY + 2} 
                stroke={ageGroup === 'young' ? 'rgba(90, 90, 64, 0.4)' : 'rgba(140, 140, 115, 0.5)'} 
                strokeWidth="2" 
              />

              {/* Spine / Head */}
              <line x1={pelvisX} y1={pelvisY} x2={neckX} y2={neckY} stroke="#2D2D2A" strokeWidth="3" />
              <circle cx={headX} cy={headY} r="7" fill="none" stroke="#2D2D2A" strokeWidth="2" />
              
              {/* Hunch indicator ring */}
              {ageGroup === 'old' && (
                <path d="M 42 30 Q 30 40 45 60" fill="none" stroke="rgba(140, 140, 115, 0.7)" strokeWidth="1.5" strokeDasharray="2,2" />
              )}

              {/* Front Leg (Left Leg - highlighted) */}
              <line 
                x1={pelvisX} y1={pelvisY} 
                x2={lThighX} y2={lThighY} 
                stroke={ageGroup === 'young' ? '#5A5A40' : '#8C8C73'} 
                strokeWidth="3.5" 
              />
              <line 
                x1={lThighX} y1={lThighY} 
                x2={lShinX} y2={lShinY} 
                stroke={ageGroup === 'young' ? '#8C8C73' : '#8C8C73'} 
                strokeWidth="3.5" 
              />
              <line 
                x1={lShinX} y1={lShinY} 
                x2={lShinX + 6} y2={lShinY + 2} 
                stroke={ageGroup === 'young' ? '#8C8C73' : '#8C8C73'} 
                strokeWidth="2.5" 
              />

              {/* Pivot Joints marker highlights */}
              <circle cx={pelvisX} cy={pelvisY} r="2.5" fill="#2D2D2A" />
              <circle cx={lThighX} cy={lThighY} r="2" fill="#5A5A40" />
              <circle cx={lShinX} cy={lShinY} r="2" fill="#8C8C73" />
            </g>
          </svg>
        </div>
      </div>

      {/* Gait Telemetry Metrics */}
      <div className="grid grid-cols-3 gap-2 mt-4 pt-4 border-t border-nat-border text-center">
        <div className="p-2 bg-[#F9F8F4] rounded border border-nat-border">
          <div className="text-[9px] font-sans text-[#8C8C73] uppercase tracking-tight font-bold">Speed</div>
          <div className="text-xs font-semibold font-sans text-nat-text-deep mt-0.5">{speed.toFixed(2)} m/s</div>
        </div>
        <div className="p-2 bg-[#F9F8F4] rounded border border-nat-border">
          <div className="text-[9px] font-sans text-[#8C8C73] uppercase tracking-tight font-bold">Hip RoM</div>
          <div className="text-xs font-semibold font-sans text-nat-accent mt-0.5">{hipRoM.toFixed(1)}°</div>
        </div>
        <div className="p-2 bg-[#F9F8F4] rounded border border-nat-border">
          <div className="text-[9px] font-sans text-[#8C8C73] uppercase tracking-tight font-bold">Knee RoM</div>
          <div className="text-xs font-semibold font-sans text-nat-accent mt-0.5">{kneeRoM.toFixed(1)}°</div>
        </div>
      </div>
    </div>
  );
};


// ==========================================
// FIGURE 11: CONTINUOUS ARCHITECTURE
// ==========================================
export const Fig11ContinuousArchitecture: React.FC = () => {
  return (
    <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col justify-between h-full font-sans">
      <div>
        <div className="flex justify-between items-center mb-3">
          <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
            Paper Fig 11 & Sec V
          </span>
          <h4 className="text-sm font-semibold text-nat-text-deep">Proposed Continuous latent Pipeline</h4>
        </div>
        <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
          Discrete age-group constraints fall short of capturing gradual aging. The authors proposed a futuristic continuous architecture to interpolate biological progression smoothly.
        </p>

        {/* Style contrast diagram */}
        <div className="space-y-3">
          <div className="bg-[#F9F8F4] hover:bg-[#F2F1ED] p-3 rounded-lg border border-nat-border text-left transition-colors">
            <span className="text-[9px] font-sans text-nat-accent font-bold bg-nat-nested border border-nat-border px-1.5 py-0.5 rounded">
              Phase 1: AMASS Pretraining
            </span>
            <p className="text-[11px] text-[#2D2D2A] mt-2 leading-relaxed font-serif">
              Train a biomechanical <strong>Style Encoder</strong> on massive AMASS datasets via supervised contrastive learning to isolate kinematic identity from action templates.
            </p>
          </div>

          <div className="bg-[#F9F8F4] hover:bg-[#F2F1ED] p-3 rounded-lg border border-nat-border text-left transition-colors">
            <span className="text-[9px] font-sans text-nat-accent font-bold bg-nat-nested border border-nat-border px-1.5 py-0.5 rounded">
              Phase 2: Continuous Conditioning
            </span>
            <p className="text-[11px] text-[#2D2D2A] mt-2 leading-relaxed font-serif">
              Fine-tune an <strong>Age Head</strong> using clinical label regressions. The resulting continuous <code>Z-style</code> embedding (256-D) represents fluid locomotor capacity.
            </p>
          </div>

          <div className="bg-[#F9F8F4] hover:bg-[#F2F1ED] p-3 rounded-lg border border-nat-border text-left transition-colors">
            <span className="text-[9px] font-sans text-nat-accent font-bold bg-nat-nested border border-nat-border px-1.5 py-0.5 rounded">
              Phase 3: Generative Fusion
            </span>
            <p className="text-[11px] text-[#2D2D2A] mt-2 leading-relaxed font-serif">
              Concatenate CLIP text tensors and <code>Z-style</code> parameters, driving the MDM transformer to synthesise highly individualized, demographic-sensitive trajectories.
            </p>
          </div>
        </div>
      </div>

      <div className="p-3 bg-nat-nested border border-nat-border rounded-lg text-[10px] text-nat-text-deep flex gap-2 items-center mt-3">
        <Activity size={14} className="shrink-0 text-nat-accent" />
        <span className="font-serif">Resolves binary age bins to enable patient-specific personalization in rehabilitation.</span>
      </div>
    </div>
  );
};


// ==========================================
// ST-GCN CONFUSION MATRIX RESULTS
// ==========================================
export const FigStGcnResults: React.FC = () => (
  <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col h-full">
    <div className="flex justify-between items-center mb-3">
      <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
        Paper Fig 8
      </span>
      <h4 className="text-sm font-semibold font-sans text-nat-text-deep">ST-GCN++ Age Classification Confusion Matrices</h4>
    </div>
    <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
      Two-block ST-GCN++ achieves <strong>64.60% validation accuracy</strong>. Mid-age confusion with adjacent groups mirrors clinical biomechanical overlap between age cohorts.
    </p>
    <div className="flex-1 flex items-center justify-center bg-[#F2F1ED] rounded-xl border border-nat-border p-3">
      <img
        src="/figs/stgcn-confusion.png"
        alt="ST-GCN++ confusion matrices: 1-block model (60.18% val acc) and 2-block model (64.60% val acc) for Young/Adult/Elderly age groups"
        className="max-h-full max-w-full object-contain"
      />
    </div>
  </div>
);


// ==========================================
// DIFFUSION / LORA ARCHITECTURE FIGURE
// ==========================================
export const FigDiffusionArchitecture: React.FC = () => (
  <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col h-full">
    <div className="flex justify-between items-center mb-3">
      <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
        Paper Fig 3
      </span>
      <h4 className="text-sm font-semibold font-sans text-nat-text-deep">Qualitative Generation Results Across Age Conditions</h4>
    </div>
    <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
      LoRA-adapted MDM produces visually distinct gaits per style token: <strong>Young</strong> adults move faster with upright posture; <strong>Elderly</strong> subjects show hunched back, slower speed, and reduced stride foot height.
    </p>
    <div className="flex-1 flex items-center justify-center bg-[#F2F1ED] rounded-xl border border-nat-border p-3">
      <img
        src="/figs/generation-result.png"
        alt="Generated walking sequences: Young (blue, faster), Middle Age (yellow), Elderly (pink, hunched back, slower, reduced stride height)"
        className="max-h-full max-w-full object-contain"
      />
    </div>
  </div>
);


// ==========================================
// VIOLIN PLOTS: DATASET VS GENERATED
// ==========================================
export const FigViolinResults: React.FC = () => (
  <div className="border border-nat-border rounded-xl bg-nat-card p-6 flex flex-col h-full">
    <div className="flex justify-between items-center mb-3">
      <span className="text-xs font-sans text-nat-accent border border-nat-border px-2.5 py-0.5 rounded-full bg-nat-nested font-medium">
        Paper Fig 9
      </span>
      <h4 className="text-sm font-semibold font-sans text-nat-text-deep">Gait Metric Distributions: Dataset vs Generated</h4>
    </div>
    <p className="text-xs text-nat-text-body mb-4 leading-relaxed font-serif">
      9,000 generated clips (3,000 per age condition). Spatial metrics (Hip RoM, Cadence) align well; <strong>Stride Time CV spikes to 16–19%</strong> vs baseline 8.9–15%, revealing temporal stochasticity from diffusion noise.
    </p>
    <div className="flex-1 flex items-center justify-center bg-[#F2F1ED] rounded-xl border border-nat-border p-3">
      <img
        src="/figs/combined-violin.png"
        alt="Violin plots comparing Walking Speed, Stride Time CV, Hip ROM, and Cadence between ground-truth dataset (blue) and generated motion clips (red) for Young and Old age groups"
        className="max-h-full max-w-full object-contain"
      />
    </div>
  </div>
);
