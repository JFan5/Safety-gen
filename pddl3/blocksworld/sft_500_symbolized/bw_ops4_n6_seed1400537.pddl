(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_01 obj_03 obj_02 obj_06 obj_05 )
(:init
(pred_3)
(pred_2 obj_04)
(pred_1 obj_01 obj_02)
(pred_1 obj_03 obj_01)
(pred_1 obj_02 obj_05)
(pred_1 obj_06 obj_03)
(pred_2 obj_05)
(pred_4 obj_04)
(pred_4 obj_06)
)
(:goal
(and
(pred_1 obj_04 obj_02)
(pred_1 obj_01 obj_04)
(pred_1 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_1 obj_01 obj_04) (pred_1 obj_04 obj_02))
)
)