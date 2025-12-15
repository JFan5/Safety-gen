(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_03 obj_06 obj_05 obj_02 obj_01 )
(:init
(pred_2)
(pred_1 obj_04)
(pred_5 obj_03 obj_02)
(pred_1 obj_06)
(pred_1 obj_05)
(pred_5 obj_02 obj_04)
(pred_5 obj_01 obj_03)
(pred_3 obj_06)
(pred_3 obj_05)
(pred_3 obj_01)
)
(:goal
(and
(pred_5 obj_04 obj_06)
(pred_1 obj_03)
(pred_5 obj_06 obj_05)
(pred_5 obj_05 obj_03)
(pred_5 obj_02 obj_01)
(pred_1 obj_01))
)

(:constraints
  (sometime-before (pred_1 obj_03) (pred_5 obj_04 obj_06))
)
)