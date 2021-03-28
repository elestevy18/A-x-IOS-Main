//
//  FormVideosViewController.swift
//  AofX
//
//  Created by Kevin Jimenez on 7/24/20.
//  Copyright © 2020 Aesthet(X). All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class FormVideosViewController: UIViewController {
    
    struct Keys {
          static let formExercise = "formExercise"
    }
    
    let defaults = UserDefaults.standard

   @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet var comingSoonTxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set logo in navigation bar and make it clickable
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "aesthetx30times100")
        imageView.image = image
        navigationItem.titleView = imageView
     
        
        playerView.load(withVideoId: "")
        
        let formExercise = defaults.string(forKey: Save.formExercise)
                  if(formExercise == "Wide Dips"){
                  playerView.load(withVideoId: "Moq1BCGK4Lw")
                      } else if(formExercise == "Triceps Extension"){
                       playerView.load(withVideoId: "8whmJOXcZ1Y")
                      } else if(formExercise == "Floor T's"){
                       playerView.load(withVideoId: "pv_u_2_IGBw")
                      } else if(formExercise == "Pike Push-Up"){
                        playerView.load(withVideoId: "8FwycN03rrc")
                    } else if(formExercise == "Narrow Push-Ups"){
                         playerView.load(withVideoId: "s5E5YnRUk7g")
                      } else if(formExercise == "Frog Pumps"){
                          playerView.load(withVideoId: "FymYDPt5psw")
                      } else if(formExercise == "Glute Side Plank"){
                        playerView.load(withVideoId: "LCj8D0_yuXM")
                      }  else if(formExercise == "Plank Protraction"){
                         playerView.load(withVideoId: "NVBCvWCH-Xk")
                      } else if(formExercise == "Bench Dip"){
                         playerView.load(withVideoId: "JyGZX37E0mM")
                      } else if(formExercise == "Bodyweight Hip Thrusts"){
                         playerView.load(withVideoId: "_nr6aZHGvzs")
                      } else if(formExercise == "Pistol Squats"){
                         playerView.load(withVideoId: "V1HPRx20UWI")
                      } else if(formExercise == "Medicine Ball Curl" || formExercise == "Single Leg Medicine Ball Curl"){
                          playerView.load(withVideoId: "pmRNG8gqb4M")
                      } else if(formExercise == "Bulgarian Split Squat"){
                        playerView.load(withVideoId: "aqD_VHZGwnI")
                      } else if(formExercise == "Isolateral Hip Thrust"){
                         playerView.load(withVideoId: "3X22W5LF_dg")
                      } else if(formExercise == "Narrow Dip"){
                         playerView.load(withVideoId: "l9uZMZe956Y")
                      } else if(formExercise == "Bodyweight Calf Raises"){
                         playerView.load(withVideoId: "yD8gU2VF2Ss")
                      } else if(formExercise == "Banded External Rotation"){
                        playerView.load(withVideoId: "YuuO--Jgr7g")
                      } else if(formExercise == "Banded Lateral Raise"){
                        playerView.load(withVideoId: "SynWWcbYNP4")
                      } else if(formExercise == "Ring Curls"){
                        playerView.load(withVideoId: "bGgSZoer8kY")
                      } else if(formExercise == "Ring Facepulls"){
                         playerView.load(withVideoId: "g6pjBpIefO0")
                      } else if(formExercise == "Australian Pull Ups"){
                         playerView.load(withVideoId: "cfwJwDGSLSk")
                      } else if(formExercise == "Banded Curls"){
                        playerView.load(withVideoId: "cBXCnzsLnWU")
                      } else if(formExercise == "Push-Ups"){
                         playerView.load(withVideoId: "VFrawqzaOrU")
                      } else if(formExercise == "Banded Radial Deviation"){
                        playerView.load(withVideoId: "THOfJxwV7SE")
                      } else if(formExercise == "Banded Ulnar Deviation"){
                        playerView.load(withVideoId: "36WDREF0Jyw")
                      } else if(formExercise == "X-Crunch"){
                        playerView.load(withVideoId: "l1Z7oV_fKVQ")
                      } else if(formExercise == "Elbow to Knee Tucks"){
                        playerView.load(withVideoId: "Kcp1ccoAuRE")
                      } else if(formExercise == "Elbow to Knee Plank"){
                        playerView.load(withVideoId: "uaPS61wnVmU")
                      } else if(formExercise == "Neck Flexion"){
                        playerView.load(withVideoId: "FdgmK-NFS-o")
                      } else if(formExercise == "Head Floats"){
                        playerView.load(withVideoId: "NMEtGVa_0Ww")
                      } else if(formExercise == "Rotating Plank"){
                        playerView.load(withVideoId: "UZG_cPmYJ5I")
                      }  else if(formExercise == "Inverted Y"){
                        playerView.load(withVideoId: "Vh1-wgH5eHc")
                      } else if(formExercise == "Banded/Cable Punches"){
                        playerView.load(withVideoId: "BGyltYpvWFg")
                      } else if(formExercise == "Banded/Cable Step Out"){
                        playerView.load(withVideoId: "tdPSOgQPqJ0")
                      } else if(formExercise == "Delt Rotating Plank"){
                        playerView.load(withVideoId: "-KGhPCbB--8")
                      } else if(formExercise == "Step Out"){
                        playerView.load(withVideoId: "tdPSOgQPqJ0")
                    } else if(formExercise == "Chin Ups"){
                        playerView.load(withVideoId: "aEOQukzpFlE")
                    } else if(formExercise == "Hanging/Cable Scapular Retraction"){
                        playerView.load(withVideoId: "O6-RzTv3V-8")
                    } else if(formExercise == "Lunges"){
                        playerView.load(withVideoId: "u50G6LTez18")
                    } else if(formExercise == "Pull Ups"){
                        playerView.load(withVideoId: "KZNUmi4HUEw")
                    } else if(formExercise == "Ab Rollout"){
                        playerView.load(withVideoId: "v2ZsQZ5r4fY")
                    } else if(formExercise == "Reverse Crunches"){
                        playerView.load(withVideoId: "b75AEyaldtQ")
                    } else if(formExercise == "Narrow Dips"){
                        playerView.load(withVideoId: "Chetx8yStEQ")
                    } else if(formExercise == "Ring Overhead Extension"){
                        playerView.load(withVideoId: "QudG9MM9kTM")
                    } else if(formExercise == "Banded Wrist Extension"){
                        playerView.load(withVideoId: "hhdA2ue_YNM")
                    } else if(formExercise == "Banded Wrist Curls"){
                    playerView.load(withVideoId: "QFIh1R8qdKI")
                    } else if(formExercise == "Twisting Leg Raise"){
                        playerView.load(withVideoId: "R5RSp_Cho0c")
                    } else if(formExercise == "Pulse Up"){
                        playerView.load(withVideoId: "iwpMDdWlEnw")
                    } else if(formExercise == "Ab Circles"){
                        playerView.load(withVideoId: "3LSKACe2F7E")
                    } else if(formExercise == "Banded Abduction"){
                       playerView.load(withVideoId: "hTqVJaJaJRs")
                      } else if(formExercise == "Angels of Death"){
                       playerView.load(withVideoId: "9Yyvg8EdspY")
                      } else if(formExercise == "Banded Lunges"){
                        playerView.load(withVideoId: "ATNg5-5qdoQ")
                    } else if(formExercise == "Band Crunch"){
                         playerView.load(withVideoId: "Vs_puPKJi9w")
                      } else if(formExercise == "Marching Bridge"){
                          playerView.load(withVideoId: "yMBgIPe9mGg")
                      } else if(formExercise == "Banded Pull Aparts"){
                        playerView.load(withVideoId: "qi4XGl13k6c")
                      }  else if(formExercise == "Side Lunge"){
                         playerView.load(withVideoId: "TQxXTqsiT6c")
                      } else if(formExercise == "Trap Pushaway"){
                         playerView.load(withVideoId: "-sF7UqnSXs4")
                      } else if(formExercise == "Wall Sit"){
                         playerView.load(withVideoId: "dHokoZdtItE")
                      } else if(formExercise == "Reverse Hyperextension"){
                         playerView.load(withVideoId: "QiBJfLM2cbg")
                      } else if(formExercise == "V-Up"){
                          playerView.load(withVideoId: "zcCjIj2RvT0")
                      } else if(formExercise == "Bodyweight Squats"){
                        playerView.load(withVideoId: "bqbo3HK6WmA")
                      } else if(formExercise == "Front Levers"){
                         playerView.load(withVideoId: "nkaoBpEUHcE")
                      } else if(formExercise == "Protracted Rollout"){
                         playerView.load(withVideoId: "gUf55L3dNJI")
                      } else if(formExercise == "Leg Raise Scissors"){
                         playerView.load(withVideoId: "Rnv2JPnrqH0")
                      } else if(formExercise == "Banded RDL"){
                        playerView.load(withVideoId: "ntrUI6lK3TU")
                      } else if(formExercise == "Sprinter Lunge"){
                        playerView.load(withVideoId: "I6HKbEaUDBs")
                      } else if(formExercise == "Handstand Push-Up"){
                        playerView.load(withVideoId: "rXYfOoUiyVg")
                      } else if(formExercise == "Twisting Pulse Up"){
                         playerView.load(withVideoId: "iGLQ-58_Ge8")
                      } else if(formExercise == "Vacuums"){
                         playerView.load(withVideoId: "9iLc6C7QsxM")
                      } else if(formExercise == "Leg Raises"){
                        playerView.load(withVideoId: "2AWPQ164pAs")
                      } else if(formExercise == "Floor/Dip Bar Scapular Depression"){
                        playerView.load(withVideoId: "")
                      } else {
                        comingSoonTxt.text = "Form video coming soon. Please support the app to keep us working."
                      }
    }
    
}
