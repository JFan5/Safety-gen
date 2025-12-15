(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_05 - type_3
obj_12 obj_08 obj_11 obj_07 - type_1
obj_01 obj_14 obj_13 obj_10 - type_2
obj_09 obj_04 obj_02 obj_03 - object)
(:init
(pred_2 obj_06 obj_10)
(pred_4 obj_06 obj_12)
(pred_4 obj_06 obj_08)
(pred_2 obj_05 obj_10)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_07)
(pred_1 obj_09 obj_13)
(pred_1 obj_04 obj_14)
(pred_1 obj_02 obj_14)
(pred_1 obj_03 obj_14)
)
(:goal
(and
(pred_1 obj_09 obj_14)
(pred_1 obj_04 obj_13)
(pred_1 obj_02 obj_14)
(pred_1 obj_03 obj_14)
)
)

(:constraints
  (always (not (pred_2 obj_06 obj_13)))
)
)