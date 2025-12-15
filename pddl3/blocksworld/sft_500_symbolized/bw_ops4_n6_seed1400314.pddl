(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_02 obj_06 obj_01 obj_04 obj_03 obj_05 )
(:init
(pred_2)
(pred_5 obj_02)
(pred_5 obj_06)
(pred_5 obj_01)
(pred_1 obj_04 obj_03)
(pred_1 obj_03 obj_06)
(pred_1 obj_05 obj_04)
(pred_3 obj_02)
(pred_3 obj_01)
(pred_3 obj_05)
)
(:goal
(and
(pred_1 obj_02 obj_06)
(pred_1 obj_01 obj_03)
(pred_1 obj_03 obj_02)
(pred_1 obj_05 obj_04))
)

(:constraints
  (sometime-before (pred_1 obj_01 obj_03) (pred_1 obj_02 obj_06))
)
)