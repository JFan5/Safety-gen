(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_01 obj_06 obj_03 obj_04 obj_02 )
(:init
(pred_3)
(pred_1 obj_05 obj_06)
(pred_1 obj_01 obj_03)
(pred_2 obj_06)
(pred_1 obj_03 obj_05)
(pred_1 obj_04 obj_01)
(pred_1 obj_02 obj_04)
(pred_5 obj_02)
)
(:goal
(and
(pred_1 obj_05 obj_04)
(pred_2 obj_01)
(pred_1 obj_06 obj_03)
(pred_2 obj_03)
(pred_1 obj_04 obj_06)
(pred_1 obj_02 obj_01))
)

(:constraints
  (sometime-before (pred_2 obj_01) (pred_1 obj_05 obj_04))
)
)