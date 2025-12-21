(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_03 - type_1
obj_06 obj_02 obj_10 obj_05 - type_2
obj_13 obj_12 obj_04 obj_09 - type_3
obj_07 obj_11 obj_08 - object)
(:init
(pred_1 obj_01 obj_04)
(pred_3 obj_01 obj_06)
(pred_3 obj_01 obj_02)
(pred_1 obj_03 obj_13)
(pred_3 obj_03 obj_10)
(pred_3 obj_03 obj_05)
(pred_2 obj_07 obj_04)
(pred_2 obj_11 obj_09)
(pred_2 obj_08 obj_12)
)
(:goal
(and
(pred_2 obj_07 obj_09)
(pred_2 obj_11 obj_13)
(pred_2 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_09)))
)
)