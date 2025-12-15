(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_13 obj_04 obj_03 obj_01 - type_3
obj_02 obj_12 obj_05 obj_11 - type_2
obj_08 obj_10 obj_07 - object)
(:init
(pred_3 obj_09 obj_05)
(pred_4 obj_09 obj_13)
(pred_4 obj_09 obj_04)
(pred_3 obj_06 obj_12)
(pred_4 obj_06 obj_03)
(pred_4 obj_06 obj_01)
(pred_2 obj_08 obj_05)
(pred_2 obj_10 obj_02)
(pred_2 obj_07 obj_05)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_10 obj_05)
(pred_2 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_11)))
)
)