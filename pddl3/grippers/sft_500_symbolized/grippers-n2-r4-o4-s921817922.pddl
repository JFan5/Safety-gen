(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_14 - type_1
obj_12 obj_11 obj_08 obj_02 - type_2
obj_03 obj_01 obj_06 obj_04 - type_3
obj_05 obj_13 obj_10 obj_09 - object)
(:init
(pred_4 obj_07 obj_04)
(pred_1 obj_07 obj_12)
(pred_1 obj_07 obj_11)
(pred_4 obj_14 obj_01)
(pred_1 obj_14 obj_08)
(pred_1 obj_14 obj_02)
(pred_2 obj_05 obj_01)
(pred_2 obj_13 obj_04)
(pred_2 obj_10 obj_06)
(pred_2 obj_09 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_13 obj_04)
(pred_2 obj_10 obj_04)
(pred_2 obj_09 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_06)))
)
)