(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_01 obj_05 obj_03 obj_10 - type_3
obj_11 obj_09 obj_02 obj_06 - type_2
obj_12 obj_07 obj_08 - object)
(:init
(pred_4 obj_04 obj_02)
(pred_1 obj_04 obj_01)
(pred_1 obj_04 obj_05)
(pred_4 obj_13 obj_02)
(pred_1 obj_13 obj_03)
(pred_1 obj_13 obj_10)
(pred_2 obj_12 obj_09)
(pred_2 obj_07 obj_06)
(pred_2 obj_08 obj_11)
)
(:goal
(and
(pred_2 obj_12 obj_06)
(pred_2 obj_07 obj_09)
(pred_2 obj_08 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_06)))
)
)