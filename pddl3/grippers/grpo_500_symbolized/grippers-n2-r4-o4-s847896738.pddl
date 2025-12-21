(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_07 obj_10 obj_13 obj_03 - type_3
obj_14 obj_01 obj_08 obj_06 - type_2
obj_09 obj_05 obj_11 obj_12 - object)
(:init
(pred_4 obj_04 obj_06)
(pred_2 obj_04 obj_07)
(pred_2 obj_04 obj_10)
(pred_4 obj_02 obj_06)
(pred_2 obj_02 obj_13)
(pred_2 obj_02 obj_03)
(pred_3 obj_09 obj_14)
(pred_3 obj_05 obj_01)
(pred_3 obj_11 obj_08)
(pred_3 obj_12 obj_08)
)
(:goal
(and
(pred_3 obj_09 obj_01)
(pred_3 obj_05 obj_06)
(pred_3 obj_11 obj_08)
(pred_3 obj_12 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_08)))
)
)