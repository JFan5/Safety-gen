(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_09 obj_12 obj_03 obj_06 - type_2
obj_14 obj_10 obj_13 obj_01 - type_3
obj_04 obj_02 obj_11 obj_08 - object)
(:init
(pred_1 obj_05 obj_14)
(pred_3 obj_05 obj_09)
(pred_3 obj_05 obj_12)
(pred_1 obj_07 obj_14)
(pred_3 obj_07 obj_03)
(pred_3 obj_07 obj_06)
(pred_2 obj_04 obj_14)
(pred_2 obj_02 obj_14)
(pred_2 obj_11 obj_13)
(pred_2 obj_08 obj_13)
)
(:goal
(and
(pred_2 obj_04 obj_10)
(pred_2 obj_02 obj_01)
(pred_2 obj_11 obj_14)
(pred_2 obj_08 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_13)))
)
)