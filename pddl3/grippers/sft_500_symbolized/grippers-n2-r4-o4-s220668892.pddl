(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_2
obj_11 obj_02 obj_03 obj_06 - type_1
obj_05 obj_07 obj_04 obj_14 - type_3
obj_09 obj_01 obj_12 obj_08 - object)
(:init
(pred_1 obj_13 obj_14)
(pred_2 obj_13 obj_11)
(pred_2 obj_13 obj_02)
(pred_1 obj_10 obj_07)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_06)
(pred_3 obj_09 obj_07)
(pred_3 obj_01 obj_04)
(pred_3 obj_12 obj_14)
(pred_3 obj_08 obj_05)
)
(:goal
(and
(pred_3 obj_09 obj_05)
(pred_3 obj_01 obj_07)
(pred_3 obj_12 obj_05)
(pred_3 obj_08 obj_14)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_04)))
)
)