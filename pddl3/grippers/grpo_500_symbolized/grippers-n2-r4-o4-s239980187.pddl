(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_07 obj_08 obj_11 obj_03 - type_3
obj_02 obj_06 obj_12 obj_14 - type_2
obj_01 obj_13 obj_04 obj_10 - object)
(:init
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_08)
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_03)
(pred_2 obj_01 obj_14)
(pred_2 obj_13 obj_06)
(pred_2 obj_04 obj_12)
(pred_2 obj_10 obj_14)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_13 obj_14)
(pred_2 obj_04 obj_12)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_14)))
)
)