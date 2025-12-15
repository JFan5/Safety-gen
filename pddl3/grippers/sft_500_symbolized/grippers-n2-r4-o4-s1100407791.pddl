(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_3
obj_08 obj_02 obj_10 obj_14 - type_2
obj_12 obj_05 obj_07 obj_01 - type_1
obj_06 obj_09 obj_04 obj_13 - object)
(:init
(pred_1 obj_11 obj_07)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_02)
(pred_1 obj_03 obj_12)
(pred_2 obj_03 obj_10)
(pred_2 obj_03 obj_14)
(pred_3 obj_06 obj_12)
(pred_3 obj_09 obj_07)
(pred_3 obj_04 obj_01)
(pred_3 obj_13 obj_12)
)
(:goal
(and
(pred_3 obj_06 obj_05)
(pred_3 obj_09 obj_05)
(pred_3 obj_04 obj_05)
(pred_3 obj_13 obj_01)
)
)

(:constraints
  (always (not (pred_1 obj_11 obj_01)))
)
)