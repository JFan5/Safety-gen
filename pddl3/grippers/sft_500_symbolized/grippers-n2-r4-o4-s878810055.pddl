(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_01 obj_03 obj_05 obj_07 - type_2
obj_10 obj_08 obj_13 obj_11 - type_3
obj_02 obj_04 obj_12 obj_14 - object)
(:init
(pred_4 obj_09 obj_13)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_03)
(pred_4 obj_06 obj_10)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_07)
(pred_1 obj_02 obj_11)
(pred_1 obj_04 obj_11)
(pred_1 obj_12 obj_10)
(pred_1 obj_14 obj_08)
)
(:goal
(and
(pred_1 obj_02 obj_10)
(pred_1 obj_04 obj_08)
(pred_1 obj_12 obj_11)
(pred_1 obj_14 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_11)))
)
)