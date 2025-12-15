(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_06 obj_02 obj_04 obj_03 obj_01 )
(:init
(pred_4)
(pred_1 obj_05 obj_02)
(pred_1 obj_06 obj_01)
(pred_1 obj_02 obj_04)
(pred_2 obj_04)
(pred_1 obj_03 obj_06)
(pred_1 obj_01 obj_05)
(pred_3 obj_03)
)
(:goal
(and
(pred_2 obj_05)
(pred_2 obj_06)
(pred_2 obj_02)
(pred_1 obj_04 obj_05)
(pred_1 obj_03 obj_06)
(pred_1 obj_01 obj_03))
)

(:constraints
  (sometime-before (pred_2 obj_06) (pred_2 obj_05))
)
)