(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_02 - type_1
obj_09 obj_03 obj_11 obj_06 - type_2
obj_04 obj_08 obj_12 obj_01 - type_3
obj_05 obj_07 obj_13 obj_10 - object)
(:init
(pred_1 obj_14 obj_12)
(pred_2 obj_14 obj_09)
(pred_2 obj_14 obj_03)
(pred_1 obj_02 obj_12)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_06)
(pred_3 obj_05 obj_01)
(pred_3 obj_07 obj_08)
(pred_3 obj_13 obj_01)
(pred_3 obj_10 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_08)
(pred_3 obj_07 obj_01)
(pred_3 obj_13 obj_08)
(pred_3 obj_10 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_14 obj_01)))
)
)