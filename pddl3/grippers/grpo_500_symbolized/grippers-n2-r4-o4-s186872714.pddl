(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_02 obj_06 obj_12 obj_13 - type_3
obj_07 obj_01 obj_04 obj_03 - type_2
obj_14 obj_08 obj_05 obj_10 - object)
(:init
(pred_3 obj_09 obj_01)
(pred_4 obj_09 obj_02)
(pred_4 obj_09 obj_06)
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_12)
(pred_4 obj_11 obj_13)
(pred_2 obj_14 obj_04)
(pred_2 obj_08 obj_01)
(pred_2 obj_05 obj_04)
(pred_2 obj_10 obj_04)
)
(:goal
(and
(pred_2 obj_14 obj_07)
(pred_2 obj_08 obj_04)
(pred_2 obj_05 obj_03)
(pred_2 obj_10 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_04)))
)
)