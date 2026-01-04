(define (problem BW-rand-6)
(:domain blocksworld)
(:objects obj_04 obj_05 obj_03 obj_02 obj_01 obj_06 )
(:init
(pred_4)
(pred_3 obj_04 obj_03)
(pred_3 obj_05 obj_06)
(pred_3 obj_03 obj_05)
(pred_3 obj_02 obj_01)
(pred_5 obj_01)
(pred_5 obj_06)
(pred_1 obj_04)
(pred_1 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_05)
(pred_3 obj_05 obj_01)
(pred_3 obj_03 obj_06)
(pred_3 obj_02 obj_03))
)

(:constraints
  (sometime-before (pred_3 obj_05 obj_01) (pred_3 obj_04 obj_05))
)
)