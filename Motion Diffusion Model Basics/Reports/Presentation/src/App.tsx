import React, { useState, useEffect, useRef } from 'react';
import { motion, AnimatePresence } from 'motion/react';
import { 
  Play, 
  Pause, 
  RotateCcw, 
  ChevronLeft, 
  ChevronRight, 
  Volume2, 
  VolumeX, 
  Clock, 
  Presentation,
  Award
} from 'lucide-react';
import { SlideItem } from './types';
import { 
  Fig1Overview, 
  Fig2Artifacts, 
  Fig3GeneratedWalking, 
  Fig11ContinuousArchitecture 
} from './components/InteractiveDiagrams';
import { InteractivePlayground } from './components/InteractivePlayground';

const SLIDES: SlideItem[] = [
  {
    id: "title",
    title: "Modeling Aging Signatures in Human Motion via Motion Diffusion",
    subtitle: "Models for Elder Care Robotics",
    section: "Introduction",
    highlight: "Bridging the gap between clinical gait analysis and generative motion models for assistive robotics.",
    suggestedDuration: 45, // seconds
    speakerNotes: [
      "Welcome, everyone, to today's workshop. I am presenting our work: 'Modeling Aging Signatures in Human Motion via Motion Diffusion Models for Elder Care Robotics'.",
      "Our main goal is simple: current generative models represent young, healthy demographics perfectly, but leave older adults completely unrepresented. This is a massive issue for robots in domestic care.",
      "Today, I'll walk you through our proof-of-concept pipeline, which integrates real clinical marker datasets, evaluates generated outcomes, and highlights pathways to secure bio-fidelity."
    ]
  },
  {
    id: "motivation",
    title: "The Problem: Dataset Bias & Robotics Safety Constraints",
    subtitle: "Why Standard Motion Models Fail Domestic Robots",
    section: "Introduction",
    highlight: "Popular motion repositories like AMASS are heavily skewed toward young, athletic actors.",
    suggestedDuration: 45,
    speakerNotes: [
      "Why is this work critical? As our population ages, assistive robots must handle home care, physical therapy, and daily mobility support.",
      "To operate safely, robots must predict their users' movements. But current models assume a healthy young adult prior. An older adult has lowered stride velocity, spinal curvature, and joint ranges.",
      "If we don't design demographic-aware systems, robots will miscalculate walking vectors, leading to unsafe collisions or failed interactions."
    ]
  },
  {
    id: "pipeline",
    title: "Methodology: SMPL Fitting & Crouch Artifact Resolution",
    subtitle: "Optimizing Marker Data to Guarantee Biological Fidelity",
    section: "Methodology",
    highlight: "Standard fitting priors induce crouch gait artifacts, solved here via VPoser L-BFGS regularization.",
    suggestedDuration: 60,
    speakerNotes: [
      "Let's dive into data conversion. We utilized clinical kinematics from the Van Criekinge dataset—composed of 138 individuals, spanning ages 21 to 86.",
      "Traditional body-fitting approaches like priorless SMPL optimization often compress older postures, inducing severe bent-knee crouching artifacts, or inflate joint volumes.",
      "We resolved this by staging our L-BFGS optimizer using VPoser shape priors. First, we solve shape-free translation; then, we refine body shape. The converged posture successfully recovers natural, straight joint alignments."
    ]
  },
  {
    id: "classification",
    title: "Age-Group Signature Classification",
    subtitle: "Spatial-Temporal GCN Proves Age is Encoded in Gait Dynamics",
    section: "Methodology",
    highlight: "ST-GCN validation accuracy reaches 64.60% across Young (<35) and Elderly (≥60) extremes.",
    suggestedDuration: 45,
    speakerNotes: [
      "To test whether age-related signals are preserved after our conversions, we trained a Spatial-Temporal Graph Convolutional Network (ST-GCN++).",
      "We set up three demographic classification bins: Young, Mid-age, and Elderly. The ST-GCN successfully achieved 64.60% validation accuracy.",
      "A key clinical insight: the network consistently confused Mid-age with the other groups. This matches clinical studies which prove that the young-to-mid biomechanical gap is miniscule compared to raw within-group variance."
    ]
  },
  {
    id: "diffusion",
    title: "Age-Controllable Diffusion via LoRA Adapters",
    subtitle: "Parameter-Efficient Stylization Without Catastrophic Forgetting",
    section: "Results & Evaluation",
    highlight: "Adapting pre-trained MDM models with rank-12 LoRA retains powerful text-to-motion capabilities.",
    suggestedDuration: 45,
    speakerNotes: [
      "Once we verified that age signals are present, we tackled motion generation.",
      "Retraining large-scale Motion Diffusion Models (MDMs) from scratch on small clinical datasets is computationally wasteful and forces the model to forget natural text instructions.",
      "Instead, we adapted a pre-trained MDM with Low-Rank Adaptation (LoRA) of rank 12. We introduced discrete style tokens—'young', 'mid', and 'old'—and froze the base model parameters, focusing adaptation entirely on style control."
    ]
  },
  {
    id: "results",
    title: "Gait Metrics: Kinematic Successes & Temporal Failures",
    subtitle: "Evaluating 9,000 Generated Clips Against Real Clinical Standards",
    section: "Results & Evaluation",
    highlight: "Spatial range of motion is successfully updated, but spatiotemporal stride variability CV spikes.",
    suggestedDuration: 45,
    speakerNotes: [
      "How did our generated motions fare? We ran a mass evaluation by synthesizing 9,000 walking clips—3,000 for each age condition—and calculated key clinical parameters.",
      "The result is a mixed success. On the spatial side, the model excelled: the 'old' style token successfully constrained hip flexion range of motion to 21.5 degrees, mirroring real elderly groups.",
      "However, temporal alignment fell apart. The stride Coefficient of Variation spiked to 16-19% across all generated steps, far exceeding real biological baselines. Stochastic diffusion noise interferes with smooth timing."
    ]
  },
  {
    id: "continuous",
    title: "The Path Forward: Continuous Age Conditioning",
    subtitle: "Replacing Coarse Categorical Bins with Fluid Locomotor Representations",
    section: "Discussion",
    highlight: "Future architectures will pre-train Style Encoders on AMASS using contrastive loss to capture individual ability gradients.",
    suggestedDuration: 45,
    speakerNotes: [
      "To solve these limits, we propose a shift from rigid, discrete style tokens to a continuous latent trajectory.",
      "Rather than dividing people into 'young' or 'old', future systems must compute on a gradient of functional ability. In our proposed Figure 11 architecture, we design a Biomechanical Style Encoder pre-trained on AMASS using supervised contrastive loss.",
      "By combining this with continuous age regressions and fusion transformers, we can synthesize fluid, patient-specific kinematics to support customized clinical rehabilitation."
    ]
  },
  {
    id: "demo",
    title: "Interactive Session Companion & Workshop Panel",
    subtitle: "Calibrate and Diagnose ST-GCN Diagnostics Real-Time",
    section: "Interactive Demo",
    highlight: "Adjust posture sliders to run live simulated evaluations of the joint class ST-GCN predictions.",
    suggestedDuration: 30,
    speakerNotes: [
      "Finally, let's open the interactive sandbox we created for today's session. You can now adjust biological attributes in real time.",
      "See how increasing spinal hunch, restricting joint range, or tweaking stride frequency instantly shifts the age-group predictions of our model.",
      "Most importantly, notice how adding simulated stochastic noise causes the stride variability metrics to spike, demonstrating the mechanical limitations of classical diffusion. Thank you, and I look forward to your questions!"
    ]
  }
];

