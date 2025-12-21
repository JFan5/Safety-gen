(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_1
obj_11 obj_12 obj_02 obj_06 - type_3
obj_05 obj_08 obj_14 obj_03 - type_2
obj_13 obj_01 obj_10 obj_09 - object)
(:init
(pred_4 obj_07 obj_05)
(pred_2 obj_07 obj_11)
(pred_2 obj_07 obj_12)
(pred_4 obj_04 obj_08)
(pred_2 obj_04 obj_02)
(pred_2 obj_04 obj_06)
(pred_3 obj_13 obj_14)
(pred_3 obj_01 obj_14)
(pred_3 obj_10 obj_14)
(pred_3 obj_09 obj_03)
)
(:goal
(and
(pred_3 obj_13 obj_03)
(pred_3 obj_01 obj_14)
(pred_3 obj_10 obj_03)
(pred_3 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_14)))
)
)