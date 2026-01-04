(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_06 obj_04 obj_03 obj_01 obj_05 obj_02 )
(:init
(pred_4)
(pred_3 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_03 obj_02)
(pred_3 obj_01)
(pred_2 obj_05 obj_04)
(pred_2 obj_02 obj_05)
(pred_1 obj_06)
(pred_1 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_04 obj_06)
(pred_2 obj_01 obj_05)
(pred_2 obj_05 obj_03)
(pred_2 obj_02 obj_01))
)

(:constraints
  (sometime-before (pred_2 obj_04 obj_06) (pred_2 obj_06 obj_02))
)
)