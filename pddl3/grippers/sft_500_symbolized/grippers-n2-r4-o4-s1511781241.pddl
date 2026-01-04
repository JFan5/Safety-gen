(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_05 - type_2
obj_14 obj_07 obj_03 obj_09 - type_3
obj_12 obj_10 obj_13 obj_11 - type_1
obj_02 obj_04 obj_01 obj_06 - object)
(:init
(pred_3 obj_08 obj_12)
(pred_1 obj_08 obj_14)
(pred_1 obj_08 obj_07)
(pred_3 obj_05 obj_10)
(pred_1 obj_05 obj_03)
(pred_1 obj_05 obj_09)
(pred_4 obj_02 obj_13)
(pred_4 obj_04 obj_12)
(pred_4 obj_01 obj_13)
(pred_4 obj_06 obj_11)
)
(:goal
(and
(pred_4 obj_02 obj_10)
(pred_4 obj_04 obj_12)
(pred_4 obj_01 obj_13)
(pred_4 obj_06 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_13)))
)
)