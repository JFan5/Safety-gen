(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_2
obj_10 obj_07 obj_12 obj_01 - type_3
obj_13 obj_03 obj_08 obj_06 - type_1
obj_11 obj_05 obj_09 obj_14 - object)
(:init
(pred_2 obj_04 obj_08)
(pred_1 obj_04 obj_10)
(pred_1 obj_04 obj_07)
(pred_2 obj_02 obj_03)
(pred_1 obj_02 obj_12)
(pred_1 obj_02 obj_01)
(pred_4 obj_11 obj_13)
(pred_4 obj_05 obj_06)
(pred_4 obj_09 obj_13)
(pred_4 obj_14 obj_06)
)
(:goal
(and
(pred_4 obj_11 obj_08)
(pred_4 obj_05 obj_13)
(pred_4 obj_09 obj_03)
(pred_4 obj_14 obj_13)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_06)))
)
)