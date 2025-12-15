(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_2
obj_06 obj_04 obj_09 obj_01 - type_3
obj_10 obj_08 obj_03 obj_13 - type_1
obj_14 obj_05 obj_02 obj_12 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_04)
(pred_4 obj_11 obj_08)
(pred_2 obj_11 obj_09)
(pred_2 obj_11 obj_01)
(pred_1 obj_14 obj_10)
(pred_1 obj_05 obj_13)
(pred_1 obj_02 obj_03)
(pred_1 obj_12 obj_08)
)
(:goal
(and
(pred_1 obj_14 obj_03)
(pred_1 obj_05 obj_08)
(pred_1 obj_02 obj_08)
(pred_1 obj_12 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_03)))
)
)