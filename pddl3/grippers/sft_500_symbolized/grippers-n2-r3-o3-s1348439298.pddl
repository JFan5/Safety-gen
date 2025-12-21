(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_12 - type_1
obj_06 obj_11 obj_03 obj_10 - type_2
obj_05 obj_02 obj_09 - type_3
obj_04 obj_07 obj_01 - object)
(:init
(pred_1 obj_08 obj_02)
(pred_3 obj_08 obj_06)
(pred_3 obj_08 obj_11)
(pred_1 obj_12 obj_02)
(pred_3 obj_12 obj_03)
(pred_3 obj_12 obj_10)
(pred_2 obj_04 obj_05)
(pred_2 obj_07 obj_05)
(pred_2 obj_01 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_07 obj_05)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_09)))
)
)