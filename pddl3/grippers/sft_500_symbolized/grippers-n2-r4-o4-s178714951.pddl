(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_1
obj_01 obj_14 obj_11 obj_08 - type_2
obj_10 obj_07 obj_13 obj_06 - type_3
obj_02 obj_04 obj_05 obj_09 - object)
(:init
(pred_1 obj_12 obj_10)
(pred_3 obj_12 obj_01)
(pred_3 obj_12 obj_14)
(pred_1 obj_03 obj_07)
(pred_3 obj_03 obj_11)
(pred_3 obj_03 obj_08)
(pred_2 obj_02 obj_10)
(pred_2 obj_04 obj_07)
(pred_2 obj_05 obj_06)
(pred_2 obj_09 obj_06)
)
(:goal
(and
(pred_2 obj_02 obj_13)
(pred_2 obj_04 obj_06)
(pred_2 obj_05 obj_13)
(pred_2 obj_09 obj_13)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_13)))
)
)