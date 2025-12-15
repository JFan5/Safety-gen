(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_10 obj_01 obj_09 obj_03 - type_3
obj_02 obj_13 obj_04 obj_05 - type_2
obj_08 obj_11 obj_06 - object)
(:init
(pred_3 obj_12 obj_05)
(pred_4 obj_12 obj_10)
(pred_4 obj_12 obj_01)
(pred_3 obj_07 obj_05)
(pred_4 obj_07 obj_09)
(pred_4 obj_07 obj_03)
(pred_2 obj_08 obj_13)
(pred_2 obj_11 obj_04)
(pred_2 obj_06 obj_04)
)
(:goal
(and
(pred_2 obj_08 obj_04)
(pred_2 obj_11 obj_13)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)