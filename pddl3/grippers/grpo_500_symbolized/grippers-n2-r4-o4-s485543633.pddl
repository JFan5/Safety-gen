(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_1
obj_10 obj_11 obj_05 obj_07 - type_3
obj_02 obj_13 obj_01 obj_14 - type_2
obj_09 obj_06 obj_08 obj_04 - object)
(:init
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_11)
(pred_3 obj_03 obj_14)
(pred_4 obj_03 obj_05)
(pred_4 obj_03 obj_07)
(pred_2 obj_09 obj_14)
(pred_2 obj_06 obj_14)
(pred_2 obj_08 obj_13)
(pred_2 obj_04 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_02)
(pred_2 obj_06 obj_14)
(pred_2 obj_08 obj_01)
(pred_2 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_01)))
)
)