export default function App() {
  const [currentSlideIndex, setCurrentSlideIndex] = useState<number>(0);
  const [isPlaying, setIsPlaying] = useState<boolean>(false);
  const [soundEnabled, setSoundEnabled] = useState<boolean>(true);

  // 5 Minute Presentation Countdown timer
  const [totalTimeLeft, setTotalTimeLeft] = useState<number>(300); // 300 seconds = 5 minutes
  const [timerActive, setTimerActive] = useState<boolean>(false);
  const [slideSecondsLeft, setSlideSecondsLeft] = useState<number>(SLIDES[0].suggestedDuration);

  // Reference for playing beep warning sounds in UI
  const alertTriggered = useRef<boolean>(false);

  const currentSlide = SLIDES[currentSlideIndex];

  // Global Presentation Timer Effect
  useEffect(() => {
    let interval: NodeJS.Timeout;
    if (timerActive && totalTimeLeft > 0) {
      interval = setInterval(() => {
        setTotalTimeLeft((prev) => prev - 1);
      }, 1000);
    } else if (totalTimeLeft === 0) {
      setTimerActive(false);
    }
    return () => clearInterval(interval);
  }, [timerActive, totalTimeLeft]);

  // Slide Specific Suggested Duration Timer
  useEffect(() => {
    setSlideSecondsLeft(currentSlide.suggestedDuration);
    alertTriggered.current = false;
  }, [currentSlideIndex]);

  useEffect(() => {
    let interval: NodeJS.Timeout;
    if (timerActive && slideSecondsLeft > 0) {
      interval = setInterval(() => {
        setSlideSecondsLeft((prev) => prev - 1);
      }, 1000);
    } else if (slideSecondsLeft === 0 && !alertTriggered.current) {
      // Flashes a visual cues or warns verbally
      if (soundEnabled) {
        try {
          const audioCtx = new (window.AudioContext || (window as any).webkitAudioContext)();
          const osc = audioCtx.createOscillator();
          const gain = audioCtx.createGain();
          osc.connect(gain);
          gain.connect(audioCtx.destination);
          osc.type = 'sine';
          osc.frequency.setValueAtTime(440, audioCtx.currentTime); // Standard beep
          gain.gain.setValueAtTime(0.04, audioCtx.currentTime);
          osc.start();
          setTimeout(() => osc.stop(), 180);
        } catch (e) {
          console.log("Audio not allowed by custom safety scopes yet", e);
        }
      }
      alertTriggered.current = true;
    }
    return () => clearInterval(interval);
  }, [timerActive, slideSecondsLeft, soundEnabled]);

  // Autoplay handler
  useEffect(() => {
    let interval: NodeJS.Timeout;
    if (isPlaying) {
      interval = setInterval(() => {
        goToNextSlide();
      }, 10000); // Auto advances slide every 10 seconds if autoplay enabled
    }
    return () => clearInterval(interval);
  }, [isPlaying, currentSlideIndex]);

  const goToNextSlide = () => {
    if (currentSlideIndex < SLIDES.length - 1) {
      setCurrentSlideIndex((prev) => prev + 1);
    } else {
      setIsPlaying(false); // Stop autoplay when reaching the end
    }
  };

  const goToPrevSlide = () => {
    if (currentSlideIndex > 0) {
      setCurrentSlideIndex((prev) => prev - 1);
    }
  };

  const resetPresentation = () => {
    setCurrentSlideIndex(0);
    setTotalTimeLeft(300);
    setTimerActive(false);
    setIsPlaying(false);
  };

  const formatMinSec = (secs: number) => {
    const m = Math.floor(secs / 60);
    const s = secs % 60;
    return `${m}:${s < 10 ? '0' : ''}${s}`;
  };

  return (
    <div className="min-h-screen bg-nat-bg font-serif text-nat-text-deep flex flex-col justify-between overflow-x-hidden antialiased selection:bg-nat-accent/20 selection:text-nat-text-deep">
      
      {/* HEADER SECTION */}
      <header className="border-b border-nat-border bg-nat-card px-6 py-4 sticky top-0 z-40 flex items-center justify-between shadow-sm">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-full bg-nat-accent flex items-center justify-center text-white italic shadow">
            <Presentation size={20} className="text-white" />
          </div>
          <div>
            <div className="flex items-center gap-2">
              <span className="text-[10px] font-bold font-sans py-0.5 px-2 rounded-full bg-nat-accent/10 text-nat-accent border border-nat-accent/20 uppercase tracking-widest">
                WORKSHOP BRIEF
              </span>
              <span className="text-nat-border text-xs font-sans">•</span>
              <span className="text-[10px] font-sans text-nat-accent-light uppercase tracking-wider font-semibold">Aging Signatures in Human Motion</span>
            </div>
            <h1 className="text-sm font-semibold font-sans text-nat-text-deep truncate max-w-sm md:max-w-xl">
              Modeling Aging Signatures via Motion Diffusion
            </h1>
          </div>
        </div>

        {/* Global presentation timer block */}
        <div className="flex items-center gap-4">
          {/* Master 5 min workshop countdown */}
          <div className="bg-[#F2F1ED] border border-nat-border rounded-lg px-3 py-1.5 hidden sm:flex items-center gap-2 shadow-sm">
            <Clock size={14} className={timerActive ? "text-nat-accent animate-pulse" : "text-nat-accent-light"} />
            <div>
              <div className="text-[8px] font-sans text-nat-accent-light uppercase tracking-wider font-bold">Total Duration</div>
              <div className={`text-xs font-semibold font-sans ${totalTimeLeft < 45 ? 'text-rose-600 animate-pulse font-bold' : 'text-nat-text-deep'}`}>
                {formatMinSec(totalTimeLeft)} <span className="text-[9px] text-nat-accent-light">/ 5:00</span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-1.5 bg-nat-aside p-1 rounded-lg border border-nat-border">
            <button 
              onClick={() => setTimerActive(!timerActive)}
              className={`p-1.5 rounded-md transition-all cursor-pointer text-xs font-sans flex items-center gap-1 px-3 ${
                timerActive ? 'bg-nat-accent text-white font-bold shadow-sm' : 'text-nat-text-body hover:bg-nat-nested border border-transparent'
              }`}
              title={timerActive ? "Pause Presentation timer" : "Start Presentation timer"}
            >
              {timerActive ? 'Pause' : 'Start Timer'}
            </button>
            <button 
              onClick={resetPresentation}
              className="p-1.5 rounded hover:bg-nat-nested text-nat-accent-light hover:text-nat-text-deep transition-colors cursor-pointer"
              title="Reset slide timers"
            >
              <RotateCcw size={14} />
            </button>
          </div>
        </div>
      </header>

      {/* CORE FRAME LAYOUT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 md:p-6 grid grid-cols-1 lg:grid-cols-12 gap-6 items-stretch">
        
        {/* LEFT RAIL: SLIDES LIST (FOR EASY NAVIGATION) */}
        <section className="lg:col-span-3 border border-nat-border bg-nat-aside rounded-2xl p-4 flex flex-col justify-between gap-4 h-full hidden lg:flex">
          <div className="space-y-4">
            <div className="flex justify-between items-center px-1">
              <h3 className="text-[11px] uppercase tracking-widest text-[#8C8C73] font-sans font-bold">Presentation Flow</h3>
              <span className="text-[10px] font-sans text-[#8C8C73] bg-[#E8E6DF] bg-opacity-50 px-2 py-0.5 rounded border border-[#DEDBD2]">
                {currentSlideIndex + 1} of {SLIDES.length}
              </span>
            </div>
            
            <nav className="space-y-1.5 overflow-y-auto max-h-[380px] p-0.5">
              {SLIDES.map((slide, idx) => {
                const isSelected = currentSlideIndex === idx;
                return (
                  <button
                    key={slide.id}
                    onClick={() => setCurrentSlideIndex(idx)}
                    className={`w-full text-left p-3 rounded-xl border transition-all duration-150 cursor-pointer flex items-center ${
                      isSelected 
                        ? 'border-2 border-nat-accent bg-nat-card text-nat-text-deep shadow-sm font-bold'
                        : 'border-nat-border bg-nat-card opacity-60 hover:opacity-100 text-nat-text-body shadow-sm'
                    }`}
                  >
                    <span className={`text-xs mr-3 font-sans ${isSelected ? 'font-bold text-nat-accent' : 'text-nat-accent-light'}`}>
                      {idx < 9 ? `0${idx + 1}` : idx + 1}
                    </span>
                    <span className={`text-[13px] tracking-tight ${isSelected ? 'font-bold' : 'italic font-serif text-nat-text-body'}`}>
                      {slide.title.split(":")[0]}
                    </span>
                  </button>
                );
              })}
            </nav>
          </div>

          {/* Prompt/Paper details note */}
          <div className="p-4 rounded-2xl bg-[#E8E6DF] bg-opacity-50 border border-[#DEDBD2] text-[11px] text-nat-accent space-y-1.5">
            <div className="flex items-center gap-1.5 text-nat-text-deep font-bold font-sans uppercase tracking-wider text-[9px]">
              <Award size={14} className="text-nat-accent" />
              <span>Workshop Citation</span>
            </div>
            <p className="leading-relaxed font-sans text-nat-text-body italic">
              Yiran Liu, Eugene Zhao et al. National Research Council Canada / University of Waterloo. SFU 2026.
            </p>
          </div>
        </section>

        {/* MIDDLE COLUMN: LIVE PRESENTATION CANVAS (THE MAIN SLIDE CARD) */}
        <section className="lg:col-span-9 flex flex-col justify-between gap-5">
          
          <div className="flex-1 bg-nat-card border border-nat-border rounded-2xl p-6 md:p-8 flex flex-col justify-between relative overflow-hidden backdrop-blur-sm min-h-[460px] shadow-sm">
            {/* Fine design line highlighting Natural Tones */}
            <div className="absolute top-0 left-0 w-full h-1.5 bg-nat-accent" />

            <AnimatePresence mode="wait">
              <motion.div
                key={currentSlideIndex}
                initial={{ opacity: 0, x: 12 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: -12 }}
                transition={{ duration: 0.2 }}
                className="flex flex-col justify-between h-full"
              >
                {/* SLIDE TOP SECTION */}
                <div>
                  <div className="flex justify-between items-center mb-4">
                    <div className="inline-block px-3 py-1 rounded-full bg-nat-accent text-white text-[10px] font-sans uppercase tracking-tighter">
                      Slide {currentSlideIndex < 9 ? `0${currentSlideIndex + 1}` : currentSlideIndex + 1} / {SLIDES.length}
                    </div>
                    {/* Suggested duration countdown indicator */}
                    <div className={`text-[10px] font-sans flex items-center gap-1 px-2.5 py-0.5 rounded border ${
                      slideSecondsLeft === 0 
                        ? 'border-rose-500/30 text-rose-600 bg-rose-500/5 animate-pulse font-bold' 
                        : 'border-nat-border text-nat-accent-light bg-nat-nested/40'
                    }`}>
                      <Clock size={10} />
                      <span>Rec. Time: {slideSecondsLeft > 0 ? `${slideSecondsLeft}s` : 'Overtime'}</span>
                    </div>
                  </div>

                  {/* Dynamic Slide Header & Subtitle */}
                  <h2 className="text-2xl md:text-3xl font-bold text-nat-text-deep leading-tight mb-2">
                    {currentSlide.title}
                  </h2>
                  
                  {currentSlide.subtitle && (
                    <p className="text-xs md:text-sm text-nat-accent italic leading-relaxed mb-6">
                      &ldquo;{currentSlide.subtitle}&rdquo;
                    </p>
                  )}
                </div>

                {/* THE ATTACHED EMBED DIAGRAM / INTERACTIVE GRAPH */}
                <div className="flex-1 my-2 min-h-[190px]">
                  {/* Dynamic render of matching figures based on presentation structure */}
                  {currentSlide.id === 'title' && (
                    <div className="flex flex-col items-center justify-center p-6 border-2 border-dashed border-[#DEDBD2] bg-[#F2F1ED] rounded-2xl h-full text-center relative overflow-hidden">
                      <div className="absolute inset-0 opacity-10 bg-[radial-gradient(#5a5a40_1px,transparent_1px)] [background-size:16px_16px]" />
                      <div className="w-14 h-14 rounded-full border-2 border-[#8C8C73] flex items-center justify-center mb-4 text-[#8C8C73]">
                        <svg width="24" height="24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                      </div>
                      <div className="text-xs text-nat-text-deep font-sans font-bold uppercase tracking-widest mb-1.5">
                        Elder Care Robotics Symposium
                      </div>
                      <div className="text-[10px] text-nat-accent-light font-sans max-w-[280px] leading-relaxed">
                        Insert Pipeline Overview Figure: &ldquo;Network Architecture and Discrete Style Adaptations&rdquo;
                      </div>
                    </div>
                  )}

                  {currentSlide.id === 'motivation' && <Fig1Overview />}
                  {currentSlide.id === 'pipeline' && <Fig2Artifacts />}
                  {currentSlide.id === 'classification' && <Fig3GeneratedWalking />}
                  {currentSlide.id === 'diffusion' && <Fig3GeneratedWalking />}
                  {currentSlide.id === 'results' && <InteractivePlayground />}
                  {currentSlide.id === 'continuous' && <Fig11ContinuousArchitecture />}
                  {currentSlide.id === 'demo' && <InteractivePlayground />}
                </div>

              </motion.div>
            </AnimatePresence>

            {/* Slide Navigation footer */}
            <div className="mt-6 pt-4 border-t border-nat-border flex items-center justify-between">
              <button 
                onClick={goToPrevSlide}
                disabled={currentSlideIndex === 0}
                className="flex items-center gap-1.5 px-3 py-1.5 bg-nat-nested hover:bg-nat-border border border-nat-border rounded-lg text-xs font-semibold font-sans hover:bg-opacity-80 disabled:opacity-40 disabled:cursor-not-allowed transition-all cursor-pointer text-nat-text-body shadow-sm"
              >
                <ChevronLeft size={16} /> Back
              </button>

              <div className="flex items-center gap-1">
                {SLIDES.map((_, i) => (
                  <button
                    key={i}
                    onClick={() => setCurrentSlideIndex(i)}
                    className={`w-2.5 h-1.5 rounded-full transition-all cursor-pointer ${
                      currentSlideIndex === i ? 'bg-nat-accent w-5' : 'bg-nat-border hover:bg-[#8C8C73]/40'
                    }`}
                  />
                ))}
              </div>

              <button 
                onClick={goToNextSlide}
                disabled={currentSlideIndex === SLIDES.length - 1}
                className="flex items-center gap-1.5 px-3.5 py-1.5 bg-nat-accent text-white hover:opacity-90 rounded-lg text-xs font-semibold font-sans shadow shadow-nat-accent/15 transition-all cursor-pointer"
              >
                Next <ChevronRight size={16} />
              </button>
            </div>
          </div>

          {/* Autoplay controllers bar */}
          <div className="bg-[#F9F8F4] border border-nat-border p-3 rounded-2xl flex items-center justify-between px-4">
            <span className="text-[11px] text-nat-accent-light font-sans tracking-widest font-bold">AUTOPLAY CONTROLS</span>
            <div className="flex items-center gap-4">
              {/* Sound alarm switcher */}
              <button 
                onClick={() => setSoundEnabled(!soundEnabled)}
                className={`flex items-center gap-1 px-2.5 py-1 rounded text-[11px] font-sans font-medium cursor-pointer transition-colors ${
                  soundEnabled ? 'text-nat-accent bg-nat-nested border border-nat-border shadow-sm' : 'text-[#8C8C73]'
                }`}
                title={soundEnabled ? "Mute beep alerts" : "Unmute beep alerts"}
              >
                {soundEnabled ? <Volume2 size={12} /> : <VolumeX size={12} />}
                <span>{soundEnabled ? 'Timer Alert On' : 'Alert Muted'}</span>
              </button>

              {/* Autoplay loop triggers */}
              <button
                onClick={() => setIsPlaying(!isPlaying)}
                className={`flex items-center gap-1.5 px-3 py-1 rounded-lg text-[11px] font-sans font-medium cursor-pointer transition-colors ${
                  isPlaying ? 'bg-nat-accent text-white border border-nat-accent shadow shadow-nat-accent/20' : 'bg-white text-nat-text-body hover:bg-nat-nested border border-nat-border'
                }`}
              >
                {isPlaying ? <Pause size={12} /> : <Play size={12} />}
                <span>{isPlaying ? 'Autoplay On' : 'Autoplay'}</span>
              </button>
            </div>
          </div>
        </section>

      </main>

      {/* FOOTER METRICS AND METADATA */}
      <footer className="border-t border-nat-border bg-nat-card px-6 py-4 flex flex-col md:flex-row items-center justify-between text-xs text-nat-accent-light mt-6 gap-3 shadow-inner">
        <div className="flex items-center gap-2 font-sans">
          <span className="text-[11px] uppercase tracking-wider font-semibold">Session: Elder Care Robotics</span>
          <span className="text-nat-border font-light">|</span>
          <span className="font-mono text-nat-accent font-semibold flex items-center gap-1">
            <span className="w-1.5 h-1.5 rounded-full bg-nat-accent animate-ping" /> Built for Scientific Workshop
          </span>
        </div>
        <div className="flex items-center gap-1.5 font-sans">
          <span>Paper ID: #7822-X</span>
          <span>•</span>
          <span>Google AI Studio Build 2026</span>
        </div>
      </footer>
    </div>
  );
}
