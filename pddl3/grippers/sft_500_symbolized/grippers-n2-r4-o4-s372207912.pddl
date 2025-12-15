(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_04 - type_2
obj_06 obj_13 obj_05 obj_08 - type_3
obj_03 obj_07 obj_10 obj_11 - type_1
obj_02 obj_12 obj_01 obj_14 - object)
(:init
(pred_2 obj_09 obj_10)
(pred_1 obj_09 obj_06)
(pred_1 obj_09 obj_13)
(pred_2 obj_04 obj_10)
(pred_1 obj_04 obj_05)
(pred_1 obj_04 obj_08)
(pred_3 obj_02 obj_03)
(pred_3 obj_12 obj_07)
(pred_3 obj_01 obj_10)
(pred_3 obj_14 obj_07)
)
(:goal
(and
(pred_3 obj_02 obj_03)
(pred_3 obj_12 obj_07)
(pred_3 obj_01 obj_11)
(pred_3 obj_14 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_09 obj_11)))
)
)