(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_14 - type_3
obj_07 obj_08 obj_11 obj_03 - type_1
obj_12 obj_01 obj_10 obj_05 - type_2
obj_02 obj_06 obj_13 obj_09 - object)
(:init
(pred_2 obj_04 obj_05)
(pred_1 obj_04 obj_07)
(pred_1 obj_04 obj_08)
(pred_2 obj_14 obj_05)
(pred_1 obj_14 obj_11)
(pred_1 obj_14 obj_03)
(pred_4 obj_02 obj_12)
(pred_4 obj_06 obj_05)
(pred_4 obj_13 obj_05)
(pred_4 obj_09 obj_12)
)
(:goal
(and
(pred_4 obj_02 obj_12)
(pred_4 obj_06 obj_12)
(pred_4 obj_13 obj_12)
(pred_4 obj_09 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_10)))
)
)