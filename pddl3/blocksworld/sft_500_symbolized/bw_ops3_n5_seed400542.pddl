(define (problem BW-rand-5)
(:domain blocksworld)
(:objects obj_03 obj_01 obj_02 obj_05 obj_04 )
(:init
(pred_1)
(pred_4 obj_03 obj_05)
(pred_4 obj_01 obj_02)
(pred_4 obj_02 obj_04)
(pred_4 obj_05 obj_01)
(pred_3 obj_04)
(pred_5 obj_03)
)
(:goal
(and
(pred_4 obj_03 obj_01)
(pred_3 obj_01)
(pred_4 obj_02 obj_04)
(pred_3 obj_05)
(pred_4 obj_04 obj_05))
)

(:constraints
  (sometime-before (pred_3 obj_01) (pred_4 obj_03 obj_01))
)
)