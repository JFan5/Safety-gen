(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_3
obj_08 obj_14 obj_09 obj_03 - type_2
obj_02 obj_12 obj_10 obj_01 - type_1
obj_11 obj_13 obj_04 obj_07 - object)
(:init
(pred_4 obj_05 obj_10)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_14)
(pred_4 obj_06 obj_01)
(pred_3 obj_06 obj_09)
(pred_3 obj_06 obj_03)
(pred_1 obj_11 obj_01)
(pred_1 obj_13 obj_10)
(pred_1 obj_04 obj_01)
(pred_1 obj_07 obj_01)
)
(:goal
(and
(pred_1 obj_11 obj_12)
(pred_1 obj_13 obj_10)
(pred_1 obj_04 obj_10)
(pred_1 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_01)))
)
)