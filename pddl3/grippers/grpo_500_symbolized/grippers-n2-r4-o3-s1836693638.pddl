(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_01 obj_06 obj_13 obj_07 - type_3
obj_10 obj_05 obj_03 obj_04 - type_2
obj_12 obj_02 obj_08 - object)
(:init
(pred_3 obj_11 obj_03)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_06)
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_13)
(pred_4 obj_09 obj_07)
(pred_2 obj_12 obj_04)
(pred_2 obj_02 obj_05)
(pred_2 obj_08 obj_04)
)
(:goal
(and
(pred_2 obj_12 obj_03)
(pred_2 obj_02 obj_03)
(pred_2 obj_08 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_04)))
)
)