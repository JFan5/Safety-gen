(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_2
obj_12 obj_07 obj_02 obj_10 - type_3
obj_06 obj_05 obj_03 obj_14 - type_1
obj_04 obj_13 obj_08 obj_09 - object)
(:init
(pred_4 obj_11 obj_03)
(pred_1 obj_11 obj_12)
(pred_1 obj_11 obj_07)
(pred_4 obj_01 obj_05)
(pred_1 obj_01 obj_02)
(pred_1 obj_01 obj_10)
(pred_3 obj_04 obj_03)
(pred_3 obj_13 obj_05)
(pred_3 obj_08 obj_06)
(pred_3 obj_09 obj_05)
)
(:goal
(and
(pred_3 obj_04 obj_14)
(pred_3 obj_13 obj_06)
(pred_3 obj_08 obj_14)
(pred_3 obj_09 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_14)))
)
)