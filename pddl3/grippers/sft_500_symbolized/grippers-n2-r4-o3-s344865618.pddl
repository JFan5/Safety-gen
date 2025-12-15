(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_08 - type_3
obj_01 obj_12 obj_07 obj_05 - type_1
obj_06 obj_03 obj_02 obj_10 - type_2
obj_13 obj_04 obj_11 - object)
(:init
(pred_2 obj_09 obj_02)
(pred_1 obj_09 obj_01)
(pred_1 obj_09 obj_12)
(pred_2 obj_08 obj_02)
(pred_1 obj_08 obj_07)
(pred_1 obj_08 obj_05)
(pred_4 obj_13 obj_02)
(pred_4 obj_04 obj_03)
(pred_4 obj_11 obj_03)
)
(:goal
(and
(pred_4 obj_13 obj_06)
(pred_4 obj_04 obj_03)
(pred_4 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_09 obj_06)))
)
)