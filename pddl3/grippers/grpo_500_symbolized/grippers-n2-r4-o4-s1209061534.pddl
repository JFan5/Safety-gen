(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_02 obj_01 obj_03 obj_13 - type_3
obj_06 obj_05 obj_04 obj_07 - type_2
obj_12 obj_08 obj_14 obj_11 - object)
(:init
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_02)
(pred_4 obj_10 obj_01)
(pred_3 obj_09 obj_05)
(pred_4 obj_09 obj_03)
(pred_4 obj_09 obj_13)
(pred_2 obj_12 obj_06)
(pred_2 obj_08 obj_05)
(pred_2 obj_14 obj_04)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_12 obj_05)
(pred_2 obj_08 obj_06)
(pred_2 obj_14 obj_07)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_04)))
)
)