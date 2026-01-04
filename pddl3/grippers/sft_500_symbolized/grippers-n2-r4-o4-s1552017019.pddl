(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_11 - type_3
obj_03 obj_08 obj_10 obj_02 - type_1
obj_05 obj_01 obj_14 obj_07 - type_2
obj_04 obj_12 obj_13 obj_09 - object)
(:init
(pred_4 obj_06 obj_05)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_08)
(pred_4 obj_11 obj_05)
(pred_3 obj_11 obj_10)
(pred_3 obj_11 obj_02)
(pred_1 obj_04 obj_05)
(pred_1 obj_12 obj_14)
(pred_1 obj_13 obj_05)
(pred_1 obj_09 obj_07)
)
(:goal
(and
(pred_1 obj_04 obj_07)
(pred_1 obj_12 obj_05)
(pred_1 obj_13 obj_14)
(pred_1 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_06 obj_14)))
)
)