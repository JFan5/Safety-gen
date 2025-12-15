(define (problem BW-rand-4)
(:domain blocksworld)
(:objects obj_02 obj_04 obj_03 obj_01 )
(:init
(pred_4)
(pred_3 obj_02 obj_01)
(pred_3 obj_04 obj_03)
(pred_5 obj_03)
(pred_5 obj_01)
(pred_2 obj_02)
(pred_2 obj_04)
)
(:goal
(and
(pred_3 obj_02 obj_03)
(pred_5 obj_04)
(pred_3 obj_03 obj_04)
(pred_5 obj_01))
)

(:constraints
  (sometime-before (pred_5 obj_04) (pred_3 obj_02 obj_03))
)
)