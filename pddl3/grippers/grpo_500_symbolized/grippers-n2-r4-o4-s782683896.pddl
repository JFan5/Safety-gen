(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_14 - type_1
obj_05 obj_09 obj_02 obj_07 - type_3
obj_03 obj_12 obj_01 obj_08 - type_2
obj_10 obj_06 obj_04 obj_11 - object)
(:init
(pred_3 obj_13 obj_08)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_09)
(pred_3 obj_14 obj_01)
(pred_4 obj_14 obj_02)
(pred_4 obj_14 obj_07)
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_01)
(pred_2 obj_04 obj_08)
(pred_2 obj_11 obj_12)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_06 obj_12)
(pred_2 obj_04 obj_08)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_01)))
)
)