(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_02 obj_01 obj_04 obj_05 obj_03 )
(:init
(pred_5)
(pred_4 obj_02)
(pred_3 obj_01 obj_02)
(pred_3 obj_04 obj_03)
(pred_4 obj_05)
(pred_4 obj_03)
(pred_1 obj_01)
(pred_1 obj_04)
(pred_1 obj_05)
)
(:goal
(and
(pred_3 obj_02 obj_04)
(pred_3 obj_04 obj_05)
(pred_3 obj_05 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_04 obj_05) (pred_3 obj_02 obj_04))
)
)