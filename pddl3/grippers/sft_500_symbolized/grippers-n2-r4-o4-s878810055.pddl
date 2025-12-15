(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_03 obj_13 obj_14 obj_05 - type_3
obj_06 obj_08 obj_01 obj_11 - type_2
obj_09 obj_12 obj_02 obj_07 - object)
(:init
(pred_3 obj_04 obj_01)
(pred_1 obj_04 obj_03)
(pred_1 obj_04 obj_13)
(pred_3 obj_10 obj_06)
(pred_1 obj_10 obj_14)
(pred_1 obj_10 obj_05)
(pred_2 obj_09 obj_11)
(pred_2 obj_12 obj_11)
(pred_2 obj_02 obj_06)
(pred_2 obj_07 obj_08)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_12 obj_08)
(pred_2 obj_02 obj_11)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_11)))
)
)