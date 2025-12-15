(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_06 - type_1
obj_10 obj_12 obj_05 obj_13 - type_3
obj_04 obj_02 obj_01 obj_07 - type_2
obj_03 obj_09 obj_14 obj_11 - object)
(:init
(pred_3 obj_08 obj_07)
(pred_4 obj_08 obj_10)
(pred_4 obj_08 obj_12)
(pred_3 obj_06 obj_01)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_13)
(pred_2 obj_03 obj_04)
(pred_2 obj_09 obj_02)
(pred_2 obj_14 obj_02)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_03 obj_07)
(pred_2 obj_09 obj_01)
(pred_2 obj_14 obj_04)
(pred_2 obj_11 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_01)))
)
)