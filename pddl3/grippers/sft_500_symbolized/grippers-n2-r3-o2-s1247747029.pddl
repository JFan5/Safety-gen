(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_11 obj_06 obj_09 obj_05 - type_2
obj_07 obj_02 obj_10 - type_3
obj_03 obj_04 - object)
(:init
(pred_1 obj_08 obj_02)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_06)
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_03 obj_10)
(pred_2 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_10)))
)
)