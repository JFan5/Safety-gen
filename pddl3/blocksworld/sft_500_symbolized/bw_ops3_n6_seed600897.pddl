(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_05 obj_06 obj_03 obj_01 obj_04 obj_02 )
(:init
(pred_3)
(pred_4 obj_05)
(pred_1 obj_06 obj_04)
(pred_1 obj_03 obj_01)
(pred_1 obj_01 obj_06)
(pred_4 obj_04)
(pred_1 obj_02 obj_03)
(pred_2 obj_05)
(pred_2 obj_02)
)
(:goal
(and
(pred_1 obj_05 obj_04)
(pred_1 obj_06 obj_02)
(pred_4 obj_03)
(pred_4 obj_01)
(pred_1 obj_04 obj_06)
(pred_4 obj_02))
)

(:constraints
  (sometime-before (pred_1 obj_06 obj_02) (pred_1 obj_05 obj_04))
)
)