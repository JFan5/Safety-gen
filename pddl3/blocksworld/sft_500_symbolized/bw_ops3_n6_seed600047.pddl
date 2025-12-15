(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_04 obj_03 obj_01 obj_06 obj_02 )
(:init
(pred_5)
(pred_3 obj_05 obj_04)
(pred_3 obj_04 obj_01)
(pred_4 obj_03)
(pred_4 obj_01)
(pred_4 obj_06)
(pred_3 obj_02 obj_05)
(pred_2 obj_03)
(pred_2 obj_06)
(pred_2 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_01)
(pred_3 obj_04 obj_05)
(pred_4 obj_03)
(pred_3 obj_01 obj_03)
(pred_4 obj_06)
(pred_4 obj_02))
)

(:constraints
  (sometime-before (pred_3 obj_04 obj_05) (pred_3 obj_05 obj_01))
)
)