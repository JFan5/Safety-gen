(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_13 obj_05 obj_06 obj_08 - type_3
obj_04 obj_07 obj_03 obj_01 - type_2
obj_10 obj_14 obj_11 obj_02 - object)
(:init
(pred_3 obj_12 obj_04)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_05)
(pred_3 obj_09 obj_03)
(pred_4 obj_09 obj_06)
(pred_4 obj_09 obj_08)
(pred_2 obj_10 obj_04)
(pred_2 obj_14 obj_01)
(pred_2 obj_11 obj_04)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_14 obj_01)
(pred_2 obj_11 obj_01)
(pred_2 obj_02 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_03)))
)
)