(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_02 obj_06 obj_05 obj_04 obj_03 obj_01 )
(:init
(pred_2)
(pred_1 obj_02)
(pred_4 obj_06 obj_04)
(pred_4 obj_05 obj_06)
(pred_4 obj_04 obj_01)
(pred_4 obj_03 obj_05)
(pred_4 obj_01 obj_02)
(pred_3 obj_03)
)
(:goal
(and
(pred_4 obj_02 obj_01)
(pred_1 obj_06)
(pred_1 obj_05)
(pred_1 obj_04)
(pred_4 obj_03 obj_05)
(pred_4 obj_01 obj_04))
)

(:constraints
  (sometime-before (pred_1 obj_06) (pred_4 obj_02 obj_01))
)
)