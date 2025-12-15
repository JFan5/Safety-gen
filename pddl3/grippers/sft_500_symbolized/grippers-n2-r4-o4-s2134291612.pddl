(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_10 - type_1
obj_05 obj_03 obj_01 obj_13 - type_3
obj_02 obj_14 obj_04 obj_11 - type_2
obj_09 obj_06 obj_07 obj_08 - object)
(:init
(pred_4 obj_12 obj_14)
(pred_3 obj_12 obj_05)
(pred_3 obj_12 obj_03)
(pred_4 obj_10 obj_02)
(pred_3 obj_10 obj_01)
(pred_3 obj_10 obj_13)
(pred_2 obj_09 obj_14)
(pred_2 obj_06 obj_04)
(pred_2 obj_07 obj_14)
(pred_2 obj_08 obj_14)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_06 obj_04)
(pred_2 obj_07 obj_02)
(pred_2 obj_08 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_04)))
)
)